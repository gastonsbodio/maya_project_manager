""" Run the lines below for launch switch processing ( take out the hashtag chars )"""
"""avoid_auto_read"""
"""   IK  to FK   """
#from importlib import reload
#import area_tools.anim.ik_fk_switch_dragon as ikfk
#reload(ikfk)
#ikfk.limb_ik_2_fk()

"""   FK  to  IK   """
#from importlib import reload
#import area_tools.anim.ik_fk_switch_dragon as ikfk
#reload(ikfk)
#ikfk.limb_fk_2_ik()

import importing_modules as im
com = im.importing_modules( 'maya_conn.maya_custom_cmd' )

import maya.cmds as cmds
import maya.mel as mel
DUPLI_SUF = '_dupli'
TRANSFORMS = ["translate","rotate", "scale"]




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
 
 


control_tuple = [ ('Arm2','L') , ('Arm2','R') , ('Leg','L') , ('Leg','R')  ]
                    #### , ( 'Fingers1_%s' , 'IK%s_%s', 'IKFingers1_%s' )
list_tuple_na_front = [( 'Scapula1_%s' , 'FKScapula1_%s' ) , ( 'Wrist1_%s' , 'IK%s_%s', 'FKIndexFinger11_%s' ) , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) , 
                    ( 'Scapula15_%s' , 'FKScapula1_%s' ) , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,( 'Scapula15_%s' , 'FKScapula1_%s' ) ,
                    ( 'Scapula15_%s' , 'FKScapula1_%s' ) , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,( 'Scapula15_%s' , 'FKScapula1_%s' ) ]

                    ####   
list_tuple_na_back= [( 'Hip_%s' , 'FKHip_%s' ), ( 'Toes1_%s' , 'IK%s_%s' , 'IKToes1_%s', 'Ankle_%s'),
                     ( 'Ankle_%s' , 'IK%s_%s')  , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) , 
                    ( 'Hip5_%s' , 'FKHip_%s' ) , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,( 'Hip5_%s' , 'FKHip_%s' ) ,
                    ( 'Hip5_%s' , 'FKHip_%s' ) , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,( 'Hip5_%s' , 'FKHip_%s' ) ]#,
                    #( 'Toes1_%s' , 'IKToes1%s_%s' )]


back_ls =  [   'Hip',    'Knee'  , 'Ankle' ,  'Toes1' ,  'Toes2']
front_ls = ['Scapula1', 'Shoulder1', 'Elbow1' ,  'Wrist1' ] #, 'Fingers1']


leg_na_templa = "%sLeg%s_%s"
switch_na_templa = "FKIK%s_%s"

def get_father_duplic( obj , attrBend , ikfkbend = 'None' ):
    if ':' not in obj:
        father_offset = cmds.listRelatives( '*:'+obj , parent=True, f=True)[0]
    else:
        father_offset = cmds.listRelatives( obj , parent=True, f=True)[0]
    
    try:
        if ikfkbend != 'None':
            cmds.setAttr( attrBend , ikfkbend)
        dupli_offset = cmds.duplicate( father_offset , name= father_offset.split(':')[-1] + DUPLI_SUF)[0]
    except Exception as err:
        print(err)
        pass
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

def setTransf(source, target):
    axes=["X","Y","Z"]
    transfs = ["translate","rotate","scale"]
    for transform in transfs:
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

def set_defaul_value( control ):         
    attrb_ls = cmds.listAttr( control, keyable=True )
    for attr in attrb_ls:
        value = cmds.getAttr( control+"."+attr )
        defaultValue = cmds.attributeQuery(attr, node=control, ld=1) or []
        if defaultValue != []:
            defaultValue = defaultValue[0]
        if value != defaultValue:
            if attr != 'parentTo':
                if not attr.startswith( TRANSFORMS[0] ) and not attr.startswith( TRANSFORMS[1] ) and not attr.startswith( TRANSFORMS[1] ):
                    cmds.setAttr( control+"."+attr , defaultValue)

def set_front_back_vars( part):
    if part in back_ls or part == 'Back' or part == 'Leg':
        place='Leg'
        key1 = 'Hip'
        key2 = 'Ankle'
        list_tuple_na = list_tuple_na_back
        part_na_ls = back_ls
    elif part in front_ls or part == 'Front' or part == 'Arm2':
        place='Arm2'
        key1 = 'Scapula1'
        key2 = 'Wrist1'
        list_tuple_na = list_tuple_na_front
        part_na_ls = front_ls
    return place, key1, key2, list_tuple_na, part_na_ls

def crete_loc( target_original ):
    if True:
        loc = mel.eval( "spaceLocator -p 0 0 0;" )
        try:
            cmds.parentConstraint (  target_original, loc , mo = False )
            for attr in ['t','r']:#,'s']:
                for axe in ['x','y','z']:
                    mel.eval( 'source channelBoxCommand;CBdeleteConnection "%s.%s%s";' %(loc, attr,axe))
        except Exception as err:
            pass

