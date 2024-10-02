""" instructions: place Anim_Transference_tool_sk.py file and 'transferAnimTool.ui' on maya script folder, 
    copy the 8th lines bellow  and paste it on script editor (python tab)
    (take out the hashtag chars)
    use a character referenced scene
"""

"""    Animation transfering tool """
#from importlib import reload
#import area_tools.anim.Anim_Transference_tool_sk as att
#reload(att)
#widget = att.animTransference()


"""    FK - IK matcher script isolated """
#from importlib import reload
#import area_tools.anim.Anim_Transference_tool_sk as att
#reload(att)
#att.ik_copying_animation()

import sys
import os
import json
import os
import subprocess
si = subprocess.STARTUPINFO()
import maya.mel as mel
import tempfile
import maya.cmds as cmds
import maya.OpenMayaUI as mui
from shiboken2 import wrapInstance

from PySide2.QtUiTools import QUiLoader
from PySide2 import QtCore
from PySide2.QtGui import *
from PySide2.QtWidgets import *

import ctypes
from ctypes.wintypes import MAX_PATH
dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
	USER_DOC = buf.value
SCRIPT_FOL = USER_DOC + "\\company_tools\\jira_manager"
sys.path.append(SCRIPT_FOL)
import importing_modules as im
de = im.importing_modules( 'definitions' )

MAYA_FOL = USER_DOC + "\\maya"
MAYA_FOL = MAYA_FOL.replace('\\','/')
for path in sys.path:
    if "Maya2020" in path :
        MAYA_VER = '2020'
        break
    elif "Maya2021" in path :
        MAYA_VER = '2021'
        break
    elif "Maya2022" in path :
        MAYA_VER = '2022'
        break
    elif "Maya2023" in path :
        MAYA_VER = '2023'
        break
    elif "Maya2024" in path :
        MAYA_VER = '2024'
        break
    elif "Maya2025" in path :
        MAYA_VER = '2025'
        break

TEMP_FOL = tempfile.gettempdir().replace("\\","/") + "/"
UI_ANIM_FOL = [ de.SCRIPT_MANAG_FOL.replace('\\','/') + de.ANIM_FOL_FILES  ]
ROOT = 'C:/dev/'
SKELETON = 'skeleton.ma'
ANIM_RIG_EXP = 'anim_rig_exporter.ma'
COG_CONTROL = 'pelvis'
TRANSFERENCE_FOL = "exported"
FPS = 'ntsc'
METADATA_ANIM_TRANSF = "anim_transfer.json"
##########
LIMBS_CTL_LS = ['Arm_R' ,'Arm_L','Leg_R', 'Leg_L']
DICC_M = { 'Cog':'pelvis' , 'FKSpine1':'spine_01' , 'FKSpine2':'spine_02' , 'FKSpine3':'spine_03' , 'FKSpine4':'spine_04',
  'FKChest':'spine_05' , 'FKNeck' : 'neck_01', 'FKHead':'head',  'FKJaw' : 'jaw' , 'FKNeck1': 'neck_02'}
DICC_MIRROR = { 'FKIndexFinger1': 'index_01', 'FKIndexFinger2': 'index_02' , 'FKIndexFinger3': 'index_03',
  'FKMiddleFinger1' : 'middle_01', 'FKMiddleFinger2' : 'middle_02', 'FKMiddleFinger3' : 'middle_03',
  'FKRingFinger1' : 'ring_01',  'FKRingFinger2' : 'ring_02',  'FKRingFinger3' : 'ring_03', 
  'FKPinkyFinger1' : 'pinky_01', 'FKPinkyFinger2' : 'pinky_02', 'FKPinkyFinger3' : 'pinky_03',  
  'FKThumbFinger1' : 'thumb_01',  'FKThumbFinger2' : 'thumb_02', 'FKThumbFinger3' : 'thumb_03',
  'BendElbow2' :  [ 'lowerarm_twist_02', 'lowerarm_twist_01' ] ,
  'FKScapula': 'clavicle',  'FKShoulder':'upperarm', 'FKElbow' : 'lowerarm',
  'FKWrist': 'hand' , 'FKPinkyMetacarpal1' : 'pinky_metacarpal',  'FKMiddleMetacarpal1' : 'middle_metacarpal', 
  'FKIndexMetacarpal1':'index_metacarpal', 'FKRingMetacarpal1' : 'ring_metacarpal',
  'FKHip':'thigh', 'FKKnee': 'calf',
  'FKAnkle': 'foot', 'FKToes': 'ball',
  'FKEye': 'eye'}

