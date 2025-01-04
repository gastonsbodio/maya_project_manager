""" instructions: place Anim_Transference_tool_sk.py file and 'transferAnimTool.ui' on maya script folder, 
    copy the 8th lines bellow  and paste it on script editor (python tab)
    (take out the hashtag chars)
    use a character referenced scene
"""

"""    Animation transfering tool """

import sys
import os
import json
import os
import subprocess
si = subprocess.STARTUPINFO()
import tempfile
try:
    import maya.mel as mel
    import pymel.core as pm
    import maya.cmds as cmds
    import maya.OpenMayaUI as mui
    from shiboken2 import wrapInstance
except Exception:
    pass
try:
    from PySide2.QtUiTools import QUiLoader
    from PySide2 import QtCore
    from PySide2.QtGui import *
    from PySide2.QtWidgets import *
except Exception:
    from PySide6.QtUiTools import QUiLoader
    from PySide6 import QtCore
    from PySide6.QtGui import *
    from PySide6.QtWidgets import *

import importing_modules as im
de = im.importing_modules( 'definitions' )
ev = im.importing_modules( 'enviroment' )
hlp = im.importing_modules( 'helper' )
hlp_manager = im.importing_modules( 'manager_tools.hlp_manager' )
try:
    import maya_conn.maya_custom_cmd as com
    #com = im.importing_modules( 'maya_conn.maya_custom_cmd' )
except Exception:
    com = None
TEMP_FOL = tempfile.gettempdir().replace("\\","/") + "/"
UI_ANIM_FOL = [ de.SCRIPT_MANAG_FOL.replace('\\','/') + de.ANIM_FOL_FILES  ]
ROOT = 'C:/dev/'
STATUS_RED = 'not started'
STATUS_YELLOW = 'in proccess'
STATUS_GREEN = 'done'
STATUS_HIDED = 'old_finished'
DICC_FPS = { "ntsc" : "30" , "game" : "15",
                      "23.976fps" : "23.976", "film" : "24", "pal" : "25" ,
                      "show" : "48", "palf": "50", "ntscf": "60"
                     }
FPS = 'ntsc'
SCENE_RANGE = 'scene_range'
CUSTOM_RANGE = 'custom_range'

DOMO_PATH = de.SCRIPT_MANAG_FOL.replace('\\','/') + de.ANIM_FOL_FILES+'domo.ma'
##########

def set_start_end(  checkBox , linEStart, lineEEnd ):
    signalKey = True
    start_value = int(cmds.playbackOptions( minTime=True, q=True ))
    end_value = int(cmds.playbackOptions( maxTime=True, q=True ))
    return start_value , end_value, signalKey

