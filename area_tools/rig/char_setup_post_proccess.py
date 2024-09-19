
"""  for running features for advance skeleton post proccess
    copy this hashtag code below, paste on maya script editor python tab
    and take out initial hastag, you can choose "quadruped"  or "biped" mode
    and you can set False if you want to skip some feature
"""
"""avoid_auto_read"""

#from importlib import reload
#import area_tools.rig.char_setup_post_proccess as cspp
#reload( cspp )

#mode = 'biped'

#cspp.orient_IK( True ,mode )

#cspp.cog_creation( True , mode)

#cspp.creating_pole_vectors_ref( True )

#cspp.arrow_shape( True )

#cspp.moveAll_controls( True )

#cspp.hip_translation( True , mode )

#cspp.worldZero_creation( True )

#cspp.quadrupeds_leg_features( True , mode )

#cspp.create_hand_object_joint( True )

#cspp.set_parent_to( True )

#cspp.switch_ik_fk_preparing( True , mode)

#cspp.unparent_root( True )

#cspp.do_gun_space( True )

#cspp.camera_importing( True )

#cspp.set_export_creation( True )

#cspp.skeleton_unreal_settings ( True )

#cspp.delete_namespaces( True )

#cspp.set_color_controls( True )

from importlib import reload
import parent_to_tool as p2t
reload( p2t )

import default_rot_value_script as drvs
reload( drvs )

import maya.cmds as cmds
import maya.mel as mel

import spaceSwitch as ss
reload(ss)

import spaceCreator as sc
reload( sc )

ROOT = 'root'
ROOTX_M = 'RootX_M'
FKROOT_ARROW = 'FKroot_M' ## arrow control
MoveAll2 = 'MoveAll2'
MoveAll1 = 'MoveAll1'
HIP = 'HipSwinger_M'
PATH_ARROW = 'C:/Users/gasco/Documents/maya/2023/scripts/arrow_shape.ma'
PATH_CAMERA_CHAR = 'C:/dev/carbon/ContentSource/Chars_props/camera_char/camera_joint.ma'
PATH_CONTROL_SH = 'C:/Users/gasco/Downloads/AdvancedSkeleton/AdvancedSkeletonFiles/div/asGallery.ma'
CAM_OFFS_CONST = 'camera_cnt_offset1'
CAM_OFFS_CONST2 = 'camera_cnt_offset2'
CAM_SETTINGS_GRP= 'camera_setting'
COG_ = "Cog"
Spine1 = 'FKSpine1_M'
WORLD_ZERO = 'WorldZero'
GUN_FOLLOW = 'gun_follow_%s_cnt'
WEAPON_DRIVER = 'weaponDriver_cnt'
TRANSFORMS = ["translate","rotate", "scale"]
OFFSET_NA = 'zero_transf_%s_offset'
HAND_OBJ = '_Hand_Object'
WEAPON_PREFIX_JNT = 'weapon_'
MESHGRP = 'mesh_grp'
MESHSET = "SKM_FullBody_Export" 
ANIMSET = "Animation_Export" 
MULT_DIV_ROT_VALUE = 'mad_%s_values_rot_default'
DEFAULT_ROT_IK = 'defaultRot'


DICC_M = { 'Root':'pelvis' , 'Spine1':'spine_01' , 'Spine2':'spine_02' , 'Spine3':'spine_03' , 'Spine4':'spine_04',
  'Chest':'spine_05' , 'Neck' : 'neck_01', 'Head':'head',  'Jaw' : 'jaw' , 'Neck1': 'neck_02'}

DICC_MIRROR = { 'IndexFinger1': 'index_01', 'IndexFinger2': 'index_02' , 'IndexFinger3': 'index_03',
  'MiddleFinger1' : 'middle_01', 'MiddleFinger2' : 'middle_02', 'MiddleFinger3' : 'middle_03',
  'RingFinger1' : 'ring_01',  'RingFinger2' : 'ring_02',  'RingFinger3' : 'ring_03', 
  'PinkyFinger1' : 'pinky_01', 'PinkyFinger2' : 'pinky_02', 'PinkyFinger3' : 'pinky_03',  
  'ThumbFinger1' : 'thumb_01',  'ThumbFinger2' : 'thumb_02', 'ThumbFinger3' : 'thumb_03',
  'ElbowPart1' :  'lowerarm_twist_02' , 'ElbowPart2' : 'lowerarm_twist_01' ,
  
  'ShoulderPart1' :  'upperarm_twist_02' , 'ShoulderPart2' : 'upperarm_twist_01' ,
  
  'Scapula': 'clavicle',  'Shoulder':'upperarm', 'Elbow' : 'lowerarm',
  'Wrist': 'hand' , 'PinkyMetacarpal' : 'pinky_metacarpal',  'MiddleMetacarpal' : 'middle_metacarpal', 
  'IndexMetacarpal':'index_metacarpal','RingMetacarpal' : 'ring_metacarpal',
  'Hip':'thigh', 'Knee': 'calf',
  'Ankle': 'foot', 'Toes': 'ball',
  'Eye': 'eye'}



def break_connection( control  , axe_ls ,transf_ls = ['t','r','s']):
    for axe in axe_ls:
        for transf in transf_ls:
            try:
                mel.eval( 'source channelBoxCommand;CBdeleteConnection "%s.%s%s";'%( control, transf, axe ) )
            except Exception:
                pass

def unlock_transf( name , transf = ['t','r','s'] ):
    for attr in [ 't' , 'r' , 's' ]:
        if attr in transf:
            for axe in [ 'x', 'y', 'z' ]:
                try:
                    cmds.setAttr(name+'.'+attr+axe, lock=0)
                except Exception:
                    pass

def setTransf(source, target, transf=['t','r','s']):
    axes=[ "X", "Y", "Z" ]
    transfs = ["translate","rotate","scale"]
    for transform in transfs:
        if transform[0] in transf:
            try:
                for axe in axes:
                    try:
                        value = cmds.getAttr ( source+"."+transform+axe )
                        cmds.setAttr ( target+"."+transform+axe, value )
                    except Exception as err:
                        print( err )
                        pass
            except Exception as err:
                print( err )
                pass

def resetTransf( target, axe_enable = ['t','r']):
    axes=[ "X","Y","Z" ]
    transfs = [ "translate", "rotate"]# , "scale" ]
    for transform in transfs:
        if transform[0] in axe_enable:
            try:
                for axe in axes:
                    try:
                        cmds.setAttr ( target+"."+transform+axe, 0 )
                    except Exception as err:
                        print( err )
                        pass
            except Exception as err:
                print( err )
                pass

def offset_creation( obj ):
    offset_orig = cmds.listRelatives( obj , p = True , type = 'transform' ) or []
    if offset_orig != []:
        offset_orig = offset_orig [0]
    mel.eval( 'CreateLocator;' )
    loc = cmds.ls( sl = True)[0]
    if cmds.ls( OFFSET_NA %(obj) )  != []:
        amount = str( len( cmds.ls( OFFSET_NA %(obj) +'*') ) + 1 ) 
    else:
        amount = ''
    offset_na = OFFSET_NA %(obj) + amount 
    cmds.rename( loc, offset_na)
    shape_loc = cmds.listRelatives( offset_na , ad =True , f=True)[0]
    cmds.delete( shape_loc )
    cmds.parent( offset_na  , obj )
    resetTransf( offset_na  )
    cmds.parent( offset_na  , w = True )
    cmds.parent( obj, offset_na  )
    if offset_orig != []:
        cmds.parent( offset_na, offset_orig  )
    return  offset_na