def json2dicc_load( path ):
    """Read a json dicc and return a python dicc
    Args:
        path ([str]): [json file path]
    Returns:
        [dicc]: [description]
    """
    dicc = {}
    if os.path.isfile( path ):
        with open( path) as fileFa:
            dicc = json.load(fileFa)
            fileFa.close()
    return dicc

def initialize_ls( switcher ):
    if 'dragon' not in switcher:
        comtrol_ls_2ik = [ [ '*:FKIKArm_L','*:FKScapula_L','*:PoleArm_L','*:IKArm_L', '*:FKWrist_L'] ,
                                ['*:FKIKArm_R','*:FKScapula_R','*:PoleArm_R','*:IKArm_R', '*:FKWrist_R'] ,
            ['*:FKIKLeg_L','*:PoleLeg_L','*:RollHeel_L', '*:IKToes_L', '*:RollToes_L', '*:RollToesEnd_L' , 
            '*:IKLeg_L' ,'*:FKAnkle_L'],
            ['*:FKIKLeg_R','*:PoleLeg_R','*:RollHeel_R', '*:IKToes_R', '*:RollToes_R', '*:RollToesEnd_R' , 
            '*:IKLeg_R' ,'*:FKAnkle_R'] ]
        comtrol_ls_2fk = [ ['*:FKIKArm_L','*:FKScapula_L','*:FKShoulder_L','*:FKElbow_L', '*:FKWrist_L' ,'*:IKArm_L'] ,
                        ['*:FKIKArm_R','*:FKScapula_R','*:FKShoulder_R','*:FKElbow_R', '*:FKWrist_R' ,'*:IKArm_R'] ,
                        ['*:FKIKLeg_L','*:FKHip_L', '*:FKKnee_L', '*:FKAnkle_L', '*:FKToes_L', '*:IKLeg_L'],
                        ['*:FKIKLeg_R','*:FKHip_R', '*:FKKnee_R', '*:FKAnkle_R', '*:FKToes_R', '*:IKLeg_R'] ]
        
    else:
        comtrol_ls_2ik = [ [ '*:FKIKArm2_L','*:FKScapula1_L','*:PoleArm2_L','*:IKArm2_L', '*:FKWrist1_L'] ,
                                ['*:FKIKArm2_R','*:FKScapula1_R','*:PoleArm2_R','*:IKArm2_R', '*:FKWrist1_R'] ,
            ['*:FKIKLeg_L','*:PoleLeg_L', '*:RollToes1_L', '*:RollToes2_L' , '*:IKToes2_L',
            '*:IKLeg_L' ,'*:FKAnkle_L'],
            ['*:FKIKLeg_R','*:PoleLeg_R', '*:RollToes1_R', '*:RollToes2_R' , '*:IKToes2_R',
            '*:IKLeg_R' ,'*:FKAnkle_R'] ]
        comtrol_ls_2fk = [ ['*:FKIKArm2_L','*:FKScapula1_L','*:FKShoulder1_L','*:FKElbow1_L', '*:FKWrist1_L' ,'*:IKArm2_L'] ,
                        ['*:FKIKArm2_R','*:FKScapula1_R','*:FKShoulder1_R','*:FKElbow1_R', '*:FKWrist1_R' ,'*:IKArm2_R'] ,
                        ['*:FKIKLeg_L','*:FKHip_L', '*:FKKnee_L', '*:FKAnkle_L', '*:FKToes1_L', '*:IKLeg_L'],
                        ['*:FKIKLeg_R','*:FKHip_R', '*:FKKnee_R', '*:FKAnkle_R', '*:FKToes1_R', '*:IKLeg_R'] ]
    return comtrol_ls_2ik, comtrol_ls_2fk

