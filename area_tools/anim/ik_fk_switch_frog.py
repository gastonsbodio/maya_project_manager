""" Run the lines below for launch switch processing ( take out the hashtag chars )"""
"""avoid_auto_read"""
"""   IK  to FK   """
#from importlib import reload
#import area_tools.anim.ik_fk_switch_frog as ikfk
#reload(ikfk)
#ikfk.limb_ik_2_fk()

"""   FK  to  IK   """
#from importlib import reload
#import area_tools.anim.ik_fk_switch_frog as ikfk
#reload(ikfk)
#ikfk.limb_fk_2_ik()

import importing_modules as im
com = im.importing_modules( 'maya_conn.maya_custom_cmd' )

import maya.cmds as cmds
import maya.mel as mel
DUPLI_SUF = '_dupli'
TRANSFORMS = ["translate","rotate", "scale"]

control_tuple = [ ('Front','L') , ('Front','R') , ('Back','L') , ('Back','R')  ]
list_tuple_na_front = [( 'Scapula_%s' , 'FKScapula_%s' )  ,
                       ( 'Fingers1_%s' , 'IKLeg%s_%s', 'IKFingers1_%s','Wrist_%s' ) ,
                       ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) , 
                       ( 'Scapula5_%s' , 'FKScapula_%s' ) , ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) ,
                       ( 'Scapula5_%s' , 'FKScapula_%s' ) ,
                       ( 'Scapula5_%s' , 'FKScapula_%s' ) , ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) ,
                       ( 'Scapula5_%s' ,  'FKScapula_%s' ), 
                       ( 'RollFingers1_%s' , 'RollFingers1_%s' )  ,
                       ( 'Fingers1_%s' , 'IKLeg%s_%s', 'IKFingers1_%s','Wrist_%s' )]

list_tuple_na_back =  [( 'Hip_%s' , 'FKHip_%s' )  , 
                      ( 'Toes1_%s' , 'IKLeg%s_%s' , 'IKToes1_%s', 'Ankle_%s') , 
                      ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) , 
                      ( 'Hip5_%s' , 'FKHip_%s' ) , ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) ,
                      ( 'Hip5_%s' , 'FKHip_%s' ) ,
                      ( 'Hip5_%s' , 'FKHip_%s' ) , ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) ,
                      ( 'Hip5_%s' , 'FKHip_%s' ) ,
                      ( 'RollToes1_%s' , 'RollToes1_%s' ) , 
                      ( 'Toes1_%s' , 'IKLeg%s_%s' , 'IKToes1_%s', 'Ankle_%s')]

back_ls = ['Hip', 'Knee', 'Ankle', 'Toes1' ]
front_ls = ['Scapula', 'Shoulder', 'Elbow', 'Wrist', 'Fingers1']


leg_na_templa = "%sLeg%s_%s"
switch_na_templa = "FKIKLeg%s_%s"


def get_father_duplic( obj ):
    if ':' not in obj:
        father_offset = cmds.listRelatives( '*:'+obj , parent=True, f=True)[0]
    else:
        father_offset = cmds.listRelatives( obj , parent=True, f=True)[0]
    
    try:
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
    if part in back_ls or part == 'Back':
        place='Back'
        key1 = 'Hip'
        key2 = 'Toes'
        list_tuple_na = list_tuple_na_back
        part_na_ls = back_ls
    elif part in front_ls or part == 'Front':
        place='Front'
        key1 = 'Scapula'
        key2 = 'Fingers'
        list_tuple_na = list_tuple_na_front
        part_na_ls = front_ls
    return place, key1, key2, list_tuple_na, part_na_ls

def limb_ik_2_fk():
    control_name = cmds.ls( sl=True )
    control_name=control_name[0]
    for tup in control_tuple: 
        part = control_name.split(':IKLeg')[-1].split('_')[0]
        place , key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part )
        if place == tup[0] and control_name.endswith( '_'+tup[1] ) :
            for tup_na in part_na_ls:
                switch_control = switch_na_templa%( tup[0], tup[1] )
                switch_control = cmds.ls( '*:'+switch_control )[0]
                parent_source = tup_na + "_"+ tup[1] 
                if key1 + '_' in parent_source:
                    dupli , dupli_joint_father = get_father_duplic( parent_source )
                    cmds.setAttr( switch_control+'.FKIKBlend', 0)
                    child_joints_ls = cmds.listRelatives( dupli , ad = True, type = 'joint', f = True)
                    for ch in child_joints_ls:
                        cmds.rename(ch, ch.split('|')[-1] + DUPLI_SUF)
                target_original = "FK" + parent_source
                target_original = cmds.ls( '*:'+target_original )[0]
                parent_target , dupli_offset_target = get_father_duplic(target_original)
                parent_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                setTransf( parent_target , target_original )
                cmds.delete( dupli_offset_target )
            cmds.delete( dupli_joint_father )
            