def fix_rotation( name_  ,range = 20):
    for axe in ['X','Y','Z']:
        value = cmds.getAttr( name_ + '.rotate' + axe )
        if value != 0.0 and value != 90.0 and value != 180.0 and value != 270.0 and value != 360.0:
            # , 90, 180, 270, 360 ]:
            if value > 0 - range    and     value < 0 + range :
                new_value = 0
            elif value > 90 - range    and     value < 90 + range :
                new_value = 90
            elif value > 180 - range    and     value < 180 + range :
                new_value = 180
            elif value > 270 - range    and     value < 270 + range :
                new_value = 270
            elif value > 360 - range    and     value < 360 + range :
                new_value = 360
            else:
                new_value = value
            cmds.setAttr( name_ + '.rotate' + axe  , new_value )


def joint_shape_4_defor( cnt , dupli = False ):
    if dupli:
        dupli_cnt = cmds.duplicate ( cnt , n = cnt+'_dupli' ,rc=True)[0]
    else:
        dupli_cnt = cnt
    shape_nurb = cmds.listRelatives( dupli_cnt, c=True, s=True, f=True )
    cmds.select(cl=True)
    joint = cmds.joint( p=(0, 0, 0) )
    contrain2 = cmds.parentConstraint ( dupli_cnt  , joint , mo = False )[0]
    break_connection( joint  , ['x','y','z'] , transf_ls = ['t','r',] )
    cmds.delete( contrain2 )
    cmds.select(cl=True)
    cmds.select( joint , dupli_cnt )
    mel.eval('SmoothBindSkin;')
    return joint, dupli_cnt, shape_nurb

def edit_shape( control_2_dup , dupli = False , value=[ 0.5, 0.5, 0.5 ] , transformation = 'scale'):

    joint , dupli_cnt , shape_nurb= joint_shape_4_defor( control_2_dup , dupli = dupli)
    
    cmds.setAttr ( joint + '.' +transformation +"X", value[0] )
    cmds.setAttr ( joint + '.' +transformation +"Y", value[1] )
    cmds.setAttr ( joint + '.' +transformation +"Z", value[2] )
    cmds.select( dupli_cnt )
    mel.eval('DeleteHistory;')
    cmds.delete( joint )
    unlock_transf( dupli_cnt , transf = ['t','r','s'] )
    return shape_nurb, dupli_cnt

def edit_shape_exact_position( IK_wrist_original  , IK_wrist_new_oriented ):

    IK_wrist_shape = cmds.listRelatives( IK_wrist_original, c=True, s=True )[0]
    IK_wrOrient_shape = cmds.listRelatives( IK_wrist_new_oriented, c=True, s=True )[0]
    vertex_pos_ls = [ [ '%s.cv[7]' , '%s.cv[15]' ], [ '%s.cv[6]' , '%s.cv[10]' ],
                    [ '%s.cv[2]' , '%s.cv[14]' ], [ '%s.cv[0]' , '%s.cv[8]' ],
                    [ '%s.cv[1]' , '%s.cv[13]' ], [ '%s.cv[4]' , '%s.cv[12]' ],
                    [ '%s.cv[5]' , '%s.cv[9]' ], [ '%s.cv[3]' , '%s.cv[11]' ] ]
    position_ls = []
    for list_position in vertex_pos_ls:
        for vertex in list_position:
            tuple_pos = cmds.xform ( vertex %IK_wrOrient_shape ,  q=True , ws=True, t=True)
            cmds.xform ( vertex %IK_wrist_shape,  ws=True, t = tuple_pos )
    cmds.select( IK_wrist_shape )
    mel.eval('DeleteHistory;')


def create_node_default_rot( ik_orig ):
    cmds.addAttr ( ik_orig , r=True,k=True ,h=False,ln = DEFAULT_ROT_IK  ,at ="bool" ) 
    cmds.setAttr( ik_orig + '.' + DEFAULT_ROT_IK , keyable = False , channelBox = True , lock = False)
    cmds.addAttr ( ik_orig , r=True,k=True ,h=False,ln = DEFAULT_ROT_IK+"_hided"   ,at ="bool" ) 
    cmds.setAttr( ik_orig + '.' + DEFAULT_ROT_IK + "_hided", keyable = False , channelBox = False , lock = False )
    drvs.create_script_node( ik_orig, MULT_DIV_ROT_VALUE , attribname = DEFAULT_ROT_IK )
 

def attrb_set_defaul_ik( ik_orig ):
    multiple_divide = mel.eval ( 'createRenderNodeCB -asUtility "" multiplyDivide "";' )
    multiple_divide = cmds.rename( multiple_divide, MULT_DIV_ROT_VALUE %ik_orig  )
    valueX = cmds.getAttr( ik_orig+'.rotateX')
    valueY = cmds.getAttr( ik_orig+'.rotateY')
    valueZ = cmds.getAttr( ik_orig+'.rotateZ')
    
    cmds.setAttr( multiple_divide+'.input1X', valueX)
    cmds.setAttr( multiple_divide+'.input1Y', valueY)
    cmds.setAttr( multiple_divide+'.input1Z', valueZ)
    create_node_default_rot( ik_orig )







def freeze_ik_control(  IK_wrist_original , IK_wrist_new_oriented , fk_cnt):
    offset_fk = cmds.listRelatives ( fk_cnt, p=True )[0] 
    offset_fk_dupli = cmds.duplicate(  offset_fk , rc=True)[0]
    cmds.parent( offset_fk_dupli, w=True)
    #makeIdentity -apply true -t 0 -r 1 -s 0 -n 0 -pn 1;
    mel.eval( 'CreateLocator;' )
    loc = cmds.ls( sl = True)[0]
    contrain = cmds.parentConstraint ( fk_cnt  , loc , mo = False )[0]
    break_connection( loc  , ['x','y','z'] , transf_ls = ['t','r',] )
    cmds.delete( contrain )
    values_xyz = []
    for axe in [ 'X', 'Y', 'Z' ]:
        value = cmds.getAttr ( offset_fk_dupli + ".rotate" + axe )
        #value = cmds.getAttr ( loc + ".rotate" + axe )
        if IK_wrist_original.endswith( '_R'):
            if axe != 'X':
                value = value *-1

            else:
                value = value *-1
        else:
            if axe == 'X':
                value = value - 180
                value = value * -1
            else:
                value = value * 1#-1
        cmds.setAttr( IK_wrist_original + '.rotateAxis' + axe , value )
        
        
        #value2 = cmds.getAttr ( offset_fk_dupli + ".rotate" + axe )
        value2 = cmds.getAttr ( loc + ".rotate" + axe )
        if IK_wrist_original.endswith('_R'):
            if axe == 'X':
                value2 = value2 *  -1
        else:
            if axe == 'Y' or axe == 'Z':
                value2 = value2 * 1 #-1
        values_xyz.append( value2 )
        cmds.setAttr( IK_wrist_original + '.rotate' + axe , value2  )
    unlock_transf( IK_wrist_new_oriented , transf = ['t','r','s'] )
    #cmds.delete(  loc )
    if IK_wrist_original.endswith( '_L'):
        value = cmds.getAttr( IK_wrist_original + '.rotateX' )
        cmds.setAttr( IK_wrist_original + '.rotateX' , 180 - value  )
    cmds.delete( offset_fk_dupli )
    attrb_set_defaul_ik( IK_wrist_original )
    edit_shape_exact_position( IK_wrist_original , IK_wrist_new_oriented )
    #edit_shape( IK_wrist_original , dupli = False , value=[ 1.2, 1.2, 1.2 ] , transformation = 'scale')