def set_start_end(   control , checkBox , linEStart, lineEEnd ):
    signalKey = True
    try:
        key_ui=True
        if checkBox.isChecked():
            isChecked = True
        else:
            isChecked = False
    except Exception as err:
        key_ui = False
        isChecked = True
    if isChecked and key_ui:
        try:
            control = cmds.ls( control )[0]
            start_value = int( cmds.keyframe( control , query=True, timeChange=True )[0] )
            end_value = int( cmds.keyframe( control  , query=True, timeChange=True )[-1] ) + 1
        except Exception:
            start_value = int(cmds.playbackOptions( minTime=True, q=True ))
            end_value = int(cmds.playbackOptions( maxTime=True, q=True ))
    elif isChecked == True  and key_ui == False:
        start_value = int( cmds.keyframe( control , query=True, timeChange=True )[0] )
        end_value = int( cmds.keyframe( control  , query=True, timeChange=True )[-1] ) + 1
    elif  isChecked == False  and key_ui == True:
        signalKey = False
        start_value = int( linEStart.text() ) - 1
        end_value = int(  lineEEnd.text()  ) + 1
    return start_value , end_value, signalKey



def getWindow():
    pointer = mui.MQtUtil.mainWindow()
    if pointer is not None:
        try:
            return wrapInstance(long(pointer), QWidget)
        except Exception:
            return wrapInstance(int(pointer), QWidget)


