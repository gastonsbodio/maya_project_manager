""" Run the lines below for launch switch processing ( take out the hashtag chars )"""
"""avoid_auto_read"""

"""   IK  to FK   """
#from importlib import reload
#import area_tools.anim.ik_fk_switch_biped as ikfk
#reload(ikfk)
#ikfk.limb_ik_2_fk()

"""   FK  to  IK   """
#from importlib import reload
#import area_tools.anim.ik_fk_switch_biped as ikfk
#reload(ikfk)
#ikfk.limb_fk_2_ik()

import importing_modules as im
com = im.importing_modules( 'maya_conn.maya_custom_cmd' )

import maya.cmds as cmds
import maya.mel as mel

DUPLI_SUF = '_dupli'
TRANSFORMS = ["translate","rotate", "scale"]

control_na_ls = [ 'Arm', 'Leg' ]
                    #### , ( 'Fingers1_%s' , 'IK%s_%s', 'IKFingers1_%s' )
list_tuple_na_front = [  ###( 'Scapula_%s' , 'FKScapula_%s' ) ,
                      ( 'Wrist_%s' , 'IK%s_%s', 'FKMiddleFinger1_%s') , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) #,
                    ##    ( 'Scapula5_%s' , 'FKScapula_%s' ) , 
                    #( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,
                    ##    ( 'Scapula5_%s' , 'FKScapula_%s' ) ,
                    ###( 'Scapula5_%s' , 'FKScapula_%s' ) , 
                    #( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,( 'Scapula5_%s' , 'FKScapula_%s' ) 
                    ]

                    ####   , ( 'Toes1_%s' , 'IKLeg%s_%s' , 'IKToes1_%s')
list_tuple_na_back= [ ####( 'Hip_%s' , 'FKHip_%s' ),
                     ( 'Ankle_%s' , 'IK%s_%s')  , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) , 
                    #( 'Hip5_%s' , 'FKHip_%s' ) , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,( 'Hip5_%s' , 'FKHip_%s' ) ,
                    #( 'Hip5_%s' , 'FKHip_%s' ) , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) ,( 'Hip5_%s' , 'FKHip_%s' )
                    ]
back_ls =  [   'Hip',    'Knee'  , 'Ankle' ] #,  'Toes1' ]
front_ls = ['Scapula', 'Shoulder', 'Elbow' ,  'Wrist' ] #, 'Fingers1']


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
        dupli_offset = cmds.duplicate( father_offset , name= father_offset.split(':')[-1] + DUPLI_SUF )[0]
    except Exception as err:
        print(err)
        pass
    cmds.parent( dupli_offset , w=True)
    target_dupli = cmds.listRelatives( dupli_offset , c = True , f = True )
    #child_joints_ls = cmds.listRelatives( dupli , ad = True, type = 'joint', f = True)
    for target in target_dupli:
        #if ':' in obj:
        endd = obj.split(':')[-1]
        #else:
        #    endd = obj
        if target.endswith( endd ):
            dupli = cmds.rename( target , obj+DUPLI_SUF)
            return dupli , dupli_offset

def rename_children_chain( dupli ):
    child_joints_ls = cmds.listRelatives( dupli , ad = True, type = 'joint', f = True)
    for ch in child_joints_ls:
        cmds.rename(ch, ch.split('|')[-1] + DUPLI_SUF)


def set_front_back_vars( part):
    if part in back_ls or part == 'Back' or part == 'Leg':
        place='Leg'
        key1 = 'Hip'
        key2 = 'Ankle'
        list_tuple_na = list_tuple_na_back
        part_na_ls = back_ls
    elif part in front_ls or part == 'Front' or part == 'Arm':
        place='Arm'
        key1 = 'Scapula'
        key2 = 'Wrist'
        list_tuple_na = list_tuple_na_front
        part_na_ls = front_ls
    return place, key1, key2, list_tuple_na, part_na_ls

def crete_loc( target_original ):
    loc = mel.eval( "spaceLocator -p 0 0 0;" )
    try:
        cmds.parentConstraint (  target_original, loc , mo = False )
        for attr in ['t','r']:#,'s']:
            for axe in ['x','y','z']:
                mel.eval( 'source channelBoxCommand;CBdeleteConnection "%s.%s%s";' %(loc, attr,axe))
    except Exception as err:
        pass

def limb_ik_2_fk( signalAnim=False , frame = 0):
    control_name = cmds.ls( sl=True )
    control_name = control_name[0]
    nameSpace = control_name.split(':')[0] 
    ##control_na_ls = [ ('Arm','L') , ('Arm','R') , ('Leg','L') , ('Leg','R')  ]
    for limb_ls in control_na_ls:
        part = control_name.split(':IK')[-1].split('_')[0]
        side = control_name.split('_')[-1]
        place , key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part )
        if place == limb_ls :
            if control_name.endswith( '_R' ) or control_name.endswith( '_L' )  :
                for limb_part_na in part_na_ls:  #part_na_ls is front_ls = ['Scapula', 'Shoulder', 'Elbow' ,  'Wrist' ] 
                    switch_control = nameSpace + ':' + switch_na_templa%( limb_ls, side )
                    #switch_control = cmds.ls( '*:'+switch_control )[0]
                    parent_source = nameSpace + ':' + limb_part_na + "_" + side 
                    cmds.setAttr( switch_control+'.FKIKBlend', 10 ) # 10 es ik
                    #if key1 + '_' in parent_source:
                        ## dupli , dupli_joint_father = get_father_duplic( parent_source , switch_control+'.FKIKBlend' ,ikfkbend = 10 )
                        #rename_children_chain( dupli )
                    target_original = nameSpace + ':' + "FK" + parent_source
                    #target_original = cmds.ls( '*:'+target_original )[0]
                    #parent_target , dupli_offset_target = get_father_duplic( target_original , '')
                    #cmds.parentConstraint (   parent_source , parent_target , mo = False )
                    #try:
                    #    cmds.scaleConstraint (   parent_source , parent_target , mo = False)
                    #except Exception:
                    #    pass
                    com.setTransf( parent_source , target_original )
                    #com.break_connection( parent_target  , ['x','y','z'] , transf_ls = ['t','r',] )
                    #cmds.delete( dupli_offset_target )
                #cmds.delete( dupli_joint_father )
                if signalAnim == False:
                    cmds.setAttr( switch_control+'.FKIKBlend', 0)