def orient_IK ( is_checked ,templa_skelet_type ):
    if is_checked:
        if templa_skelet_type == 'biped':
            orient_sufi = 'Oriented_'
            fk_wrist, ikwrist = ( 'FKWrist_' , 'IKArm_' )
            for side in [ 'L', 'R']:
                FK_wrist = fk_wrist  + side
                IK_wrist_new_oriented = ikwrist + orient_sufi + side
                IK_wrist_original = ikwrist + side
                offset_fk = cmds.listRelatives( FK_wrist , p = True, type = 'transform')[0]
                dupli_offset_fk = cmds.duplicate( offset_fk )[0]
                cmds.sets(  dupli_offset_fk , edit= True , rm = 'ControlSet' )
                dupli_offset_fk = cmds.rename( dupli_offset_fk ,  'offset_'+IK_wrist_new_oriented)
                
                for fkw in cmds.ls ( FK_wrist , l = True):
                    if dupli_offset_fk in fkw:
                        deletion = cmds.listRelatives( fkw , c=True, f=True ,s=False)
                        cmds.delete( deletion )
                        cmds.rename( fkw , IK_wrist_new_oriented )
                cmds.parent( dupli_offset_fk , IK_wrist_original )          
                reparenIk_ls = cmds.listRelatives( IK_wrist_original , c=True, f=True ,s=False)
                for ik_related in reparenIk_ls:
                    try:
                        cmds.parent( ik_related , IK_wrist_new_oriented )
                    except Exception:
                        pass
                delete_ik_dupli = cmds.duplicate( IK_wrist_original , rc=True)[0]
                shape_ik_dupli = cmds.listRelatives( delete_ik_dupli , c=True, s = True )[0]
                cmds.parent( shape_ik_dupli , IK_wrist_new_oriented  , s=1, r=1 ) ## shape parent
                shape_nurb , delete_dupl = edit_shape( IK_wrist_new_oriented  , dupli= False, value=[ 1, 0.65, 1 ])
                cmds.sets ( IK_wrist_new_oriented , edit=True , forceElement  = 'ControlSet' )
                cmds.delete ( delete_ik_dupli )


def cog_creation( is_checked ,templa_skelet_type):
    cmds.rename( ROOTX_M, COG_)
    
def cog_creation___________out_of_using( is_checked ,templa_skelet_type):
    if is_checked:
        father_offset = cmds.listRelatives( ROOTX_M, p = True, type = 'transform')[0]
        offset_dupli = cmds.duplicate( father_offset )[0]
        cog = cmds.listRelatives( offset_dupli, c = True, type = 'transform', f = True)[0]
        cmds.rename( cog , COG_ )
        cmds.parent( offset_dupli, "FKSpine1_M" )
        resetTransf( offset_dupli )
        offset_offset = cmds.listRelatives ( father_offset , p = True, type = 'transform')[0]
        cmds.parent( offset_dupli, offset_offset )
        setTransf( father_offset, offset_dupli , transf=['t'])
        fix_rotation ( offset_dupli )
        contrain = cmds.parentConstraint ( COG_  , ROOTX_M , mo = True )[0]
        cmds.setAttr( ROOTX_M+'.visibility', 0 )
        mel.eval("joint -p -0 0 -0 ;")
        joint = cmds.ls( sl=True )[0]
        contrain2 = cmds.parentConstraint ( COG_  , joint , mo = False )[0]
        cmds.delete( contrain2 )
        cmds.select( joint , COG_ )
        mel.eval('SmoothBindSkin;')
        if templa_skelet_type == 'biped':
            cmds.setAttr ( joint + ".rotateZ", -90 )
        elif templa_skelet_type == 'quadruped':
            cmds.setAttr ( joint + ".rotateZ", -180 )
        cmds.select( COG_ )
        mel.eval('DeleteHistory;')
        cmds.delete( joint)
        unlock_transf( COG_ , transf = ['t','r'])
        cmds.sets ( COG_ , edit=True , forceElement  = 'ControlSet' )
        cmds.sets( [ ROOTX_M, father_offset], rm = 'ControlSet'  )
    
def creating_pole_vectors_ref( is_checked ):
    if is_checked:
        pole_vectors_ls = [ ('RollToes1_*' , 'Ankle_'),
                            ('RollFingers1_*' , 'Wrist_'),
                            ('PoleLegMiddle_*',  'MiddleLeg3_'  ),
                            ('PoleLegBack_*', 'BackLeg3_' , 'Knee_'),
                            ('PoleLegFront_*', 'FrontLeg3_' , 'Elbow_'), 
                            ('PoleLeg_*', 'Knee_' ),
                            ('PoleArm_*', 'Elbow_' ) ]
        for p in pole_vectors_ls:       
            pole_ = cmds.ls( p[0], type='transform' )
            if pole_ != []:
                for pole in pole_:
                    pole_offset = cmds.listRelatives( pole, p = True , type = 'transform')[0]
                    try:
                        dupli_offset = cmds.duplicate( pole_offset )[0]
                    except Exception:
                        pass
                    cmds.parent( dupli_offset, w = True )
                    pole_dupli = cmds.listRelatives( dupli_offset, c = True , type = 'transform', f = True)[0]
                    cmds.rename( pole_dupli , pole+'_ref')
                    try:
                        cmds.parent( dupli_offset, p[1]+pole.split('_')[-1] )
                    except Exception:
                        cmds.parent( dupli_offset, p[2]+pole.split('_')[-1] )    
                    cmds.setAttr ( dupli_offset+'.visibility', k = True )
                    cmds.setAttr ( dupli_offset+'.visibility', l = False )
                    cmds.setAttr ( dupli_offset+'.visibility', 0 )

def setTransfDefault(target):
    axes=["X","Y","Z"]
    for transform in TRANSFORMS:
        for axe in axes:
            value= 0
            if transform == 'scale':
                value=1
            try:
                cmds.setAttr ( target+"."+transform+axe, value )
            except Exception as err:
                print( err )
                pass

def arrow_shape( is_checked ):
    if is_checked:
        cmds.file( PATH_ARROW  , i = True )
        list = cmds.ls ( FKROOT_ARROW ) 
        if list != []:
            shape = cmds.listRelatives( FKROOT_ARROW+'1', c = True, shapes=True )
            shapeDelete = cmds.listRelatives( FKROOT_ARROW, c = True, shapes=True )
            cmds.parent( shape, FKROOT_ARROW, s=1, r=1 )
            cmds.delete( FKROOT_ARROW+'1',shapeDelete )
        else:
            cmds.rename( FKROOT_ARROW + '1', FKROOT_ARROW )
            cmds.parent ( FKROOT_ARROW ,  'RootSystem' )
            cmds.sets ( [ FKROOT_ARROW ] , edit=True , forceElement  = 'ControlSet' )
        for transf in ['t' , 'r']:
            for axe in [ 'x' , 'y', 'z' ]:
                try:
                    mel.eval( 'source channelBoxCommand;CBdeleteConnection "root.%s%s";'%( transf, axe ) )
                except Exception:
                    pass
        try:
            cmds.parentConstraint( FKROOT_ARROW , ROOT , mo = True )
        except Exception:
            pass

            