class animTransference(QDialog):
    def __init__( self, *args ,parent=getWindow() ):
        super(animTransference, self).__init__(parent)
        loader = QUiLoader()
        self.centralLayout = QVBoxLayout(self)
        self.centralLayout.setContentsMargins(0, 0, 0, 0)
        self.setWindowTitle("Animation Transference Tool")
        for script_path in  UI_ANIM_FOL :
            try:
                uifile = QtCore.QFile(os.path.join(script_path, de.TRANSF_ANIM_T_UI))
                uifile.open(QtCore.QFile.ReadOnly)
                self.ui = loader.load(uifile)
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
        dicc = json2dicc_load( TEMP_FOL + METADATA_ANIM_TRANSF )
        if dicc == {}:
            dicc ['rig_path'] = ''
            dicc ['skeleton_path'] = ''
            dicc ['anim_fol_path'] = ''
        self.ui.lineEd_setUpPath.setEnabled( False )
        try:
            self.ui.lineEd_setUpPath.setText( dicc ['rig_path']  )
            rig_path = dicc ['rig_path']
            name_rig = rig_path.split('/')[-1]
            path_rig = rig_path.split(name_rig)[0]
        except Exception:
            path_rig = '/'
            self.ui.lineEd_setUpPath.setText( ''  )
        if os.path.isfile( os.path.join( path_rig, SKELETON )):
            self.ui.lab_skelPath.setText( path_rig + SKELETON )
        if os.path.isfile(os.path.join( path_rig, ANIM_RIG_EXP )):
            self.ui.lab_anim_rig_exported.setText( path_rig + ANIM_RIG_EXP )
        self.ui.lineEd_amimFolder.setEnabled(False)
        try:
            self.ui.lineEd_amimFolder.setText( dicc ['anim_fol_path']  )
        except Exception:
            self.ui.lineEd_amimFolder.setText( '' )
        self.ui.pushBut_setupPAth.clicked.connect( self.set_rig_file )  
        self.ui.pushBut_generateSkell.clicked.connect( self.create_skel_file )
        self.ui.pushBut_animFolder.clicked.connect( self.set_anim_fol_file ) 
        self.ui.pushBut_createAssembly.clicked.connect( self.create_anim_rig_exporter ) 
        self.ui.pushBut_runAnimTransf.clicked.connect( self.batch_transfer_anim )
        self.ui.radioButt_fulll_timeline.clicked.connect( 
                    lambda : self.radio_change( self.ui.radioButt_fulll_timeline, self.ui.radioButt_set_timeline ,
                                                lineEdOff = True) ) 
        self.ui.radioButt_set_timeline.clicked.connect( 
                    lambda : self.radio_change( self.ui.radioButt_set_timeline, self.ui.radioButt_fulll_timeline,
                                                lineEdOff = False ) )
        self.ui.radioButt_fulll_timeline.setChecked( True)
        self.ui.lineEd_start_f.setEnabled( False )
        self.ui.lineEd_end_f.setEnabled( False )
        self.ui.lineEd_start_f.setText( '0' )
        self.ui.lineEd_end_f.setText( '0' )
        self.ui.pushBut_fk_ik.clicked.connect(  self.set_limbs_2_ik )
        self.ui.pushBut_ik_fk.clicked.connect(  self.set_limbs_2_fk )
        self.ui.pushBut_choose_all.clicked.connect(  self.choose_all_limbs_action )
        self.ui.pushBut_choose_sel.clicked.connect(  self.choose_selected )
        self.ui.pushBut_clear_qw.clicked.connect(  self.clear_list_widg )
        
        self.ui.comboB_ik_ctl.addItems( LIMBS_CTL_LS )
        self.ui.comboB_switch_template.addItems( self.generate_switch_tampla_ls() )
        self.show()

    def generate_switch_tampla_ls( self ):
        templates_fi = []
        for path_ in UI_ANIM_FOL:
            files_ls = os.listdir( path_ )
            for filee in files_ls:   
                if filee.startswith('ik_fk_switch_'):
                    if filee.endswith('.py') or filee.endswith('.pyc'):
                        templates_fi.append( filee.split('.py')[0] )
        return templates_fi

    def clear_list_widg( self ):
        self.ui.listV_ik_ctl.clear()

    def choose_all_limbs_action(self):
        comtrol_ls_2ik =  [ str(self.ui.listV_ik_ctl.item(i).text()) for i in range(self.ui.listV_ik_ctl.count()) ]
        for item in LIMBS_CTL_LS:
            if item not in comtrol_ls_2ik:
                self.ui.listV_ik_ctl.addItem( item )
        
    def choose_selected(self):
        comtrol_ls_2ik =  [ str(self.ui.listV_ik_ctl.item(i).text()) for i in range(self.ui.listV_ik_ctl.count()) ]
        selection = self.ui.comboB_ik_ctl.currentText()
        if selection not in comtrol_ls_2ik:
            self.ui.listV_ik_ctl.addItem( selection )
        
    def set_limbs_2_ik( self ):
        limbs_ctl_ls =  [ str(self.ui.listV_ik_ctl.item(i).text()) for i in range(self.ui.listV_ik_ctl.count()) ]
        check_ = self.ui.radioButt_fulll_timeline
        lineE_start = self.ui.lineEd_start_f
        lineE_end = self.ui.lineEd_end_f       
        selection = self.ui.comboB_switch_template.currentText()
        matcher = ik_copying_animation(  limbs_ctl_ls , ui =  self.ui , selected_switcher = selection,
                                       checkBoxFullT = check_, linEStart = lineE_start, lineEEnd = lineE_end )
        matcher.set_limbs_2_ik() 
        
    def set_limbs_2_fk( self ):
        check_ = self.ui.radioButt_fulll_timeline
        lineE_start = self.ui.lineEd_start_f
        lineE_end = self.ui.lineEd_end_f       
        selection = self.ui.comboB_switch_template.currentText()
        limbs_ctl_ls =  [ str(self.ui.listV_ik_ctl.item(i).text()) for i in range(self.ui.listV_ik_ctl.count()) ]
        matcher = ik_copying_animation(  limbs_ctl_ls , selected_switcher = selection,
                                       checkBoxFullT = check_, linEStart = lineE_start, lineEEnd = lineE_end )
        self.amount = matcher.set_limbs_2_fk() 
        
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
            
            
    def metadata_dicc2json( self, path, dicc ):
        """Creates a json file from a givem dicctionary
        Args:
            path ([str]): [json file path ]
            dicc ([dicc obj]): [description]
        """
        json_object = json.dumps( dicc, indent = 2 ) 
        with open( path, 'w') as fileFa:
            fileFa.write( str(json_object) )
            fileFa.close()
        
    
    def set_rig_file(self):
        old_rig_path = self.ui.lineEd_setUpPath.text()
        dicc = json2dicc_load( TEMP_FOL + METADATA_ANIM_TRANSF )
        rig_path = QFileDialog().getOpenFileName()[0]
        dicc ['rig_path'] = rig_path 
        self.metadata_dicc2json( TEMP_FOL + METADATA_ANIM_TRANSF , dicc)
        self.ui.lineEd_setUpPath.setText( rig_path )

        if old_rig_path != rig_path:
            self.ui.lineEd_amimFolder.setText( '' )
        
        name_rig = rig_path.split('/')[-1]
        path_rig = rig_path.split(name_rig)[0]
        if os.path.isfile( os.path.join( path_rig, SKELETON )):
            self.ui.lab_skelPath.setText( path_rig + SKELETON )
        else:
            self.ui.lab_skelPath.setText( '' )
        
        if os.path.isfile(os.path.join( path_rig, ANIM_RIG_EXP )):
            self.ui.lab_anim_rig_exported.setText( path_rig + ANIM_RIG_EXP )
        else:
            self.ui.lab_anim_rig_exported.setText( '' )


    def break_connection( self, control  , axe_ls ,transf_ls = ['t','r','s']):
        for axe in axe_ls:
            for transf in transf_ls:
                try:
                    mel.eval( 'source channelBoxCommand;CBdeleteConnection "%s.%s%s";'%( control, transf, axe ) )
                except Exception:
                    pass

    def create_skel_file(self):
        dicc = json2dicc_load( TEMP_FOL + METADATA_ANIM_TRANSF )
        rig_path = dicc ['rig_path']
        cmds.file( rig_path, o =True , force = True )
        name_rig = rig_path.split('/')[-1]
        path_rig = rig_path.split(name_rig)[0]
        path_skeleton = path_rig+SKELETON
        cmds.file( rename = path_skeleton )
        cmds.file( s=True, type='mayaAscii', force = True )
        joint_list = cmds.listRelatives('root', ad=True, type = 'joint' ) + ['root']
        for joint in joint_list:
            self.break_connection(  joint  , ['x','y','z'] ,transf_ls = ['t','r','s'])
        script_nodes = cmds.ls( '*matcher', 'script_rot*', type='script' )
        cmds.delete ('Group', 'mesh_grp', script_nodes )
        self.ui.lab_skelPath.setText( path_skeleton  )
        dicc ['skeleton_path'] = path_skeleton 
        self.metadata_dicc2json( TEMP_FOL + METADATA_ANIM_TRANSF , dicc)
        cmds.delete( cmds.ls(type='displayLayer') )
        cmds.file( s=True, type='mayaAscii', force = True )
        cmds.file( new=True, force = True )

    def create_anim_rig_exporter( self ):
        cmds.file( new=True, force = True )
        dicc = json2dicc_load( TEMP_FOL + METADATA_ANIM_TRANSF )
        rig_path = dicc ['rig_path']
        name_rig = rig_path.split('/')[-1]
        path_rig = rig_path.split( name_rig )[0]
        cmds.file( rename = path_rig+ANIM_RIG_EXP )
        cmds.file( rig_path, r=True, type='mayaAscii', namespace='asset_rig' )
        cmds.file( path_rig+SKELETON , r=True, type='mayaAscii', namespace='skeleton' )
        self.constraining_rig( )
        cmds.file( s=True, type='mayaAscii', force = True )
        cmds.file( new=True, force = True )
        self.ui.lab_anim_rig_exported.setText( path_rig+ANIM_RIG_EXP )

    def set_anim_fol_file( self ):
        dicc = json2dicc_load( TEMP_FOL + METADATA_ANIM_TRANSF )
        anim_fol_path = QFileDialog().getExistingDirectory(None, 'Set Anim Folder', ROOT, QFileDialog.ShowDirsOnly )
        dicc ['anim_fol_path'] = anim_fol_path + '/'
        self.metadata_dicc2json( TEMP_FOL + METADATA_ANIM_TRANSF , dicc)
        self.ui.lineEd_amimFolder.setText( anim_fol_path + '/')

    def constraining_rig( self ):
        cmds.namespace(setNamespace=':')
        all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True) if x != "UI" and x != "shared"]
        for namespace in all_namespaces:
            for key in DICC_M:
                try:
                    control = cmds.ls ( '*:' + key + '_M' , '*:' + key )[0]
                except Exception:
                    control = ''
                if namespace not in control:
                    try:
                        cmds.parentConstraint ( namespace +':'+ DICC_M[key] , control ,  mo = True )
                        cmds.scaleConstraint ( namespace +':'+ DICC_M[key] , control , mo = True ) 
                    except Exception:
                        pass
            for key in DICC_MIRROR:
                for side in ['L','R']:
                    control_ls = cmds.ls ( '*:' + key + '_'+side )
                    if control_ls != []:
                        control = control_ls[0]
                        if 'list'  not in str(type( DICC_MIRROR[key] )):
                            driver_joint = namespace +':'+ DICC_MIRROR[key]+'_'+side.lower() 
                        else:
                            driver_joint = []
                            for base_na in DICC_MIRROR[key]:
                                try:
                                    joint = cmds.ls ( namespace +':'+base_na+'_'+side.lower() ) [0]
                                except Exception:
                                    joint = []
                                driver_joint.append( joint )
                        if namespace not in control:
                            try:
                                cmds.parentConstraint ( driver_joint , control ,  mo = True )
                                cmds.scaleConstraint ( driver_joint , control , mo = True ) 
                                print ('parenting done')
                            except Exception:
                                pass
    
    def delete_namespace (self ):
        cmds.namespace(setNamespace=':')
        all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True) if x != "UI" and x != "shared"]
        if all_namespaces:
            all_namespaces.sort(key=len, reverse=True)
            for namespace in all_namespaces:
                if cmds.namespace(exists=namespace) is True:
                    cmds.namespace(removeNamespace=namespace, mergeNamespaceWithRoot=True)

    def import_reference( self , path_dir = ''  ):
        listAnims = os.listdir( path_dir )
        for anim in listAnims:
            if anim.endswith('.FBX') or anim.endswith('.fbx'):
                cmds.file( path_dir+anim, o =True , force = True )
                maya_na = anim.replace( '.FBX', '.ma' )
                cmds.file( rename = path_dir + 'new_version_' + maya_na)
                all_ref_paths = cmds.file( q=True, reference=True ) or []
                for ref_path in all_ref_paths:
                    if cmds.referenceQuery(ref_path, isLoaded=True): 
                        cmds.file(ref_path, importReference=True)
                self.delete_namespace()
                cmds.file( s=True, type='mayaAscii', force = True )


    def write_mayabatch_command_file( self  ):
        
        control_patt = "*:Cog"
        start_value , end_value, signalKey = set_start_end(  control_patt, 
                                                           self.ui.radioButt_fulll_timeline , self.ui.lineEd_start_f,
                                                           self.ui.lineEd_end_f )
        selection = self.ui.comboB_switch_template.currentText()
        bool_value = self.ui.checkBFKIK_matcher.isChecked()
        line =        "import maya.standalone\n"
        line = line + "maya.standalone.initialize(name='python')\n"
        line = line + "import maya.cmds as cmds\n"
        line = line + "import sys\n"
        line = line + "import os\n"
        line = line + "cmds.loadPlugin('fbxmaya', quiet=True)\n"
        line = line + "sys.path.append( r'" + SCRIPT_FOL + "' )\n"
        for spath in UI_ANIM_FOL:
            line = line + "sys.path.append( r'" + spath.replace('/','\\') + "' )\n"

        line = line + "import importing_modules as im\n"
        line = line + "att = im.importing_modules( 'Anim_Transference_tool_sk' )\n"   
 
        line = line + "toolcommand = att.transfer_anim_( key_checkBFKIK_matcher = %s ,"%str(bool_value)
        line = line + "selected_switcher = '%s' )\n" %selection
        line = line + "toolcommand.transfer_anim( )\n"
        return line


    def create_python_file( self , python_file_na , python_file_content ):
        with open( USER_DOC +'/'+ python_file_na + ".py", "w") as fileFa:
            fileFa.write( python_file_content )
            fileFa.close()

    def batch_procces (self ):
        python_file_na = 'python_batch'
        line = self.write_mayabatch_command_file( )
        self.create_python_file ( python_file_na , line )
        for pathh in sys.path:
            if pathh.endswith('bin'):
                mayabinpath = pathh
                break
        batPythonExec = '@echo off\n'
        batPythonExec = batPythonExec + '"'+ mayabinpath.replace('/','\\') + '\\mayapy.exe" "'+USER_DOC.replace('/','\\')+'/'+python_file_na+'.py" \n'
        batPythonExec = batPythonExec + 'pause 10'
        with open( USER_DOC +'/'+"Execute_" + python_file_na + ".bat", "w") as fileFa:
            fileFa.write( batPythonExec )
            fileFa.close()
        subprocess.Popen( [r'%sExecute_%s.bat'%( USER_DOC.replace('/','\\\\') +'\\'  , python_file_na ) ] )


    def batch_transfer_anim( self ):
        if self.ui.checkBFbatchmode.isChecked():
            self.batch_procces ()
        else:
            check_ = self.ui.radioButt_fulll_timeline
            lineE_start = self.ui.lineEd_start_f
            lineE_end = self.ui.lineEd_end_f       
            selection = self.ui.comboB_switch_template.currentText()
            bool_value = self.ui.checkBFKIK_matcher.isChecked()
            obj = transfer_anim_(  key_checkBFKIK_matcher = bool_value  , selected_switcher = selection, 
                                   checkBoxFullT = check_, linEStart = lineE_start, lineEEnd = lineE_end )
            obj.transfer_anim( )
            