def limb_ik_2_fk( signalAnim=False ):
    control_name = cmds.ls( sl=True )
    control_name=control_name[0]
    for tup in control_tuple:
        part = control_name.split(':IK')[-1].split('_')[0]
        place , key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part )
        if place == tup[0] and control_name.endswith( '_'+tup[1] ) :
            ####  part_na_ls   =  back_ls =  [   'Hip',    'Knee'  , 'Ankle' ,  'Toes1' ]
            for tup_na in part_na_ls:
                switch_control = switch_na_templa%( tup[0], tup[1] )
                switch_control = cmds.ls( '*:'+switch_control )[0]
                parent_source = tup_na + "_"+ tup[1] 
                cmds.setAttr( switch_control+'.FKIKBlend', 10)
                if key1 + '_' in parent_source:
                    dupli , dupli_joint_father = get_father_duplic( parent_source , switch_control+'.FKIKBlend' ,ikfkbend = 10 )
                    child_joints_ls = cmds.listRelatives( dupli , ad = True, type = 'joint', f = True)
                    for ch in child_joints_ls:
                        cmds.rename(ch, ch.split('|')[-1] + DUPLI_SUF)
                target_original = "FK" + parent_source
                target_original = cmds.ls( '*:'+target_original )[0]
                parent_target , dupli_offset_target = get_father_duplic( target_original , '')
                parent_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                setTransf( parent_target , target_original )
                com.break_connection( parent_target  , ['x','y','z'] , transf_ls = ['t','r',] )
                cmds.delete( dupli_offset_target )
            cmds.delete( dupli_joint_father )
            if signalAnim == False:
                cmds.setAttr( switch_control+'.FKIKBlend', 0)

#limb_ik_2_fk( )

def limb_fk_2_ik( signalAnim=False ):
    control_name = cmds.ls( sl=True )
    control_name=control_name[0]
    #control_tuple = [ ('Arm2','L') , ('Arm2','R') , ('Leg','L') , ('Leg','R')  ]
    for tup in control_tuple: ### representa cada extremidad, (solo una matchearia)
        part = control_name.split(':FK')[-1].split('_')[0]
        place, key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part)
        if place == tup[0] and control_name.endswith( '_'+tup[1] ) :
            for tup_na in list_tuple_na:
                switch_control = switch_na_templa%( tup[0], tup[1] )
                switch_control = cmds.ls( '*:'+switch_control )[0]
                cmds.setAttr( switch_control+'.FKIKBlend', 0)
                try:
                    parent_source = tup_na[0] %( tup[0], tup[1] )
                except Exception:
                    parent_source = tup_na[0] %(  tup[1] )
                if key1+'_' in tup_na[0]:
                    dupli , dupli_joint_father = get_father_duplic( parent_source , switch_control+'.FKIKBlend' ,ikfkbend = 0)
                    child_joints_ls = cmds.listRelatives( dupli , ad = True, type = 'joint', f = True)
                    for ch in child_joints_ls:
                        cmds.rename(ch, ch.split('|')[-1] + DUPLI_SUF)
                try:
                    target_original = tup_na[1]%( tup[0], tup[1] )
                except Exception:
                    target_original = tup_na[1]%( tup[1] )
                if ':' not in target_original:
                    print ( target_original )
                    target_original = cmds.ls( '*:'+target_original)[0]
                if  '5' in tup_na[0]:
                    target_original = target_original.replace('5','')
                parent_target , dupli_offset_target = get_father_duplic( target_original , '' )
                if 'Pole' in tup_na[0] or key1 in tup_na[0]:
                    father_offset = cmds.listRelatives( target_original , parent=True)[0]
                    parent_contrain = cmds.parentConstraint (  father_offset, dupli_offset_target , mo = False )
                if key1+'_' in tup_na[0] or key2 in tup_na[0]:
                    pointtt_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                    scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                    if key2 in tup_na[0]:
                        loc_matcherB = tup_na[0]%( tup[1] ) + '_matcherB'
                        loc_matcherA = tup_na[0]%( tup[1] ) + '_matcherA'
                        dupli_offset = cmds.listRelatives( parent_target , p = True, type = 'transform')
                        cmds.parent( loc_matcherB , dupli_offset )
                        com.break_connection( parent_target  , ['x','y','z'] , transf_ls = ['t','r',] )
                        cmds.parentConstraint (  loc_matcherB, parent_target , mo = True )
                        cmds.parentConstraint (  loc_matcherA , loc_matcherB , mo = False )
                if 'Pole' in tup_na[0]:
                    point_contrain = cmds.pointConstraint (  parent_source, parent_target , mo = False )
                if  '5' in tup_na[0] :
                    parent_source = parent_source.replace('5','')
                    parent_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                    scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                setTransf( parent_target , target_original )
                cmds.delete( dupli_offset_target )
            cmds.delete( dupli_joint_father )
            if signalAnim == False:
                cmds.setAttr( switch_control+'.FKIKBlend', 10)
#limb_fk_2_ik()