def moveAll_controls( is_checked ):
    if is_checked:
        cmds.rename( 'Main', MoveAll2 )
        dupli = cmds.duplicate( MoveAll2 )
        cmds.rename( dupli , MoveAll1 )
        
        shape_nurb , delete_dupl = edit_shape( MoveAll1  , dupli= False, value=[ 1.3, 1.3, 1.3 ])

        unlock_transf( MoveAll1 , transf = ['t','r','s'])
        cmds.parent ( MoveAll2 ,MoveAll1 )
        cmds.sets ( [ MoveAll2 ,MoveAll1 ] , edit=True , forceElement  = 'ControlSet' )

def hip_translation( is_checked , templa_skelet_type ):
    if is_checked:
        for axe in ['X','Y','Z']: 
            cmds.setAttr ( HIP+'.translate'+axe, k = True )
            cmds.setAttr ( HIP+'.translate'+axe, l = False )
        offset = cmds.listRelatives ( HIP, p =True, type = 'transform')[0]
        dupli_hip = cmds.duplicate( HIP )
        cmds.rename( dupli_hip , 'offset_'+HIP )
        children = cmds.listRelatives( 'offset_'+HIP , ad = True )
        cmds.delete( children )
        cmds.parent( HIP , 'offset_'+ HIP )
        resetTransf( offset )
        offset_cog = cmds.listRelatives( COG_ , p = True , type='transform')[0]
        if templa_skelet_type == 'biped':
            cmds.connectAttr( HIP+'.translateX', offset_cog+'.translateX' )
            cmds.connectAttr( HIP+'.translateZ', offset_cog+'.translateZ' )
            cmds.connectAttr( HIP+'.translateY', offset_cog+'.translateY' )
        #if templa_skelet_type == 'quadruped':
        #    multiple_div = mel.eval ( 'createRenderNodeCB -asUtility "" multiplyDivide "";' )
        #    cmds.connectAttr( HIP+'.translateZ', offset_cog+'.translateX' )
        #    cmds.connectAttr( HIP+'.translateY', multiple_div+'.input1Y' )
        #    cmds.setAttr( multiple_div+'.input2Y', -1)
        #    cmds.connectAttr( multiple_div+'.outputY' , offset_cog+'.translateY' )
        #    cmds.connectAttr( HIP+'.translateX', offset_cog+'.translateZ' )
            
        multiple_divide = mel.eval ( 'createRenderNodeCB -asUtility "" multiplyDivide "";' )

        cmds.connectAttr( HIP+'.translateX', multiple_divide+'.input1X' ) 
        cmds.connectAttr( HIP+'.translateY', multiple_divide+'.input1Y' )       
        cmds.connectAttr( HIP+'.translateZ', multiple_divide+'.input1Z' )
        
        cmds.setAttr( multiple_divide+'.input2X', -1)
        cmds.setAttr( multiple_divide+'.input2Y', -1)
        cmds.setAttr( multiple_divide+'.input2Z', -1)
        
        cmds.connectAttr(  multiple_divide+'.outputX', 'offset_'+ HIP+'.translateX' )
        cmds.connectAttr( multiple_divide+'.outputY' , 'offset_'+ HIP+'.translateY' )
        cmds.connectAttr( multiple_divide+'.outputZ' , 'offset_'+ HIP+'.translateZ' )
        
        mel.eval( 'CreateLocator;' )
        loc = cmds.ls( sl = True)[0]
        cmds.parent( loc , HIP )
        resetTransf( loc )

        offset_spine1 = cmds.listRelatives ( Spine1, p =True, type = 'transform')[0]
        offset2lev_spine1 = cmds.listRelatives ( offset_spine1, p =True, type = 'transform')[0]
        cmds.parent( loc , offset2lev_spine1 )
        resetTransf( loc , axe_enable = ['t'] )
        value = cmds.getAttr('FKOffsetRoot_M.rotateY' )
        value2 = cmds.getAttr( loc+'.rotateZ' )
        new_value = value2 + value
        cmds.setAttr( loc+'.rotateZ' , new_value )
        cmds.rename(loc, 'offset_'+Spine1)
        shapesLoc = cmds.listRelatives( 'offset_'+Spine1 , ad = True)
        cmds.delete( shapesLoc  )
        cmds.duplicate( 'offset_'+Spine1 , n = 'offset2_'+Spine1 )
        cmds.parent( 'offset_'+Spine1 , 'offset2_'+Spine1 )
        cmds.parent( offset_spine1, 'offset_'+Spine1  )
        
        multiple_divide2 = mel.eval ( 'createRenderNodeCB -asUtility "" multiplyDivide "";' )
        
        cmds.connectAttr( HIP+'.translateX', multiple_divide2+'.input1X' )
        cmds.connectAttr( HIP+'.translateY', multiple_divide2+'.input1Y' )
        cmds.connectAttr( HIP+'.translateZ', multiple_divide2+'.input1Z' )
        
        cmds.setAttr( multiple_divide2+'.input2X', -1)
        cmds.setAttr( multiple_divide2+'.input2Y', -1)
        cmds.setAttr( multiple_divide2+'.input2Z', -1)
        
        if templa_skelet_type == 'biped':
        
            cmds.connectAttr(  multiple_divide2+'.outputX', 'offset_'+Spine1+'.translateX' )
            cmds.connectAttr(  multiple_divide2+'.outputY' , 'offset_'+Spine1+'.translateY' )
            cmds.connectAttr(  multiple_divide2+'.outputZ' , 'offset_'+Spine1+'.translateZ' )

        #if templa_skelet_type == 'quadruped':
        #    cmds.connectAttr(  HIP+'.translateX', 'offset_'+Spine1+'.translateY' )
        #    cmds.connectAttr(  multiple_divide2+'.outputY' , 'offset_'+Spine1+'.translateX' )
        #    cmds.connectAttr(  multiple_divide2+'.outputZ' , 'offset_'+Spine1+'.translateZ' )