class transfer_anim_():
    def __init__(self, key_checkBFKIK_matcher = False  ,selected_switcher = '' ,
                        checkBoxFullT = None, linEStart = None, lineEEnd = None ):
        self.key_checkBFKIK_matcher = key_checkBFKIK_matcher
        self.selection = selected_switcher
        self.checkBox = checkBoxFullT
        self.linEStart = linEStart
        self.lineEEnd =  lineEEnd

    def transfer_anim( self ):
        dicc = json2dicc_load( TEMP_FOL + METADATA_ANIM_TRANSF )
        rig_path = dicc ['rig_path']
        name_rig = rig_path.split('/')[-1]
        path_rig = rig_path.split( name_rig )[0]
        
        ANIM_FOLDER = dicc ['anim_fol_path'] 
        SKELETON_SETUP_MATCH_FILE = path_rig + ANIM_RIG_EXP 
        SET_UP_FI_NA = name_rig

        listAnims = os.listdir( ANIM_FOLDER )
        for anim in listAnims:
            if os.path.isfile(ANIM_FOLDER+anim):
                key = False
                if anim.endswith( '.FBX' ):
                    exten = '.FBX'
                    key = True 
                elif anim.endswith( '.fbx' ):
                    exten = '.fbx'
                    key = True
                elif anim.endswith( '.ma' ):
                    exten = '.ma'
                    key = True
                if key:
                    cmds.file( SKELETON_SETUP_MATCH_FILE, o =True , force = True )
                    constrols_ikfk = cmds.ls( "*:FKIKArm_*" , "*:FKIKLeg_*" , type = 'transform' )
                    for cnt in constrols_ikfk:
                        cmds.setAttr ( cnt + '.FKIKBlend', 0 )
                    cmds.currentUnit( time=FPS )
                    all_ref_paths = cmds.file( q=True, reference=True ) or []
                    for ref in all_ref_paths:
                        if not ref.endswith('/'+SET_UP_FI_NA): ### or is == to unreal skeleton
                            refNode = cmds.referenceQuery( ref, referenceNode=True)
                            print ( refNode )
                            print ( ref )
                            print ( ANIM_FOLDER+anim )
                            cmds.file( ANIM_FOLDER+anim, f = True ,loadReference=refNode)
                    cmds.select( '*:ControlSet' )
                    cnt_ls = cmds.ls(sl=True)
                    rig_name_space = cnt_ls[0].split(':')[0]
                    for cog in cmds.ls( "*:"+COG_CONTROL, "*:*:"+COG_CONTROL) :
                        if rig_name_space not in cog:
                            cnt = cog
                    if cnt != []:
                        cmds.select( cnt )
                        control_key = cmds.ls(sl=True)[0]
                        try:
                            end_value = int( cmds.keyframe( control_key, query=True, timeChange=True )[-1] )
                        except Exception:
                            end_value = int(cmds.playbackOptions( maxTime=True, q=True ))
                        cmds.playbackOptions( minTime=0, maxTime=end_value, e = True )
                    cmds.bakeResults( cnt_ls, hi = 'none',t = (0 , end_value), simulation=True )
                    try:
                        selection = self.ui.comboB_switch_template.currentText()
                        if  self.ui.checkBFKIK_matcher.isChecked():
                            matcher = ik_copying_animation(  LIMBS_CTL_LS , ui =  self.ui  , selected_switcher = selection )
                            self.times_ik_fk = matcher.set_limbs_2_ik()
                    except Exception:
                        if self.key_checkBFKIK_matcher:
                            matcher = ik_copying_animation(  LIMBS_CTL_LS , selected_switcher = self.selection )
                            self.times_ik_fk = matcher.set_limbs_2_ik()
                    exported_path = ANIM_FOLDER+TRANSFERENCE_FOL+'/'
                    if not os.path.exists( exported_path ):
                        os.makedirs( exported_path )
                    cmds.file( rename = exported_path+anim.split(exten)[0] + '.ma') #'_exported.ma'
                    cmds.file ( removeReference = True , referenceNode = refNode)
                    cmds.file( s=True, type='mayaAscii', force = True )
                