#limb_ik_2_fk( )

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


def limb_fk_2_ik():
    control_name = cmds.ls( sl=True )
    control_name=control_name[0]
    for tup in control_tuple: 
        part = control_name.split(':FK')[-1].split('_')[0]
        place, key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part)
        if place == tup[0] and control_name.endswith( '_'+tup[1] ) :
            for tup_na in list_tuple_na:
                ### tup_na = ( 'Fingers1_%s' , 'IKLeg%s_%s', 'IKFingers1_%s','Wrist_%s' ) ,
                try:
                    target_original = tup_na[1]%( tup[0], tup[1] )
                except Exception:
                    target_original = tup_na[1]%( tup[1] )
                if ':' not in target_original:
                    target_original = cmds.ls( '*:'+target_original)[0]
                    namesapce = target_original.split(':')[0]
                
                polevector_orig = namesapce+':PoleLeg' + place + '_' + tup[ 1 ]
                cmds.setAttr ( polevector_orig + ".follow", 0 )
                #Ranged_Rig_new_10:PoleLegFront_R
                
                switch_control = switch_na_templa%( tup[0], tup[1] )
                switch_control = cmds.ls( '*:'+switch_control )[0]
                try:
                    parent_source = tup_na[0] %( tup[0], tup[1] )
                except Exception:
                    parent_source = tup_na[0] %(  tup[1] )
                if key1+'_' in tup_na[0]:
                    dupli , dupli_joint_father = get_father_duplic( parent_source )
                    cmds.setAttr( switch_control+'.FKIKBlend', 10)
                    child_joints_ls = cmds.listRelatives( dupli , ad = True, type = 'joint', f = True)
                    for ch in child_joints_ls:
                        cmds.rename(ch, ch.split('|')[-1] + DUPLI_SUF)

                if  '5' in tup_na[0]:
                    target_original = target_original.replace('5','')
                parent_target , dupli_offset_target = get_father_duplic( target_original )
                if 'PoleLeg' in tup_na[0] or key1 in tup_na[0]:
                    father_offset = cmds.listRelatives( target_original , parent=True)[0]
                    parent_contrain = cmds.parentConstraint (  father_offset, dupli_offset_target , mo = False )
                if key1+'_' in tup_na[0] or key2 in tup_na[0]:
                    try:
                        pointtt_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                        scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                    except Exception:
                        pass
                    if key2 in tup_na[0] and 'Roll' not in tup_na[0]:
                        loc_matcherB = tup_na[0]%( tup[1] ) + '_matcherB'
                        loc_matcherA = tup_na[0]%( tup[1] ) + '_matcherA'
                        print(' loc_matcherA ')
                        print ( loc_matcherA )
                        dupli_offset = cmds.listRelatives( parent_target , p = True, type = 'transform')[0]
                        print ( dupli_offset )
                        loc_matcherB_ls = cmds.ls(  loc_matcherB , l = True)
                        for matcherB in  loc_matcherB_ls:
                            if dupli_offset in matcherB:
                                print ( matcherB )
                                cmds.parent( matcherB , dupli_offset )
                                com.break_connection( parent_target  , ['x','y','z'] , transf_ls = ['t','r',] )
                                matcherB = cmds.ls( '*'+dupli_offset+'|'+loc_matcherB , l = True )[0]
                                cmds.parentConstraint (  matcherB, parent_target , mo = True )
                                cmds.parentConstraint (  loc_matcherA , matcherB , mo = False )

                if 'PoleLeg' in tup_na[0]:
                    point_contrain = cmds.pointConstraint (  parent_source, parent_target , mo = False )

                if 'Roll' in tup_na[0]:
                    #try:
                        #parent_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                        #scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                    parent_contrain = cmds.parentConstraint (  parent_source+'_ref' , parent_target , mo = False )
                    scale_constrain = cmds.scaleConstraint (  parent_source+'_ref' , parent_target , mo = False )
                    #except Exception:
                    #    pass
                if  '5' in tup_na[0] :
                    parent_source = parent_source.replace('5','')
                    parent_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                    scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                setTransf( parent_target , target_original )
                cmds.delete( dupli_offset_target )
            cmds.delete( dupli_joint_father )
            #root_duplis = cmds.ls('|*_dupli*', type='transform')
            #cmds.delete( root_duplis )
#limb_fk_2_ik()