def hip_translation__________________old( is_checked , templa_skelet_type ):
    if is_checked:
        for axe in ['X','Y','Z']: 
            cmds.setAttr ( HIP+'.translate'+axe, k = True )
            cmds.setAttr ( HIP+'.translate'+axe, l = False )
        offset = cmds.listRelatives ( HIP, p =True, type = 'transform')[0]
        dupli_hip = cmds.duplicate( HIP )
        cmds.rename( dupli_hip , 'offset_'+HIP )
        children = cmds.listRelatives( 'offset_'+HIP , ad = True )
        cmds.delete( children )
        cmds.parent( HIP , 'offset_'+ HIP )
        resetTransf( offset )
        offset_cog = cmds.listRelatives( COG_ , p = True , type='transform')[0]
        if templa_skelet_type == 'biped':
            cmds.connectAttr( HIP+'.translateZ', offset_cog+'.translateX' )
            cmds.connectAttr( HIP+'.translateY', offset_cog+'.translateZ' )
            cmds.connectAttr( HIP+'.translateX', offset_cog+'.translateY' )
        if templa_skelet_type == 'quadruped':
            multiple_div = mel.eval ( 'createRenderNodeCB -asUtility "" multiplyDivide "";' )
            cmds.connectAttr( HIP+'.translateZ', offset_cog+'.translateX' )
            cmds.connectAttr( HIP+'.translateY', multiple_div+'.input1Y' )
            cmds.setAttr( multiple_div+'.input2Y', -1)
            cmds.connectAttr( multiple_div+'.outputY' , offset_cog+'.translateY' )
            cmds.connectAttr( HIP+'.translateX', offset_cog+'.translateZ' )
            
        multiple_divide = mel.eval ( 'createRenderNodeCB -asUtility "" multiplyDivide "";' )

        cmds.connectAttr( HIP+'.translateX', multiple_divide+'.input1X' ) 
        cmds.connectAttr( HIP+'.translateY', multiple_divide+'.input1Y' )       
        cmds.connectAttr( HIP+'.translateZ', multiple_divide+'.input1Z' )
        
        cmds.setAttr( multiple_divide+'.input2X', -1)
        cmds.setAttr( multiple_divide+'.input2Y', -1)
        cmds.setAttr( multiple_divide+'.input2Z', -1)
        
        cmds.connectAttr(  multiple_divide+'.outputX', 'offset_'+ HIP+'.translateX' )
        cmds.connectAttr( multiple_divide+'.outputY' , 'offset_'+ HIP+'.translateY' )
        cmds.connectAttr( multiple_divide+'.outputZ' , 'offset_'+ HIP+'.translateZ' )
        
        mel.eval( 'CreateLocator;' )
        loc = cmds.ls( sl = True)[0]
        cmds.parent( loc , HIP )
        resetTransf( loc )

        offset_spine1 = cmds.listRelatives ( Spine1, p =True, type = 'transform')[0]
        offset2lev_spine1 = cmds.listRelatives ( offset_spine1, p =True, type = 'transform')[0]
        cmds.parent( loc , offset2lev_spine1 )
        resetTransf( loc , axe_enable = ['t'] )
        value = cmds.getAttr('FKOffsetRoot_M.rotateY' )
        value2 = cmds.getAttr( loc+'.rotateZ' )
        new_value = value2 + value
        cmds.setAttr( loc+'.rotateZ' , new_value )
        cmds.rename(loc, 'offset_'+Spine1)
        shapesLoc = cmds.listRelatives( 'offset_'+Spine1 , ad = True)
        cmds.delete( shapesLoc  )
        cmds.duplicate( 'offset_'+Spine1 , n = 'offset2_'+Spine1 )
        cmds.parent( 'offset_'+Spine1 , 'offset2_'+Spine1 )
        cmds.parent( offset_spine1, 'offset_'+Spine1  )
        
        multiple_divide2 = mel.eval ( 'createRenderNodeCB -asUtility "" multiplyDivide "";' )
        
        cmds.connectAttr( HIP+'.translateX', multiple_divide2+'.input1X' )
        cmds.connectAttr( HIP+'.translateY', multiple_divide2+'.input1Y' )
        cmds.connectAttr( HIP+'.translateZ', multiple_divide2+'.input1Z' )
        
        cmds.setAttr( multiple_divide2+'.input2X', -1)
        cmds.setAttr( multiple_divide2+'.input2Y', -1)
        cmds.setAttr( multiple_divide2+'.input2Z', -1)
        
        if templa_skelet_type == 'biped':
        
            cmds.connectAttr(  multiple_divide2+'.outputX', 'offset_'+Spine1+'.translateX' )
            cmds.connectAttr(  multiple_divide2+'.outputY' , 'offset_'+Spine1+'.translateY' )
            cmds.connectAttr(  multiple_divide2+'.outputZ' , 'offset_'+Spine1+'.translateZ' )

        if templa_skelet_type == 'quadruped':
            cmds.connectAttr(  HIP+'.translateX', 'offset_'+Spine1+'.translateY' )
            cmds.connectAttr(  multiple_divide2+'.outputY' , 'offset_'+Spine1+'.translateX' )
            cmds.connectAttr(  multiple_divide2+'.outputZ' , 'offset_'+Spine1+'.translateZ' )

def worldZero_creation( is_checked ):
    if is_checked:
        cmds.select( cl=True)
        mel.eval( 'Group;')
        null = cmds.ls( sl=True )[0]
        cmds.rename ( null, WORLD_ZERO )
        mel.eval( 'circle -c 0 0 0 -nr 0 1 0 -sw 360 -r 1 -d 3 -ut 0 -tol 0.01 -s 8 -ch 1; objectMoveCommand;' )
        circlel = cmds.ls( sl=True )[0]
        
        cmds.rename ( circlel, GUN_FOLLOW%'l' )
        
        shape_nurb , delete_dupl = edit_shape( GUN_FOLLOW%'l'  , dupli= False, value=[ 9, 9, 9 ])
        unlock_transf( GUN_FOLLOW , transf = ['t','r','s'] )
        cmds.duplicate( GUN_FOLLOW%'l' , n=GUN_FOLLOW%'r' )
        cmds.duplicate( GUN_FOLLOW%'l' , n=WEAPON_DRIVER )
        shape_nurb , delete_dupl = edit_shape( WEAPON_DRIVER  , dupli= False, value=[ 0.75, 0.75, 0.75 ])
        unlock_transf( WEAPON_DRIVER , transf = ['t','r','s'] )
        
        off_foolow_l = offset_creation( GUN_FOLLOW%'l' )
        off_foolow_r = offset_creation( GUN_FOLLOW%'r' )
        cmds.setAttr( off_foolow_l + '.translateX', 9 )
        cmds.setAttr( off_foolow_r + '.translateX', -9 )
        off_weapon_driver = offset_creation( WEAPON_DRIVER )
        cmds.setAttr( off_weapon_driver + '.rotateX', -90 )
        cmds.setAttr( off_weapon_driver + '.rotateY', -90 )

        
        cmds.parent ( [ WORLD_ZERO  ] , 'Group' )
        cmds.parent ( [ off_foolow_l, off_foolow_r  , off_weapon_driver] ,  MoveAll2 ) 


def quadrupeds_leg_features( is_checked , templa_skelet_type):
    if is_checked and templa_skelet_type == 'quadruped':
        control_tuple = [( 'FKPivottoetip_' , 'RollbackHeel_', 'FKPivottoetip_', 'RollToes2_'), 
                         ('FKPivotfingertip_', 'RollfrontHeel_', 'FKPivotfingertip_' , 'RollFingers2_') ]
        side_ls = ['L','R']
        for tup in control_tuple:
            for side in side_ls:
                orient_constrain = cmds.orientConstraint( tup[1]+side , tup[0]+side , mo = True  )[0]
                cmds.setAttr( tup[3]+side+'.rotateX'   ,   0  )
                cmds.setAttr( orient_constrain+'.'+tup[1]+side+'W0'   ,   0  )
                cmds.setDrivenKeyframe( orient_constrain+'.'+tup[1]+side+'W0', cd = tup[3]+side+'.rotateX'  )
                
                cmds.setAttr( tup[3]+side+'.rotateX'   ,   7  )
                cmds.setAttr( orient_constrain+'.'+tup[1]+side+'W0'   ,   1  )
                cmds.setDrivenKeyframe( orient_constrain+'.'+tup[1]+side+'W0', cd = tup[3]+side+'.rotateX'  )
                
                cmds.setAttr( tup[3]+side+'.rotateX'   ,   0  )        
                FKPivot_offset = cmds.listRelatives( tup[2]+side , p =True, type = 'transform')[0]
                cmds.sets( [ tup[2]+side, FKPivot_offset ], rm = 'ControlSet'  )
        ### excluir de control set

def list_controls():
    cmds.select( 'ControlSet' )
    control_set_ls = cmds.ls( sl = True )
    return control_set_ls