class ik_copying_animation():
    def __init__( self , limbs_ctl_ls, ui = None , selected_switcher = '',
                 checkBoxFullT = None, linEStart = None, lineEEnd = None ):
        self.ui = ui
        self.selected_switcher = selected_switcher
        self.checkBox = checkBoxFullT
        self.linEStart = linEStart
        self.lineEEnd =  lineEEnd
        self.limbs_ctl_ls = limbs_ctl_ls
        
    def import_switcher_selected(self  ):
        self.ikfk = __import__( self.selected_switcher )
        return self.selected_switcher

    def set_limbs_2_ik(self):
        switcher = self.import_switcher_selected()
        self.comtrol_ls_2ik, self.comtrol_ls_2fk = initialize_ls( switcher )
        amount_frames = 0
        for control_key in self.comtrol_ls_2ik:
            for limb in self.limbs_ctl_ls:
                limb, side = limb.split('_')
                if limb in control_key[0] and control_key[0].endswith('_'+side):
                    control = control_key[-1]
                    start_value , end_value , signalKey = set_start_end(  control  , self.checkBox , self.linEStart, self.lineEEnd )
                    ikfkCnt = cmds.ls( control_key[0] ) [0]
                    mel.eval( 'source channelBoxCommand;CBdeleteConnection "%s.FKIKBlend";'%ikfkCnt )
                    cmds.setAttr ( "%s.FKIKBlend"%ikfkCnt , 0 )
                    counter = 0
                    cmds.undoInfo(chunkName='chunk_tool2', openChunk=True)
                    for time in range ( start_value, end_value ):
                        amount_frames = amount_frames + 1
                        cmds.currentTime( time, update=True, edit=True )
                        cmds.select ( control )
                        self.ikfk.limb_fk_2_ik( signalAnim = True )
                        cmds.select( control_key )
                        cmds.select( control ,deselect = True)
                        cmds.select( control_key[0] ,deselect = True)
                        key = True
                        if signalKey == False and  counter == 0:
                            key = False
                        if key:
                            mel.eval('SetKey;')
                        counter = counter + 1
                    cmds.undoInfo(chunkName='chunk_tool2', closeChunk=True)
                    cmds.setAttr ( "%s.FKIKBlend"%ikfkCnt , 10 )
        return amount_frames


    def set_limbs_2_fk(self):
        amount_frames = 0
        switcher = self.import_switcher_selected()
        self.comtrol_ls_2ik, self.comtrol_ls_2fk = initialize_ls( switcher )
        for control_key in self.comtrol_ls_2fk:
            for limb in self.limbs_ctl_ls:
                limb, side = limb.split('_')
                if limb in control_key[0] and control_key[0].endswith('_'+side):
                    control = control_key[-1]
                    start_value , end_value , signalKey = set_start_end(  control  , self.checkBox , self.linEStart, self.lineEEnd )
                    ikfkCnt = cmds.ls(control_key[0])[0]
                    mel.eval( 'source channelBoxCommand;CBdeleteConnection "%s.FKIKBlend";'%ikfkCnt )
                    cmds.setAttr ( "%s.FKIKBlend"%ikfkCnt , 10 )
                    counter = 0
                    cmds.undoInfo(chunkName='chunk_tool', openChunk=True)
                    for time in range ( start_value, end_value ):
                        amount_frames = amount_frames + 1
                        cmds.currentTime( time, update=True, edit=True )
                        cmds.select ( control )
                        self.ikfk.limb_ik_2_fk( signalAnim = True )
                        cmds.select( control_key )
                        cmds.select( control ,deselect = True)
                        cmds.select( control_key[0] ,deselect = True)
                        key = True
                        if signalKey == False and  counter == 0:
                            key = False
                        if key:
                            mel.eval('SetKey;')
                        counter = counter + 1
                    cmds.undoInfo(chunkName='chunk_tool', closeChunk=True)
                    cmds.setAttr ( "%s.FKIKBlend"%ikfkCnt , 0 )
        return amount_frames
                
