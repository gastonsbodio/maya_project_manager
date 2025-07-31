""" instructions: place WeaponConstraint.py file and 'parentWeaponTool.ui' on maya script folder, 
    copy the 8th lines bellow  and paste it on script editor (python tab)
    take out the  (hashtag chars)
    use a character referenced scene
"""
import sys
import os
import maya.cmds as cmds
import maya.OpenMayaUI as mui
from shiboken2 import wrapInstance
#from pymel import core as pm
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
com = im.importing_modules( 'maya_conn.maya_custom_cmd' )
hlp = im.importing_modules( 'helper' )
p2t = im.importing_modules( 'area_tools.rig.parent_to_tool' )

ROOT_PATH = "C:/dev/"
PROJECT_PATH = ROOT_PATH + "%s/"
WEAPON_FOL = 'Weapons'
WEAPON_ROOT = "ContentSource/"+WEAPON_FOL+"/"
RIG_3D_FOLDER = "/Rig"
CONTENT_SOURCE_FOL = '/ContentSource'
CHAR_FOL = "Character"
WEAPON_DRIVER = 'weaponDriver_cnt'
WEAPON_CONSTRAIN = "weapon_weaponDriver_Constraint"
HAND_CONTRAIN = "_hand__Constraint"
HAND_PARENT_FOLLOW = 'gun_follow_%s_cnt'
DUPLI_SUF = '_dupli'
ANIM_FOL_FILES = de.ANIM_FOL_FILES
ui_name = 'ImportFileUI'

HEAD_LS = [ 'None' , 'WorldZero' , 'MoveAll1' , 'MoveAll2' ]
ROOT_LS = HEAD_LS +  [ 'Cog' ]
SCAP_LS = ROOT_LS + [ 'FKChest_M' ]
SHOULD_LS = SCAP_LS
IK_LS = SCAP_LS + ['FKHead_M' ]