def create_hand_object_joint( is_checked ):
    if is_checked:
        hand_obj_patt = HAND_OBJ
        wrist_patt = 'Wrist_'
        for side in ['L','R']:
            if cmds.ls( wrist_patt+side, type='joint') != []:
                loc = mel.eval( "spaceLocator -p 0 0 0;" )[0]
                shape_loc = cmds.listRelatives( loc, c=True, s=True )
                cmds.delete( shape_loc )
                offset = 'offset'+side+'_origHandObject'
                loc = cmds.rename( loc, offset )
                cmds.parent( offset, wrist_patt+side )
                resetTransf( offset )
                
                ik_arm = 'IKArm_' + side 
                
                offset_fing = 'FKOffsetMiddleFinger1_' + side
                value = cmds.getAttr( offset_fing + '.translateY' )
                Z_value = value * 2
                X_value = value * 0.5
                cmds.setAttr ( offset + ".translateY", Z_value )
                cmds.setAttr ( offset + ".translateX", X_value )
                
                cmds.parent( offset , 'Group' )
                
                #cmds.parentConstraint ( wrist_patt+side  , offset , mo = True )
                
                control = mel.eval( "spaceLocator -p 0 0 0;" )[0]
                shape_loc = cmds.listRelatives( control, c=True, s=True )
                cmds.delete( shape_loc )
                control = cmds.rename( control, side+hand_obj_patt ) 
                
                cmds.sets ( control , edit=True , forceElement  = 'ControlSet' )
                
                joint = WEAPON_PREFIX_JNT +side.lower()
                cmds.parentConstraint ( control  , joint , mo = False )

                cmds.parent( control  , offset )
                resetTransf( control )
                sc.create_offset( [ offset] + [wrist_patt+side] )
                sc.IKSpaceCreator( offset, [wrist_patt+side] )

                shape_nurb ,delete_dupl = edit_shape( ik_arm , dupli= True)
                
                cmds.parent(  shape_nurb   ,  control  , s=1 , r=1)
                cmds.delete( delete_dupl )
                    

def do_parenting ( parent_ls , disconnect_t_ls ):
    cmds.select( parent_ls )
    p2t.do_parenting_thing('parent', disconnect_t_ls, with_scriptjob = True, constrain_offset = True,
            attribname = "parentTo" )

def loop_selecting_parenting ( control_pattern_ls, parent_default_ls, extra_ls , disconnect_t_ls = [] ):
    control_set_ls = list_controls()
    for item_ls in control_pattern_ls:
        list = cmds.ls( item_ls , type = 'transform' )
        for item in list :
            if item in control_set_ls or HAND_OBJ in item:
                list = [ item ] + parent_default_ls + extra_ls 
                for obj in list:
                    unlock_transf( obj, transf= ['t', 'r', 's'] )
                do_parenting ( list, disconnect_t_ls )

def delete_script():
    scripts = cmds.ls( '*matcher*','script_rot*', type ='script')
    if [] != scripts:
        cmds.delete( scripts )

def set_parent_to( is_checked ):
    if is_checked :
        delete_script()
        scapula_shoulder_ls = ['FKScapula_?', 'FK*Leg1_?' , 'FKShoulder_?']
        head_control_ls = [ 'FKHead_M' ]
        ik_control_ls_R = [ 'IKArm_R', 'IKLegBack_R' , 'IKLegFront_R' , 'IKLegMiddle_R' ]
        ik_control_ls_L = [ 'IKArm_L', 'IKLegBack_L' , 'IKLegFront_L' , 'IKLegMiddle_L' ] 
        root_arrow = [ 'FKroot_M']
        
        parent_default_ls = [ 'WorldZero' , MoveAll1, MoveAll2 ]
        parent_cog_ls = [ 'Cog' ]
        parent_chest_ls = ['FKChest_M']
        parent_to_head = [ 'FKHead_M' ]
        gun_obj_l_hand = [ 'R'+HAND_OBJ, GUN_FOLLOW%'l']
        gun_obj_r_hand = [ 'L'+HAND_OBJ, GUN_FOLLOW%'r']
        
        loop_selecting_parenting ( scapula_shoulder_ls, parent_default_ls, parent_cog_ls + parent_chest_ls ,
                                disconnect_t_ls = ['x','y','z'] )
        loop_selecting_parenting ( head_control_ls, parent_default_ls, [] , disconnect_t_ls = ['x','y','z'] )
        loop_selecting_parenting ( ik_control_ls_R, parent_default_ls, 
                                  parent_cog_ls + parent_chest_ls + parent_to_head )#+ gun_obj_r_hand)
        loop_selecting_parenting ( ik_control_ls_L, parent_default_ls, 
                                  parent_cog_ls + parent_chest_ls + parent_to_head )#+ gun_obj_l_hand)
        loop_selecting_parenting ( root_arrow , parent_default_ls, parent_cog_ls , disconnect_t_ls = ['y'] )


def unparent_root( is_checked ):
    if is_checked:
        try:
            cmds.parent( ROOT , w=True)
        except Exception as err:
            print ('warning error')
            print ( err )

def switch_ik_fk_preparing( is_checked , templa_skelet_type):
    if is_checked:
        
        if templa_skelet_type == 'biped':

            wrist_ik_match_ls = [ ( 'Wrist_', 'IKArm_', 'MiddleFinger1_' ) ,
                                ( 'Ankle_', 'IKLeg_', 'Toes_' ) ]


        elif templa_skelet_type == 'quadruped':
            wrist_ik_match_ls = [ ( 'Fingers1_', 'IKLegFront_', 'MiddleFinger1_' ) ,
                                ( 'Toes1_', 'IKLegBack_', 'Alltoes_' ) ]

        for tuple_ik in wrist_ik_match_ls:
            for side in ['R','L']:
                loc = mel.eval( "spaceLocator -p 0 0 0;" )[0]
                cmds.setAttr ( loc + ".visibility" , 0 )
                cmds.rename( loc, tuple_ik[0]+ side + '_matcherA' )
                loc2 = mel.eval( "spaceLocator -p 0 0 0;" )[0]
                cmds.setAttr ( loc2 + ".visibility" , 0 )
                cmds.rename( loc2, tuple_ik[0]+ side + '_matcherB' )
                
                cmds.parent ( tuple_ik[0]+ side + '_matcherA' , tuple_ik[0]+ side  )
                cmds.parent ( tuple_ik[0]+ side + '_matcherB' , tuple_ik[0]+ side  )
                
                setTransfDefault( tuple_ik[0]+ side + '_matcherA' )
                setTransfDefault( tuple_ik[0]+ side + '_matcherB' )
                if templa_skelet_type == 'biped':
                    try:
                        cmds.parent ( tuple_ik[0]+ side + '_matcherA' , tuple_ik[0]+side )
                    except Exception as err:
                        print( ' warning try...')
                        print ( err)
                cmds.parent ( tuple_ik[0]+ side + '_matcherB', tuple_ik[1]+side )

def set_color( shape, color_index ):
    for sha in cmds.ls ( shape, l = True ):
        try:
            cmds.setAttr ( sha+'.overrideEnabled' ,1)
            cmds.setAttr ( sha+'.overrideColor' , color_index )
        except Exception as err:
            print ( err )