#limb_ik_2_fk( )

def delete_contraint( contraint ):
    try:
        cmds.delete ( contraint )
    except Exception:
        pass
        
        
def limb_fk_2_ik( signalAnim=False , frame = 0):
    control_name = cmds.ls( sl=True )
    control_name=control_name[0]
    nameSpace = control_name.split(':')[0] 
    for tup in control_na_ls: 
        part = control_name.split(':FK')[-1].split('_')[0]
        side = control_name.split('_')[-1]
        place, key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part)
        if place == tup and control_name.endswith( '_'+side ) :
            for tup_na in list_tuple_na:
                
                
                #place='Arm'
                #key1 = 'Scapula'
                #key2 = 'Wrist'
                
                
                parent_contrain = ''
                switch_control = nameSpace + ':' + switch_na_templa%( tup, side )
                #switch_control = cmds.ls( '*:'+switch_control )[0]
                cmds.setAttr( switch_control+'.FKIKBlend', 0)
                try:
                    parent_source = nameSpace + ':' + tup_na[0] %( tup, side )
                except Exception:
                    parent_source = nameSpace + ':' + tup_na[0] %(  side )
                #if key1+'_' in tup_na[0]:
                #    dupli , dupli_joint_father = get_father_duplic( parent_source , switch_control+'.FKIKBlend' ,ikfkbend = 0)
                #    rename_children_chain( dupli )
                try:
                    target_original = tup_na[1]%( tup, side )
                except Exception:
                    target_original = tup_na[1]%( side )
                if ':' not in target_original:
                    target_original = nameSpace + ':' + target_original
                    
                    
                    
                ########     if  '5' in tup_na[0]:
                ########         target_original = target_original.replace('5','')
                
                
                
                
                #parent_target , dupli_offset_target = get_father_duplic( target_original , '' )
                #if 'Pole' in tup_na[0] or key1 in tup_na[0]:
                    #father_offset = cmds.listRelatives( target_original , parent=True)[0]
                    #parent_contrain = cmds.parentConstraint (  father_offset, dupli_offset_target , mo = False )



                #if key1+'_' in tup_na[0] or key2 in tup_na[0]:
                #    point_contrain = cmds.parentConstraint ( parent_source, target_original , mo = False )
                #    try:
                #        scale_constrain = cmds.scaleConstraint (  parent_source , target_original , mo = False)
                #    except Exception:
                #        pass
                if key2 in tup_na[0]:
                    loc_matcherB = nameSpace + ':' + tup_na[0]%( side ) + '_matcherB'
                    loc_matcherA = nameSpace + ':' + tup_na[0]%( side ) + '_matcherA'
                    loc_matcherB_dupli = cmds.duplicate ( loc_matcherB , n = loc_matcherB + DUPLI_SUF)
                    dupli_offset = cmds.listRelatives( target_original , p = True, type = 'transform')
                    ## cmds.parent( loc_matcherB , dupli_offset )
                    cmds.parent( loc_matcherB_dupli , dupli_offset )
                    #com.break_connection( target_original  , ['x','y','z'] , transf_ls = ['t','r',] )
                    parent_contrain = cmds.parentConstraint (  loc_matcherB_dupli, target_original , mo = True )
                    cmds.parentConstraint (  loc_matcherA , loc_matcherB_dupli , mo = False )
                if 'Pole' in tup_na[0]:
                    point_contrain = cmds.pointConstraint (  parent_source, target_original , mo = False )
                    
                #if  '5' in tup_na[0] :
                #    parent_source = parent_source.replace('5','')
                #    parent_contrain = cmds.parentConstraint (  parent_source, target_original , mo = False )
                #    try:
                #        scale_constrain = cmds.scaleConstraint ( parent_source, target_original , mo = False)
                #    except Exception:
                #        pass
                
                if signalAnim == True:
                    cmds.select ( target_original )
                    mel.eval('SetKey;')
                else:
                    isKeyed = cmds.keyframe( target_original, attribute='rotateY', q=True, time=(frame,) )
                    cmds.select ( target_original )
                    mel.eval('SetKey;')
                    if isKeyed == None:
                        cmds.cutKey( time=( frame,) )

                delete_contraint( parent_contrain )
                delete_contraint( scale_constrain )
                delete_contraint( point_contrain )
                #com.setTransf( parent_target , target_original )
                #cmds.delete( dupli_offset_target )
            #cmds.delete( dupli_joint_father )
            if signalAnim == False:
                cmds.setAttr( switch_control+'.FKIKBlend', 10)
#limb_fk_2_ik()