class batchRenderAnim( QMainWindow):#QDialog ):
    #parent=QApplication.activeWindow()
    def __init__( self  ,loader = None , bin_fol = ''):
        super(batchRenderAnim, self).__init__( )
        if loader == None:
            loader = QUiLoader()
        self.bin_fol = bin_fol
        self.centralLayout = QVBoxLayout(self)
        self.centralLayout.setContentsMargins(0, 0, 0, 0)
        self.setWindowTitle("Batch Render Anim Tool")
        for script_path in  UI_ANIM_FOL :
            try:
                uifile = QtCore.QFile(os.path.join(script_path, de.BATCH_RENDER_ANIM_UI))
                uifile.open(QtCore.QFile.ReadOnly)
                self.ui = loader.load( uifile , None )#ev.getWindow(QWidget) )
                break
            except Exception as err:
                print ('try loading ui')
                print( err )  
        self.centralLayout.addWidget(self.ui)
        self.setGeometry(0, 0, 780, 535)
        self.initialize_widget_conn()


    def initialize_widget_conn(self):
        """Initializing functions, var and features.
        """
        self.ui.pushBut_open_anim_fi.clicked.connect( lambda: self.set_anim_fol_file( signal = 1) ) 
        self.ui.pushBut_open_dir.clicked.connect( lambda: self.set_anim_fol_file(signal = 2) ) 

        self.ui.pushBut_add_to_render_queue.clicked.connect( self.add_opened_2_queue )
        self.ui.radioButt_fulll_timeline.setChecked( True )
        self.ui.checkBFbatchmode.setChecked( True)
        self.ui.checkBFbatchmode.setEnabled( False )
        self.ui.comboB_fps.addItems( list ( DICC_FPS.keys() ) )
        self.ui.comboB_mayaVersion.addItems( ['current','2022', '2023','2024'] )
        self.ui.comboB_resolution.addItems( ['1280x720'] )
        self.ui.comboB_format.addItems( ['mp4', 'avi', 'mov'] )
        self.ui.pushBut_launch_qued_anims.clicked.connect( self.launch_batch_render_anim )
        self.ui.comboB_fps.currentIndexChanged.connect( self.combo_change_ac )
        self.ui.comboB_mayaVersion.currentIndexChanged.connect( self.combo_change_ac )
        self.ui.comboB_resolution.currentIndexChanged.connect( self.combo_change_ac )
        self.ui.comboB_format.currentIndexChanged.connect( self.combo_change_ac )
        self.set_settings( )
        print ('              que ondis           5555555555555')
        #self.show()
        print ('              que ondis                44444444 ')


    def combo_change_ac( self ):
        """ComboB or other widget action triggered when user changes values on Jira logging
        Args:
            signal ([int]): [number for distinguish witch particular widget change you want to work with]
        """
        dicc = hlp.json2dicc_load( de.TEMP_FOL+de.BATCH_RENDER_TOOL_SETTING  )
        dicc['fps'] =  str( self.ui.comboB_fps.currentText() )
        dicc['maya_ver'] =  str( self.ui.comboB_mayaVersion.currentText() ) 
        dicc['resolu'] = str( self.ui.comboB_resolution.currentText()) 
        dicc['exten'] = str(self.ui.comboB_format.currentText() ) 
        hlp.metadata_dicc2json( de.TEMP_FOL+de.BATCH_RENDER_TOOL_SETTING  , dicc )

    def set_settings( self  ):
        dicc = hlp.json2dicc_load( TEMP_FOL + de.BATCH_RENDER_TOOL_SETTING )
        if dicc != {}:
            hlp_manager.set_logged_data_on_combo( self.ui.comboB_fps, dicc['fps'] )
            hlp_manager.set_logged_data_on_combo( self.ui.comboB_mayaVersion, dicc['maya_ver'] )
            hlp_manager.set_logged_data_on_combo( self.ui.comboB_resolution, dicc['resolu'] )
            hlp_manager.set_logged_data_on_combo( self.ui.comboB_format, dicc['exten'] )
            
    def get_settings( self ):
        dicc = {}
        dicc['fps'] =  str( self.ui.comboB_fps.currentText() )
        dicc['maya_ver'] =  str( self.ui.comboB_mayaVersion.currentText() ) 
        dicc['resolu'] = hlp.format_path( str( self.ui.comboB_resolution.currentText()) )
        dicc['exten'] = hlp.format_path( str(self.ui.comboB_format.currentText() ) )
        hlp.metadata_dicc2json( de.TEMP_FOL+de.BATCH_RENDER_TOOL_SETTING , dicc )

    def clear_list_widg( self ):
        self.ui.listV_ik_ctl.clear()
        
    def choose_selected(self):
        comtrol_ls_2ik =  [ str(self.ui.listV_ik_ctl.item(i).text()) for i in range(self.ui.listV_ik_ctl.count()) ]
        selection = self.ui.comboB_ik_ctl.currentText()
        if selection not in comtrol_ls_2ik:
            self.ui.listV_ik_ctl.addItem( selection )
 
    def radio_change( self , radio1 , radio2 , lineEdOff = False ):
        if radio1.isChecked():
            radio2.setChecked( False )
        if lineEdOff:
            self.ui.lineEd_start_f.setEnabled( False )
            self.ui.lineEd_end_f.setEnabled( False )
            self.ui.lineEd_start_f.setText( '0' )
            self.ui.lineEd_end_f.setText( '0' )
        else:
            self.ui.lineEd_start_f.setEnabled( True )
            self.ui.lineEd_end_f.setEnabled( True )
            self.ui.lineEd_start_f.setText( '0' )
            self.ui.lineEd_end_f.setText( '0' )
            
    def checking_is_anim_opened( self  , full_anim_path  ):
        if full_anim_path.endswith('.ma') or full_anim_path.endswith('.fbx') or full_anim_path.endswith('.FBX'):
            key = True
            animls =  [ str(self.ui.listV_open_anims.item(i).text()) for i in range(self.ui.listV_open_anims.count()) ]
            if animls == []:
                key = True
            else:
                for anim in animls:
                    if full_anim_path == anim:
                        key = False
            if key:
                self.ui.listV_open_anims.addItem( full_anim_path )


    def add_opened_2_queue( self  ):
        dicc = hlp.json2dicc_load( TEMP_FOL + METADATA_BATCH_RENDER )
        animls =  [ str( self.ui.listV_open_anims.item(i).text()) for i in range( self.ui.listV_open_anims.count())  ]
        tuple_ls = []
        for ani in animls:
            exten = '.'+ani.split('.')[-1]               
            name = ani.split('/')[-1].split( exten )[0]
            tuple_ls.append(  ( ani , STATUS_RED, name, {} )  )
            ####################  0       1        2     3
        dicc['anim_ls'] = tuple_ls
        hlp.metadata_dicc2json( TEMP_FOL + METADATA_BATCH_RENDER , dicc)
        self.ui.listV_que_anims.addItems( animls )


    def set_anim_fol_file( self , signal):
        if signal == 2:
            anim_ls = QFileDialog().getExistingDirectory(None, 'Set Anim Folder', ROOT, QFileDialog.ShowDirsOnly )
            listAnims = os.listdir( anim_ls + '/' )
            for anim in listAnims:
                self.checking_is_anim_opened(  anim_ls + '/' + anim  )
        elif signal == 1: 
            anim_fi = QFileDialog().getOpenFileName()[0]
            self.checking_is_anim_opened(  anim_fi  )

    def write_mayabatch_command_file( self  ):
        line =        "import maya.standalone\n"
        line = line + "maya.standalone.initialize(name='python')\n"
        line = line + "import maya.cmds as cmds\n"
        line = line + "import maya.mel as mel\n"
        line = line + "import sys\n"
        line = line + "import os\n"
        line = line + "cmds.loadPlugin('fbxmaya', quiet=True)\n"
        line = line + "sys.path.append( r'" + SCRIPT_FOL + "' )\n"
        for spath in UI_ANIM_FOL:
            line = line + "sys.path.append( r'" + spath + "' )\n"
        line = line + "import importing_modules as im\n"
        line = line + "att = im.importing_modules( 'area_tools.anim.batch_Render_Anim' )\n"   
        resolu = str( self.ui.comboB_resolution.currentText() )
        exten = str( self.ui.comboB_format.currentText() ) 
        fps = str( self.ui.comboB_fps.currentText() )
        line = line + "toolcommand = att.render_queue_anims( exten = '%s' , resolu = '%s' , " %( exten , resolu )
        line = line + " fps = '%s'  )\n"   %( fps)
        line = line + "print ('           initiatinh                      hhhhhhhhhh')\n"
        line = line + "toolcommand.batch_render_anim( )\n"
        return line

    def batch_procces ( self  ):
        python_file_na = 'render_app_batch'
        line = self.write_mayabatch_command_file( )
        hlp.create_python_file ( python_file_na , line )
        num = str(self.ui.comboB_mayaVersion.currentText())
        if num != 'current':
            mayabinpath = 'C:/Program Files/Autodesk/Maya'+num+'/bin'
        else:
            mayabinpath = self.bin_fol 
        batPythonExec = '@echo off\n'
        batPythonExec = batPythonExec + '"'+ mayabinpath.replace('/','\\') + '\\mayapy.exe" "'+de.USER_DOC.replace('/','\\')+'/'+python_file_na+'.py" \n'
        batPythonExec = batPythonExec + '@pause'
        with open( de.USER_DOC +'/'+"Execute_" + python_file_na + ".bat", "w") as fileFa:
            fileFa.write( batPythonExec )
            fileFa.close()
        #subprocess.Popen( [r'%sExecute_%s.bat'%( de.USER_DOC.replace('/','\\\\') +'\\'  , python_file_na ) ] )
        subprocess.call(["start", r'%sExecute_%s.bat'%( de.USER_DOC.replace('/','\\\\') +'\\'  , python_file_na ) ], shell=True )

    def launch_batch_render_anim( self  ):
        self.batch_procces ( )
        #self.add_opened_2_queue( )