def set_color_controls( is_checked ):
    if is_checked:
        azul =6
        verde=14
        amarillo=17
        rojo=13
        blanco=16
        violeta=9
        control_set_ls = list_controls()
        for control in control_set_ls:
            color = 'nocolor'
            if control.endswith('_L') or control.startswith('L_'):
                color = verde
            elif control.endswith('_R') or control.startswith('R_') :
                color = rojo
            elif control == 'Cog' or control == MoveAll2:
                color = violeta
            if color != 'nocolor':
                controlShape_ls = cmds.listRelatives( control , s = True, c = True ) or []
                for controlShape in controlShape_ls:
                    set_color( controlShape, color )


def get_setLs( method ):
    if method ==  'parent_tool':
        set_ls = [ [ 'IKArm_R', GUN_FOLLOW%'r', 'L'+HAND_OBJ ], # , '_offset_parentToIKArm_R' idx1
                   [ 'IKArm_L', GUN_FOLLOW%'l', 'R'+HAND_OBJ ], # , '_offset_parentToIKArm_L'  idx1
                   [ WEAPON_DRIVER ,'L_Hand_Object', 'R_Hand_Object' ]]#,  ##   , OFFSET_NA %(WEAPON_DRIVER)  idx1
    elif method == 'spaceCreator':
        set_ls = [ [ 'IKArm_R', '_offset_parentToIKArm_R', GUN_FOLLOW%'r', 'L'+HAND_OBJ ] ,#  idx1
                   [ 'IKArm_L', '_offset_parentToIKArm_L', GUN_FOLLOW%'l', 'R'+HAND_OBJ ] ,#   idx1
                   [ WEAPON_DRIVER, OFFSET_NA %(WEAPON_DRIVER) ,'L'+HAND_OBJ , 'R'+HAND_OBJ ]]#,  ##     idx1 
        
    elif method == 'spaceSwitch' :
        set_ls = [ [ '_offset_parentToIKArm_R', GUN_FOLLOW%'r', 'L'+HAND_OBJ,  'IKArm_R',  ] ,
                   [ '_offset_parentToIKArm_L', GUN_FOLLOW%'l', 'R'+HAND_OBJ,   'IKArm_L',  ] ,
                   [  OFFSET_NA %(WEAPON_DRIVER) ,'L'+HAND_OBJ , 'R'+HAND_OBJ,  WEAPON_DRIVER ]] 
        
    return set_ls

def do_gun_space( is_checked , method = 'spaceSwitch'):
    if is_checked:
        set_ls = get_setLs( method )
        for list in set_ls:
            for item in list:
                unlock_transf( item, transf= ['t', 'r', 's'] )
            cmds.select( list )
            control_ls = cmds.ls( sl=True )
            if method == 'spaceCreator':
                target = control_ls[0]
                sources = [ obj for obj in control_ls  if obj != target ]
                sc.create_offset( [ target ] + sources )
                sc.IKSpaceCreator( target, sources )
            elif method == 'parent_tool':
                cmds.select( list )
                disconn_ls = []
                p2t.do_parenting_thing('gun_space', disconn_ls, with_scriptjob = False,
                                        constrain_offset = False, attribname = "gun_space" )
            elif method == 'spaceSwitch':
                target = list[-1]
                offset = offset_creation( target )
                list.remove( target )
                cmds.select( list + [offset] )
                ss.switchedParentMatrix(trans = "ALL", rot = "ALL", scale = None, switchControl = target)

def delete_namespaces( is_checked ):
    if is_checked:
        curNS = cmds.namespaceInfo( lon=True )
        defaults = ["UI", "shared"]
        diff = [item for item in curNS if item not in defaults]
        for ns in diff:
        	if cmds.namespace( exists=str(ns)):
        		cmds.namespace( rm=str(ns) )
     
def camera_importing( is_checked ):
    if is_checked:
        camera_jt = cmds.ls( 'Camera', type = 'join' )
        if camera_jt == []:
            cmds.file( PATH_CAMERA_CHAR  , i = True )
            delete_namespaces( True )
        try:
            contrain = cmds.pointConstraint ( 'FKChest_M'  , CAM_OFFS_CONST , mo = False )[0]
            contrain = cmds.orientConstraint ( 'FKChest_M'  , CAM_OFFS_CONST , mo = True )[0]
            cmds.parent( CAM_SETTINGS_GRP, 'Group')
            cmds.parent ( 'Camera' , 'root')
        except Exception:
            pass
        point_c = cmds.pointConstraint( 'FKHead_M' , CAM_OFFS_CONST2 , mo = False )
        cmds.delete ( point_c )
        
        
def set_export_creation( is_checked ):
    if is_checked:
        geo_ls = cmds.listRelatives (MESHGRP, ad=True, type='mesh' , f = True) or []
        final_geo_ls = []
        for shape in geo_ls:
            transf = cmds.listRelatives (shape, p=True, type='transform', f = True )
            if transf not in final_geo_ls:
                final_geo_ls.append(transf)
        joint_ls = cmds.listRelatives ('root', ad=True, type='joint' , f = True)
        cmds.select( cl = True)
        cmds.sets(  n=MESHSET )
        for obj in final_geo_ls + ['root'] + joint_ls:
            cmds.sets ( obj , edit=True , forceElement  = MESHSET )

        cmds.sets( ['root'] + joint_ls, n=ANIMSET )

def set_driven_visibility( driver, attr_na , value, side, driven_ls_ctrl):
    cmds.setAttr( driver+'.'+ attr_na, value )
    for driven  in driven_ls_ctrl:
        try:
            cmds.setAttr( driven + side +'.visibility', value )
            cmds.setDrivenKeyframe( driven + side +'.visibility', cd = driver +'.'+ attr_na )
        except Exception as err:
            print ( err )
            print ( ' set driven key error warning exception ')
            pass

def add_attrb_hide_ar_cnt( attr_na , control_driver , driven_ls_ctrl , side ):
    cmds.addAttr ( control_driver + side ,  r=True, k=True , h=False, ln =  attr_na , dv = 1 , at ="bool"  )
    set_driven_visibility( control_driver + side , attr_na , 1 , side, driven_ls_ctrl )
    set_driven_visibility( control_driver + side, attr_na , 0 , side, driven_ls_ctrl )
    cmds.setAttr ( control_driver + side + '.' + attr_na, keyable = False , channelBox = True , lock = False  )

def set_ik_hands_pose_fk______( is_checked ):
    if is_checked:
        for side in ['L','R']:
            fk_wrist, ik_wrist = ( 'FKWrist_' , 'IKArm_' )
            fk_wrist = fk_wrist +  side
            ik_wrist = ik_wrist + side 
            parentConstr = cmds.parentConstraint ( fk_wrist , ik_wrist  , mo = False )
            cmds.delete ( parentConstr )

def get_shapes_pole_vec():
        cmds.file( PATH_CONTROL_SH  , i = True )
        delete_namespaces( True )
        dicc = { 'Sphere' : 'PoleLeg_', 'Diamond' : 'PoleArm_' }

        for cont_sh in dicc :
            try:
                cmds.parent( cont_sh, w = True )
            except Exception:
                pass
            cont_sh_dupl = cmds.duplicate( cont_sh )[0]
            dicc_side = { 'L':cont_sh, 'R': cont_sh_dupl }
            for side in dicc_side:
                shape , del_ = edit_shape( dicc_side[side]  , dupli= False, value=[ 3.5, 3.5, 3.5 ])
                control_shapes = cmds.listRelatives(  dicc_side[side] , c = True, s = True )[0]
                shape , del_ = edit_shape( dicc[ cont_sh ]+side   , dupli= False, value=[ 0.6, 0.6, 0.6 ])
                cmds.parent( control_shapes , dicc[ cont_sh ]+side , s=1 , r=1 )
                cmds.delete( dicc_side[side] )
        cmds.delete( 'deleteThis' )