class parentWeapon(QDialog):
    def __init__(self, parent=QApplication.activeWindow()):
        super(parentWeapon, self).__init__(parent)
        loader = QUiLoader()
        self.centralLayout = QVBoxLayout(self)
        self.centralLayout.setContentsMargins(0, 0, 0, 0)
        for script_path in [ de.SCRIPT_MANAG_FOL.replace('\\','/') + ANIM_FOL_FILES  ]:
            try:
                uifile = QtCore.QFile(os.path.join(script_path, de.PARENTWEAP_TOOL_UI))
                uifile.open(QtCore.QFile.ReadOnly)
                self.ui = loader.load(uifile , com.getWindow(QWidget) )
                break
            except Exception as err:
                print ( script_path )
                print ('try loading ui')
                print( err )  
        self.centralLayout.addWidget(self.ui)
        self.setGeometry(0, 0, 547, 684)
        self.initialize_widget_conn()

    def initialize_widget_conn(self):
        """Initializing functions, var and features.
        """
        project_ls = self.add_items_combo_project(  )
        self.project_na = self.set_loaded_project( )
        self.ui.lineEd_file_ref.setEnabled(False)
        
        self.ui.comboB_choose_project.currentIndexChanged.connect( self.load_set_root_project_path )
        self.ui.comboB_choose_weap.currentIndexChanged.connect( self.load_file_to_ref )
        
        self.ui.pushBut_ref_weap.clicked.connect( self.referenceWeapon )
        
        self.ui.pushBut_constrain_weap.clicked.connect( self.ConstraintWeaponToDriver )
        self.ui.pushBut_r_hand_constr.clicked.connect( lambda: self.ConstraintHandToWeap('R') )
        self.ui.pushBut_l_hand_constr.clicked.connect( lambda: self.ConstraintHandToWeap('L') )

        self.ui.pushBut_break_wea_constr.clicked.connect(self.delete_weapon_contraint )
        self.ui.pushBut_break_r_h_const.clicked.connect(lambda: self.delete_hand_contraint('R') )
        self.ui.pushBut_break_l_h_const.clicked.connect(lambda: self.delete_hand_contraint('L') )
   
        self.ui.pushBut_r_h_driver_l_attach.clicked.connect( self.RhandDriverLAttached )
        self.ui.pushBut_r_h_driver_l_free.clicked.connect( self.RhandDriverLFree ) 
        self.ui.pushBut_l_h_driver_r_attach.clicked.connect( self.LhandDriverRAttached ) 
        self.ui.pushBut_l_h_driver_r_free.clicked.connect( self.LhandDriverRFree )

        self.ui.pushBut_weap_driver_hands_attach.clicked.connect( self.weaponDriver_both_hands )
        self.ui.pushBut_weap_driver_l_hand_attach.clicked.connect( self.weaponDriver_L_hands )
        self.ui.pushBut_weap_driver_r_hand_attach.clicked.connect( self.weaponDriver_R_hands )

        self.ui.pushBut_ressete_all_attr.clicked.connect( self.resete_all_attr )
        folders = self.add_items_combo_gun( self.project_na )
        self.set_loaded_gun_ref(folders)
        #self.referenceWeapon()
        self.referencePlayer()
        self.initialize_space_switch_tool( )
        self.show()

     
    def initialize_space_switch_tool( self ):
        sp_tool = space_swith_tool( ui = self.ui )
        #sp_tool.initialize()
                
    def set_loaded_project( self ):
        folders = os.listdir( ROOT_PATH )
        rootReference = cmds.file(r=True, q=True)
        for re in rootReference:
            refNode = cmds.referenceQuery( re, referenceNode=True)
            pathRef = cmds.referenceQuery ( refNode, filename = True )
            if '/'+WEAPON_FOL+'/' in pathRef  or   '/'+CHAR_FOL in pathRef or '/'+CHAR_FOL.lower() in pathRef:
                project_fol = pathRef.split( ROOT_PATH )[-1].split( CONTENT_SOURCE_FOL )[0]
                for idx, fol in enumerate(folders):
                    if fol == project_fol:
                        self.project_na = fol
                        self.ui.comboB_choose_project.setCurrentIndex( idx )
                        return fol
        return 'None'

    def set_loaded_gun_ref( self, folders ):
        rootReference = cmds.file(r=True, q=True)
        for re in rootReference:
            refNode = cmds.referenceQuery( re, referenceNode=True)
            pathRef = cmds.referenceQuery ( refNode, filename = True )
            if '/'+WEAPON_FOL+'/' in pathRef and   pathRef.endswith( RIG_3D_FOLDER.replace('/','')+'.ma' ):
                self.ui.lineEd_file_ref.setText( pathRef.split('/')[-1] )
                weapon_foll = pathRef.split( WEAPON_FOL + '/')[-1].split( RIG_3D_FOLDER )[0]
                for idx, fol in enumerate(folders):
                    if fol == weapon_foll:
                        self.ui.comboB_choose_weap.setCurrentIndex( idx )
                        break

    def add_items_combo_project( self ):
        foldersPath = ROOT_PATH
        folders = os.listdir( foldersPath )
        for folder in folders:
            self.ui.comboB_choose_project.addItem( folder )
        return folders
                    

    def add_items_combo_gun( self , project_na):
        foldersPath = PROJECT_PATH%project_na + WEAPON_ROOT
        if str(project_na)!= 'None':
            folders = os.listdir( foldersPath )
            for folder in folders:
                self.ui.comboB_choose_weap.addItem( folder )
        else:
            folders = []
        return folders

    def delete_weapon_contraint( self ):
        weapon_parent_jnt = cmds.ls ( namespace_weapon+'*:Root_ctrl' )[0] #Root_ctrl
        weapon_root_contraint = cmds.listRelatives( weapon_parent_jnt , c = True, type = 'parentConstraint' ) or []
        if weapon_root_contraint != []:
            cmds.delete( weapon_root_contraint[0] )

    def delete_hand_contraint( self , side):
        hand_parent_jnt = cmds.ls ( namespace_char+':'+HAND_PARENT_FOLLOW % side.lower() )[0] 
        hand_root_contraint = cmds.listRelatives( hand_parent_jnt , c = True, type = 'parentConstraint' ) or []
        if hand_root_contraint != []:
            cmds.delete( hand_root_contraint[0] )
        
    def combo_current_text( self , combo ):
        allItems = [combo.itemText(i) for i in range(combo.count())] 
        currentIndex = combo.currentIndex()
        selectedWeapon = [ item for idx , item in enumerate ( allItems ) if idx == currentIndex ][0]
        return selectedWeapon
    
    def load_set_root_project_path( self ):
        self.project_na = self.combo_current_text( self.ui.comboB_choose_project )
        self.add_items_combo_gun( self.project_na  )

    def load_file_to_ref( self ):
        selectedWeapon = self.combo_current_text( self.ui.comboB_choose_weap )
        selectedWeaponPath = PROJECT_PATH%self.project_na + WEAPON_ROOT  + selectedWeapon + RIG_3D_FOLDER
        files = os.listdir( selectedWeaponPath )
        for file in files:
            #if file.rpartition(".")[2] == "ma": 
            if file.endswith( RIG_3D_FOLDER.replace('/','') + '.ma' ):
                niceName = file.rpartition(".")[0]
                self.ui.lineEd_file_ref.setText( file )
                break

    def ConstraintWeaponToDriver( self ):
        char_parent_jnt = cmds.ls ( namespace_char+'*:'+WEAPON_DRIVER )[0]
        weapon_parent_jnt = cmds.ls ( namespace_weapon+'*:Root_ctrl' )[0] #Root_ctrl
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        
        if weaponRefExist == True:
            if cmds.objExists(WEAPON_CONSTRAIN):
                print("weapon is already constrained")
            else:
                if playerRefExist == True:
                    cmds.parentConstraint( char_parent_jnt, weapon_parent_jnt,
                                        n = WEAPON_CONSTRAIN,
                                        mo = False )
                else:
                    print("Reference player rig first")
        else:
            print("Reference weapon first")


    def ConstraintHandToWeap( self ,side):
        namespace_weapon = cmds.ls( '*:hand_parent_'+side )[0].split(':')[0]
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True:
            if cmds.objExists(side+HAND_CONTRAIN):
                print(side+" hand is already constrained")
            else:
                if playerRefExist == True:
                    cmds.parentConstraint( namespace_weapon+':hand_parent_'+side,
                    namespace_char+':'+ HAND_PARENT_FOLLOW % side.lower(),
                                           n = side+HAND_CONTRAIN,
                                           mo = False )
                else:
                    print("Reference player rig first")
        else:
            print("Reference weapon first")

    def referenceWeapon( self ):
        global namespace_weapon
        global weaponRefExist
        weaponRefExist = False
        selectedProject = self.combo_current_text( self.ui.comboB_choose_project )
        selectedFolder = self.combo_current_text( self.ui.comboB_choose_weap )
        selectedWeapon = self.ui.lineEd_file_ref.text()#cmds.optionMenu("weaponFolderOptionMenu", q = True, v = True)
        weaponFile = PROJECT_PATH%self.project_na + WEAPON_ROOT  + selectedFolder + RIG_3D_FOLDER + "/" + selectedWeapon
        namespace_weapon, currenRefPath , currentWeaponRef , weaponRefExist = self.check_ref( WEAPON_ROOT )
        if weaponRefExist == True:
            if currenRefPath == weaponFile:
                print("Selected weapon already referenced")
            else:
                print("and this")
                cmds.file(weaponFile, loadReference = currentWeaponRef)
                cmds.file(weaponFile,e = True, namespace = "Weapon")
        else:
            print("referencing selected weapon into scene")
            try:
                cmds.file(weaponFile, r=True,type = "mayaAscii", ignoreVersion = True, namespace = "Weapon")
            except Exception as err:
                print ( err )
                print ( '- - warning error - -')
            
    def resete_all_attr( self ):
        cmds.setAttr ( namespace_char+":IKArm_R.gun_space", 0)
        cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
        cmds.setAttr ( namespace_char+":IKArm_L.gun_space", 0)
        self.delete_weapon_contraint ()
        self.delete_hand_contraint('R') 
        self.delete_hand_contraint('L') 


    def get_father_duplic( self, obj , parentWorld = False):
        if ':' not in obj:
            father_offset = cmds.listRelatives( '*:'+obj , parent=True, f=True)[0]
        else:
            father_offset = cmds.listRelatives( obj , parent=True, f=True)[0]
        
        try:
            dupli_offset = cmds.duplicate( father_offset , name= father_offset.split(':')[-1] + DUPLI_SUF)[0]
        except Exception as err:
            print(err)
            pass
        if parentWorld:
            cmds.parent( dupli_offset , w=True)
        target_dupli = cmds.listRelatives( dupli_offset , c = True, f = True)
        for target in target_dupli:
            if ':' in obj:
                endd = obj.split(':')[-1]
            else:
                endd = obj
            if target.endswith( endd ):
                dupli = cmds.rename( target , obj+DUPLI_SUF)
                return dupli , dupli_offset

    def fit_cnt_to_position( self , cnt_drivenn, parent_driver , value_degree_ls, axe_ls):

        parent_target , dupli_offset_target = self.get_father_duplic( cnt_drivenn )
        parent_contrain2 = cmds.parentConstraint ( cmds.listRelatives( namespace_char+":"+cnt_drivenn , p = True)[0]  , 
                                                  dupli_offset_target , mo = False )
        parent_contrain = cmds.parentConstraint (  parent_driver, parent_target , mo = False )

        com.setTransf( parent_target , namespace_char+":"+cnt_drivenn )
        for idx, axe in enumerate( axe_ls ):    
            value = cmds.getAttr ( parent_target+".rotate"+axe )
            cmds.setAttr ( namespace_char+":"+cnt_drivenn+".rotate"+axe, value + value_degree_ls[idx] )
        cmds.delete( dupli_offset_target )


    def RhandDriverLAttached(self):
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True and playerRefExist == True:
            ik_cnt_driver = 'IKArm_R'
            ik_cnt_drivenn = 'IKArm_L'
            cmds.setAttr ( namespace_char+":"+ik_cnt_driver+".gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn+".gun_space", 0) 
            
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 2)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn+".gun_space", 2)
            
            parent_driver = namespace_char+':R_Hand_Object'
            
            self.fit_cnt_to_position(  ik_cnt_drivenn, parent_driver , [0, 0, 0], ['X','Y','Z'])
            self.fit_cnt_to_position(  WEAPON_DRIVER, parent_driver , [0, 0, 0], ['X','Y','Z'])
        else:
            print("incorrect references")

    def RhandDriverLFree(self):
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True and playerRefExist == True:

            cmds.setAttr ( namespace_char+":IKArm_R.gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
            cmds.setAttr ( namespace_char+":IKArm_L.gun_space", 0) 
            
            cmds.setAttr ( namespace_char+":IKArm_R.gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 2)
            
            parent_driver = namespace_char+':R_Hand_Object'
            

            self.fit_cnt_to_position(  WEAPON_DRIVER, parent_driver , [0,0, 0], ['X','Y','Z'])
            
        else:
            print("incorrect references")

    def LhandDriverRAttached( self ):
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True and playerRefExist == True:
            ik_cnt_driver = 'IKArm_L'
            ik_cnt_drivenn = 'IKArm_R'
            cmds.setAttr ( namespace_char+":"+ik_cnt_driver+".gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn+".gun_space", 0) 
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 1)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn+".gun_space", 2)  

            parent_driver = namespace_char+':L_Hand_Object'
            
            self.fit_cnt_to_position(  ik_cnt_drivenn, parent_driver , [180,0,0], ['X','Y','Z'])
            self.fit_cnt_to_position(  WEAPON_DRIVER, parent_driver , [180, 0, 0], ['X','Y','Z'])
        else:
            print("incorrect references")

    def LhandDriverRFree( self ):
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True and playerRefExist == True:

            cmds.setAttr ( namespace_char+":IKArm_L.gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
            cmds.setAttr ( namespace_char+":IKArm_R.gun_space", 0) 
            
            cmds.setAttr ( namespace_char+":IKArm_R.gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 1)
            
            parent_driver = namespace_char+':L_Hand_Object'
            self.fit_cnt_to_position(  WEAPON_DRIVER, parent_driver , [180, 0, 0], ['X','Y','Z'] )
        else:
            print("incorrect references")

    def weaponDriver_both_hands( self ):
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True and playerRefExist == True:
            ik_cnt_drivenn_l = 'IKArm_L'
            ik_cnt_drivenn_r = 'IKArm_R'
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_l+".gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_r+".gun_space", 0) 
            
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_r+".gun_space", 1)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_l+".gun_space", 1) 
                                                                ########107,59,-164
            self.fit_cnt_to_position(  ik_cnt_drivenn_r, namespace_char+':'+HAND_PARENT_FOLLOW % 'r' , [-90, 90,0], ['X','Y','Z'])
            self.fit_cnt_to_position(  ik_cnt_drivenn_l, namespace_char+':'+HAND_PARENT_FOLLOW % 'l' , [-90,90,0], ['X','Y','Z'])
            
        else:
            print("incorrect references")

    def weaponDriver_L_hands( self ):
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True and playerRefExist == True:
            ik_cnt_drivenn_l = 'IKArm_L'
            ik_cnt_drivenn_r = 'IKArm_R'
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_l+".gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_r+".gun_space", 0) 
            
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_l+".gun_space", 1) 
            
            #self.fit_cnt_to_position(  ik_cnt_drivenn_r, namespace_char+':'+HAND_PARENT_FOLLOW % 'r' , [-72.1,59,-164], ['X','Y','Z'])
            self.fit_cnt_to_position(  ik_cnt_drivenn_l, namespace_char+':'+HAND_PARENT_FOLLOW % 'l' , [-90, 90,0], ['X','Y','Z'])
            
        else:
            print("incorrect references")

    def weaponDriver_R_hands( self ):
        weaponRefExist = self.checkReferences( WEAPON_FOL )
        playerRefExist = self.checkReferences( CHAR_FOL )
        if weaponRefExist == True and playerRefExist == True:
            ik_cnt_drivenn_l = 'IKArm_L'
            ik_cnt_drivenn_r = 'IKArm_R'
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_l+".gun_space", 0)
            cmds.setAttr ( namespace_char+":%s.gun_space" %WEAPON_DRIVER, 0)
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_r+".gun_space", 0)
            
            cmds.setAttr ( namespace_char+":"+ik_cnt_drivenn_r+".gun_space", 1)
            #cmds.setAttr ( namespace_char+":IKArm_L.gun_space", 1)
            
            self.fit_cnt_to_position(  ik_cnt_drivenn_r, namespace_char+':'+HAND_PARENT_FOLLOW % 'r' , [-90, 90,0], ['X','Y','Z'])
            #self.fit_cnt_to_position(  ik_cnt_drivenn_l, namespace_char+':'+HAND_PARENT_FOLLOW % 'l' , [107,18,-66], ['X','Y','Z'])

            
        else:
            print("incorrect references")

    def checkReferences( self, namespace ):
        refExists = False
        refs = cmds.ls(type="reference")
        for ref in refs:
            currenRefPath = cmds.referenceQuery(ref, filename = True)
            if "sharedReferenceNode" in ref:
                continue
            elif "_UNKNOWN_REF_NODE_" in ref:
                continue
            if namespace in currenRefPath or namespace.lower() in currenRefPath:
                refExists = True
                break
        if refExists == True:
            return True
        else:
            return False

    def check_ref( self, key_type_asset  ):
        weaponRefExist = False
        namespace = ''
        currenRefPath = ''
        currentWeaponRef = ''
        refs = cmds.ls(type="reference")
        for ref in refs:
            if "sharedReferenceNode" in ref:
                continue
            elif "_UNKNOWN_REF_NODE_" in ref:
                continue
            else:
                currenRefPath = cmds.referenceQuery( ref, filename = True )
                if '/'+key_type_asset in currenRefPath or '/'+key_type_asset.lower() in currenRefPath:
                    weaponRefExist = True
                    currentWeaponRef = ref
                    namespace = ref.split( 'RN' )[0]
                    break
        return namespace, currenRefPath, currentWeaponRef, weaponRefExist

    def referencePlayer( self ):
        global namespace_char
        playerRefExist = False
        namespace_char, currenRefPath , currentCharRef, weaponRefExist = self.check_ref( CHAR_FOL )
        if playerRefExist == True:
            print("Player is already referenced")
            #updateReferences()
        else:
            print("Referencing Player")
            #cmds.file(playerFile, r=True, ignoreVersion = True, namespace = "Player")
            
    def updateReferences( self ):
        #Updating player reference path
        playerFile = PROJECT_PATH%self.project_na + "SK_Player_01.ma"
        refs = cmds.ls(type="reference")
        
        for ref in refs:
            currenRefPath = cmds.referenceQuery(ref, filename = True)
            if "sharedReferenceNode" in ref:
                continue
            elif "_UNKNOWN_REF_NODE_" in ref:
                continue
            if namespace_char in ref:
                refPath = cmds.referenceQuery(ref, filename = True)
                if refPath == playerFile:
                    print("Correct player file ref'd, no need to update")
                else:
                    print("Updating player file path")
                    cmds.file(playerFile, loadReference = ref)
                refNamespace = cmds.referenceQuery(ref, namespace = True)
                print(refNamespace)
                if refNamespace == namespace_char:
                    print("")
                else:
                    cmds.file(playerFile,e = True, namespace = "Player")
                break        