class render_queue_anims():
    def __init__(self, checkBoxFullT = None, linEStart = None,
                 lineEEnd = None , exten = '', resolu = '' , fps = '' ):
        self.checkBox = checkBoxFullT
        self.linEStart = linEStart
        self.lineEEnd =  lineEEnd
        self.exten = exten
        self.resolu = resolu
        self.fps = fps

    def framing_focus( self , camera_shape ):
        pm.viewFit( camera_shape, all=True , f=50 )
        
    def shaders_ambient_set( self , color):
        materials_ls = cmds.ls( '*:*','*', type = 'lambert')
        materials_ls = materials_ls + cmds.ls( '*:*','*', type = 'phongE')
        materials_ls = materials_ls + cmds.ls( '*:*','*', type = 'blinn')
        materials_ls = materials_ls + cmds.ls( '*:*','*', type = 'phong')
        inc_col = 0.1500000000000000
        for shader in materials_ls:
            try:
                cmds.setAttr ( (shader+".ambientColor"), color[0], color[1], color[2], type = 'double3' ) 
                cmds.setAttr ( (shader+".incandescence"), inc_col, inc_col, inc_col, type = 'double3' ) 
            except Excetion:
                pass
    def camarera_selected( self , camera_shape):
        camera_ls = cmds.ls(type="camera")
        for cam in camera_ls:
            cmds.setAttr ( cam + ".rnd", 0)

        cmds.setAttr ( camera_shape + ".rnd", 1)

    def write_ffmpeg_edition( self , imput , output , w , h ):
        w_half = int ( w / 2 )
        h_half = int ( h / 2 )
        ffmpeg_path = de.PY3_PACKAGES + '\\nircmd\\'
        ffmpeg_line = '%sffmpeg -i %s -i %s -i %s -i %s -filter_complex ' %( ffmpeg_path, imput[0], imput[1], imput[2], imput[3] )
        ffmpeg_line = ffmpeg_line + '"nullsrc=size=%sx%s [base]; '%( str(w) , str(h) )
        ffmpeg_line = ffmpeg_line + '[0:v] setpts=PTS-STARTPTS, scale=%sx%s [upperleft]; ' %( str(w_half) , str(h_half) )
        ffmpeg_line = ffmpeg_line + '[1:v] setpts=PTS-STARTPTS, scale=%sx%s [upperright]; ' %( str(w_half) , str(h_half) )
        ffmpeg_line = ffmpeg_line + '[2:v] setpts=PTS-STARTPTS, scale=%sx%s [lowerleft]; ' %( str(w_half) , str(h_half) )
        ffmpeg_line = ffmpeg_line + '[3:v] setpts=PTS-STARTPTS, scale=%sx%s [lowerright]; ' %( str(w_half) , str(h_half) )
        ffmpeg_line = ffmpeg_line + '[base][upperleft] overlay=shortest=1 [tmp1]; '
        ffmpeg_line = ffmpeg_line + '[tmp1][upperright] overlay=shortest=1:x=%s [tmp2]; ' %( str(w_half) )
        ffmpeg_line = ffmpeg_line + '[tmp2][lowerleft] overlay=shortest=1:y=%s [tmp3]; ' %( str(h_half) )
        ffmpeg_line = ffmpeg_line + '[tmp3][lowerright] overlay=shortest=1:x=%s:y=%s" ' %( str(w_half) , str(h_half) )
        ffmpeg_line = ffmpeg_line + ' -c:v libx264 %s ' %( output )
        return ffmpeg_line

    def ffmpeg_procces ( self , imput, output , w , h  ):
        python_file_na = 'ffmpeg_proccess'
        line = self.write_ffmpeg_edition( imput , output , w , h )
        batPythonExec = '@echo off\n'
        batPythonExec = batPythonExec + line + '\n'
        for input_rend in imput:
            batPythonExec = batPythonExec +'del %s \n'%( input_rend.replace('/','\\') )
        with open( de.USER_DOC +'/'+"Execute_" + python_file_na + ".bat", "w") as fileFa:
            fileFa.write( batPythonExec  )
            fileFa.close()
        subprocess.Popen( [r'%sExecute_%s.bat'%( de.USER_DOC.replace('/','\\\\') +'\\'  , python_file_na ) ] )

    def prepare_framing( self , camera, meshes ):
        self.camarera_selected( camera )
        color = [  1.0000000000000000, 1.00000000000000000, 1.0000000000000000  ]
        cmds.setAttr( "domo:domo_root.visibility" , 0 )
        cmds.select ( meshes )
        self.framing_focus( camera )
        cmds.setAttr( "domo:domo_root.visibility" , 1 )
        cmds.select ( cl = True )
        cmds.setAttr("defaultRenderGlobals.currentRenderer", "mayaSoftware", type="string")
        self.shaders_ambient_set(color)

    def get_mesh( self , exten_ ):
        if exten_ == '.ma':
            for meshgrp in [  '*:mesh_grp', 'mesh_grp' , '*:*:mesh_grp' ]:
                try:
                    meshes = cmds.listRelatives ( meshgrp, ad = True, type = 'mesh' , f = True) or []
                    if meshes != []:
                        break
                except Exception:
                    meshes = []
        elif exten_ == '.fbx' or exten_ == '.FBX':
            meshes = cmds.ls ( '*', '*:*','*:*:*' ,type = 'mesh' , l = True) or []
        return meshes
                
    def get_ls_frames( self, start , end ):
        listaF = [ start ]
        keyFinishRange = True
        value = start
        while keyFinishRange:
            value = value+1
            listaF.append(value)
            if value == end:
                keyFinishRange = False
        return listaF

    def get_start_end ( self ):
        start = int(cmds.playbackOptions( minTime=True, q =True ))
        end = int(cmds.playbackOptions( maxTime=True, q =True ))
        return  start , end
    
    def batch_render_anim( self ):
        dicc = hlp.json2dicc_load( TEMP_FOL + METADATA_BATCH_RENDER )
        anim_tuple_ls = dicc ['anim_ls'] 
        w = int(self.resolu.split('x')[0])#1280
        h = int(self.resolu.split('x')[1])#720
        #####  fps defualt ####
        vs = self.fps
        ####    ########    #####
        timeLineRange = SCENE_RANGE
        type = 'avi'
        cmds.file(  new = True , force = True )
        for idx, anim in enumerate (anim_tuple_ls):
            if os.path.isfile(anim[0]):
                start , end = self.get_start_end (  )
                listaF = self.get_ls_frames( start, end )
                exten_f = '.'+anim[0].split('.')[-1]  
                output = anim[0].replace( exten_f, '' )
                if exten_f == '.ma':
                    dupli_na , ref_ls = hlp_manager.rewrite_maya_fi_striping_unused_plugins( anim[0] , '_dupli')
                else :
                    dupli_na , ref_ls = ( anim[0] , [] )
                for ref in ref_ls:
                    if ref.endswith('.ma'):
                        dupli_ref_na , ref_ref_ls =hlp_manager.rewrite_maya_fi_striping_unused_plugins( ref , '_dupli.ma')
                cmds.file( dupli_na, i =True , force = True )
                cmds.currentUnit( time=vs)
                meshes = self.get_mesh( exten_f )
                cmds.file( DOMO_PATH, r=True, type='mayaAscii', namespace='domo' )
                side_dupli = cmds.duplicate( 'side')
                cmds.setAttr( side_dupli[0] + ".rotateY" ,-90)
                imput_ls = []
                for camera in [ 'perspShape', 'frontShape', 'sideShape' , side_dupli[0] ]:
                    self.prepare_framing( camera, meshes)
                    camera_output = output + '_' + camera.replace('Shape','') + '.avi'
                    imput_ls.append( camera_output )
                    cmds.playblast( format = type, f = camera_output , h = h, w = w, frame = listaF , 
                                viewer = False, orn = True, fp = 4, fo = True, p = 100, qlt = 100 )
                imput_ls.append( dupli_na )
                output_path, file_na  = hlp.separate_path_and_na( output + '.'+ self.exten )
                if exten_f == '.ma':
                    output_path = output_path.split( '/Anims/')[0] + '/Renders/'
                full_ouput_path =  output_path + file_na 
                if not os.path.exists( output_path):
                    os.makedirs( output_path )
                self.ffmpeg_procces (  imput_ls ,full_ouput_path , w , h  )
                dicc ['anim_ls'][idx][1] = STATUS_GREEN
                hlp.metadata_dicc2json( TEMP_FOL + METADATA_BATCH_RENDER , dicc)
                cmds.file(  new = True , force = True )
                try:
                    os.remove( dupli_ref_na )
                except Exception:
                    pass
                
if True: #ev.ENVIROMENT == 'Windows':
    print ('                        que ondis           3333' )
    ###   manager launch  ####
    #import manager_tools.jira_project_manager as jiraM
    loader = QUiLoader()
    #QCoreApplication.setAttribute(Qt.AA_ShareOpenGLContexts)
    
    if not QApplication.instance():
        app = QApplication(sys.argv)
    else:
        app = QApplication.instance()
    
    
    #app = QApplication(sys.argv)
    #app = QApplication.instance()
    print ('                          que ondis    2222' )
    widget = batchRenderAnim( )#loader = loader)
    widget.ui.show()
    sys.exit(app.exec())
                