def lock_hide_attrb():
    atr_idx = ['0', '1', '2']
    for idx in atr_idx:
        for attrb in  [ "FKSpine1_M.w" , "FKNeck_M.w" ]:
            cmds.setAttr ( attrb + idx , lock = True , keyable = False , channelBox = False )



def set_freze_ik_controls():
    orient_sufi = 'Oriented_'
    fk_wrist, ikwrist = ( 'FKWrist_' , 'IKArm_' )
    for side in [ 'R', 'L' ]:
        IK_wrist_new_oriented = ikwrist + orient_sufi + side
        IK_wrist_original = ikwrist + side
        FK_Wr = fk_wrist + side
        freeze_ik_control(  IK_wrist_original , IK_wrist_new_oriented , FK_Wr )
        edit_shape( IK_wrist_original , dupli = False , value=[ 1.2, 1.2, 1.2 ] , transformation = 'scale')
        edit_shape( IK_wrist_new_oriented , dupli = False , value=[ 0.8, 0.8, 0.8 ] , transformation = 'scale')

def constraint_custom_joints():
    full_skel_joints_ls = cmds.listRelatives('pelvis', ad=True, type = 'joint', f = True )
    ls_c = [ DICC_M[j] for j in DICC_M ]
    ls_m1 = [ DICC_MIRROR[j] for j  in DICC_MIRROR]
    ls_m__ = []
    for side in ['r', 'l']:
        for name in ls_m1 + [WEAPON_PREFIX_JNT.replace( '_' , '' )] :
            ls_m__.append( name +'_'+side)
    for obj in full_skel_joints_ls:
        obj = obj.split('|')[-1]
        if obj not in ls_c + ls_m__:
            #new_na = obj[0].upper() + obj[1:] +'_'+ obj[-1].upper()
            new_na = ''
            for idx, o in enumerate(obj):
                if idx == 0 or idx == len( obj ) - 1:
                    o = o.upper()
                new_na = new_na + o
            digit_na = ''
            key = True
            for char in new_na:
                if char == '0':
                    if key:
                        char = ''
                        key = False
                digit_na= digit_na+char
            try:
                cmds.parentConstraint ( digit_na, obj , mo = True )
                cmds.scaleConstraint ( digit_na, obj , mo = True ) 
            except Exception:
                pass

def contrainUnrealWithAdv():
    av_sk_ble_j_ls = ['ElbowPart1_', 'ElbowPart2_' ]
    unrea_sk_j_ls = [ 'lowerarm_twist_02_', 'lowerarm_twist_01_' ]
    for side in ['L', 'R']:
        for idx , joint in enumerate ( av_sk_ble_j_ls ):
            try:
                parentConstr = cmds.parentConstraint ( joint + side , unrea_sk_j_ls[idx] + side.lower()  , mo = True )
                parentConstr = cmds.scaleConstraint ( joint + side , unrea_sk_j_ls[idx] + side.lower()  , mo = True )
            except Exception:
                pass
    for key in DICC_M:
        try:
            cmds.parentConstraint ( key + '_M', DICC_M[key] , mo = True )
            cmds.scaleConstraint ( key + '_M' , DICC_M[key] , mo = True ) 
        except Exception:
            pass
        
    for key in DICC_MIRROR:
        try:
            for side in ['L','R']:
                cmds.parentConstraint ( key + '_'+side, DICC_MIRROR[key] +'_'+ side.lower(), mo = True )
                cmds.scaleConstraint ( key + '_'+side, DICC_MIRROR[key] +'_'+ side.lower(), mo = True ) 
        except Exception:
            pass
    constraint_custom_joints()
            

 
def neck_settings():
    break_connection( 'neck_01'  , ['x','y','z'] , transf_ls = ['t','r',] )
    break_connection( 'neck_02'  , ['x','y','z'] , transf_ls = ['t','r',] )
    cmds.parentConstraint ( 'FKNeck_M'  , 'FKExtraNeck1_M' , mo = True )
    cmds.parentConstraint ( 'FKNeck_M'  , 'neck_01' , mo = True )
    cmds.parentConstraint ( 'FKNeck1_M'  , 'neck_02' , mo = True )
    
    
def skeleton_unreal_settings ( is_checked ):
    if is_checked:
        driven_ls_ctrl = ['BendElbow1_', 'BendElbow2_'  , 'FKElbowPart1_' , 'FKElbowPart2_' ]
        for side in ['L', 'R']:
            add_attrb_hide_ar_cnt( 'hideCtrlBend' , 'FKIKArm_' , driven_ls_ctrl , side )
            add_attrb_hide_ar_cnt( 'hideOrientedCtr' , 'IKArm_' , ['IKArm_Oriented_'] , side )
        driven_ls_ctrl = [ 'FKSpine4_' , 'FKChest_' ] 
        add_attrb_hide_ar_cnt( 'hideCtrlSine' , 'FKIKSpine_' , driven_ls_ctrl , 'M' )
        cmds.setAttr( 'FKSpine4_MShape.visibility', 0 )
        cmds.setAttr ( "FKRoot_MShape.visibility", 0 )
        cmds.setAttr ( "FKmetacarpalsAll_RShape.visibility", 0 )
        cmds.setAttr ( "FKmetacarpalsAll_LShape.visibility", 0 )
        get_shapes_pole_vec()
        contrainUnrealWithAdv()
        neck_settings()
        lock_hide_attrb()
        
def set_color( shape, color_index ):
    for sha in cmds.ls ( shape, l = True ):
        try:
            cmds.setAttr ( sha+'.overrideEnabled' ,1)
            cmds.setAttr ( sha+'.overrideColor' , color_index )
        except Exception as err:
            print ( err )

def delete_unknown_():
    node_ls = cmds.ls('_UNKNOWN_*_')
    for node in node_ls:
        cmds.delete( node )

def set_color_controls( is_checked ):
    if is_checked:
        azul =6
        verde=14
        amarillo=17
        rojo=13
        blanco=16
        violeta=9
        control_set_ls = list_controls()
        for control in control_set_ls:
            color = 'nocolor'
            if control.endswith('_L') or control.startswith('L_'):
                color = verde
            elif control.endswith('_R') or control.startswith('R_') :
                color = rojo
            elif control == 'Cog' or control == MoveAll2:
                color = violeta
            if color != 'nocolor':
                controlShape_ls = cmds.listRelatives( control , s = True, c = True ) or []
                for controlShape in controlShape_ls:
                    set_color( controlShape, color )
                    
                    
def launch_full_post_procces():
    mode = 'biped'
    orient_IK( True ,mode )
    cog_creation( True , mode)
    creating_pole_vectors_ref( True )
    arrow_shape( True )
    moveAll_controls( True )
    hip_translation( True , mode )
    worldZero_creation( True )
    quadrupeds_leg_features( True , mode )
    create_hand_object_joint( True )
    set_parent_to( True )
    switch_ik_fk_preparing( True , mode)
    unparent_root( True )
    do_gun_space( True )
    camera_importing( True )
    set_export_creation( True )
    set_freze_ik_controls()
    skeleton_unreal_settings ( True )
    delete_unknown_()
    delete_namespaces( True )
    set_color_controls( True )