class space_swith_tool():
    def __init__( self , ui ):
        self.ui = ui
        
        self.CONTROLS_DICC = { 'FKHead_M' : ( self.ui.comboBHead, HEAD_LS ), 
                              'FKScapula_L' : ( self.ui.comboBScapula_l , SCAP_LS ),
                              'FKShoulder_L' : ( self.ui.comboBSholuder_l , SHOULD_LS ),
                              'IKArm_L' : ( self.ui.comboBIK_l, IK_LS ),
                              'FKScapula_R' : ( self.ui.comboBScapula_r  , SCAP_LS ),
                              'FKShoulder_R': (self.ui.comboBSholuder_r, SHOULD_LS),
                              'IKArm_R': ( self.ui.comboBIK_r , IK_LS ),
                              'FKroot_M': ( self.ui.comboBRootcnt , ROOT_LS )  }
        self.initialize( )
        
    def initialize ( self  ):
        self.fill_char_combo( )
        self.all_menues_gen(  )
        self.allcombo_change_action( )
        self.all_buttons_action( )
        
    def fill_char_combo( self ):
        all_ref_paths = cmds.file( q=True, reference=True ) or []
        for ref_path in all_ref_paths:
                #cmds.file(ref_path, importReference=True)
            if '/'+CHAR_FOL in ref_path or '/'+CHAR_FOL.lower() in ref_path:
                self.namespa = cmds.referenceQuery( ref_path, ns=True )
                self.namespa = self.namespa.replace(':','') + ':'
                self.ui.comboBCharacters.addItem( self.namespa )
                
    def cobo_nameS_change ( self ):
        self.namespa = self.ui.comboBCharacters.currentText()
        
    def all_menues_gen( self  ):
        for cnt in self.CONTROLS_DICC:
            if 'FKHead_M' == cnt:
                listt = HEAD_LS
            elif 'FKScapula_L' == cnt or 'FKScapula_R' == cnt :            
                listt = SCAP_LS
            elif 'FKShoulder_L' == cnt or 'FKShoulder_R' == cnt : 
                listt = SHOULD_LS
            elif 'IKArm_L' == cnt or 'IKArm_R' == cnt : 
                listt = IK_LS
            elif 'FKroot_M' == cnt :
                listt = ROOT_LS
            self.CONTROLS_DICC[cnt][0].addItems( listt )
            #line_edit = self.CONTROLS_DICC[cnt].lineEdit()
            #line_edit.setAlignment( QtCore.Qt.AlignCenter )

    def allcombo_change_action(self):
        #self.CONTROLS_DICC = { 'FKHead_M' : self.ui.comboBHead ,  'FKScapula_L' : self.ui.comboBScapula_l ,
        
        #                 'FKShoulder_L' : self.ui.comboBSholuder_l , 'IKArm_L' : self.ui.comboBIK_l,
        
        
        #                 'FKScapula_R' : self.ui.comboBScapula_r , 'FKShoulder_R': self.ui.comboBSholuder_r ,
        #                 'IKArm_R': self.ui.comboBIK_r , 'FKroot_M': self.ui.comboBRootcnt }
        self.ui.comboBHead.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBHead  , 'FKHead_M' ) )
        self.ui.comboBScapula_l.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBScapula_l  , 'FKScapula_L' ) )
        self.ui.comboBSholuder_l.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBSholuder_l  , 'FKShoulder_L' ) )
        self.ui.comboBIK_l.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBIK_l  , 'IKArm_L' ) )
        self.ui.comboBScapula_r.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBScapula_r  , 'FKScapula_R' ) )
        self.ui.comboBSholuder_r.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBSholuder_r  , 'FKShoulder_R' ) )
        self.ui.comboBIK_r.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBIK_r  , 'IKArm_R' ) )
        self.ui.comboBRootcnt.currentIndexChanged.connect( 
                                              lambda: self.trigging_parent( self.ui.comboBRootcnt  , 'FKroot_M' ) )

    def all_buttons_action( self ):
        
        self.ui.pushButKeyHead.clicked.connect( lambda: self.key_control( 'FKHead_M' , just_sel = False) )
        self.ui.pushButSelHead.clicked.connect( lambda: self.key_control( 'FKHead_M' , just_sel = True) )       



        self.ui.pushButKeyScapu_r.clicked.connect( lambda: self.key_control( 'FKScapula_R' , just_sel = False) )
        self.ui.pushButSelScapu_r.clicked.connect( lambda: self.key_control( 'FKScapula_R' , just_sel = True) ) 

        self.ui.pushButKeyScapu_l.clicked.connect( lambda: self.key_control( 'FKScapula_L' , just_sel = False) )
        self.ui.pushButSelScapu_l.clicked.connect( lambda: self.key_control( 'FKScapula_L' , just_sel = True) ) 



        self.ui.pushButKeysholud_r.clicked.connect( lambda: self.key_control( 'FKShoulder_R' , just_sel = False) )
        self.ui.pushButselShould_r.clicked.connect( lambda: self.key_control( 'FKShoulder_R' , just_sel = True) ) 

        self.ui.pushButKeysholud_l.clicked.connect( lambda: self.key_control( 'FKShoulder_L' , just_sel = False) )
        self.ui.pushButselShould_l.clicked.connect( lambda: self.key_control( 'FKShoulder_L' , just_sel = True) ) 




        self.ui.pushButKeyIk_r.clicked.connect( lambda: self.key_control( 'IKArm_R' , just_sel = False) )
        self.ui.pushButSelIk_r.clicked.connect( lambda: self.key_control( 'IKArm_R' , just_sel = True) ) 

        self.ui.pushButKeyIk_l.clicked.connect( lambda: self.key_control( 'IKArm_L' , just_sel = False) )
        self.ui.pushButSelIk_l.clicked.connect( lambda: self.key_control( 'IKArm_L' , just_sel = True) ) 



        self.ui.pushButKeyRoot.clicked.connect( lambda: self.key_control( 'FKroot_M' , just_sel = False) )
        self.ui.pushButSelRoot.clicked.connect( lambda: self.key_control( 'FKroot_M' , just_sel = True) ) 



    def key_control( self , cnt , just_sel = True ):
        cmds.select( self.namespa + cnt +'_bridge_control' )
        if just_sel == False:
            cmds.setKeyframe( self.namespa + cnt +'_bridge_control', attribute='parentTo' )


        
    def getIndex( self, list , name):
        for idx , obj in enumerate (list):
            if obj == name:
                return idx
                
    def trigging_parent( self , combo , cnt ):
        control = self.namespa + cnt 
        cnt_target = str( combo.currentText() ) 
        indx = self.getIndex( self.CONTROLS_DICC[ cnt ][1] , cnt_target )
        
        #cmds.setAttr( self.namespa + cnt +'_bridge_control.parentTo', indx  )
        old_time,  old_frame = p2t.action_getPos_set_keep( control , indx )
        print(  self.namespa +cnt +'_bridge_control' )
        print ( indx )