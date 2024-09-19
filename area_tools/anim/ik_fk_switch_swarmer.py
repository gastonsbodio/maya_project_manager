""" Run the lines below for launch switch processing ( take out the hashtag chars )"""
"""avoid_auto_read"""

"""   IK  to FK   """
#from importlib import reload
#import area_tools.anim.ik_fk_switch_swarmer as ikfk
#importlib.reload(ikfk)
#ikfk.limb_ik_2_fk()



"""   FK  to  IK   """
#from importlib import reload
#import ik_fk_switch_swarmer as ikfk
#reload(ikfk)
#ikfk.limb_fk_2_ik()



import maya.cmds as cmds
import maya.mel as mel
DUPLI_SUF = '_dupli'
control_tuple = [ ('Front','L') , ('Front','R') , ('Back','L') , ('Back','R') ,('Middle','L') , ('Middle','R')  ]
list_tuple_na = [( '%sLeg1_%s' , 'FK%sLeg1_%s' )  , ( '%sLeg4_%s' , 'IKLeg%s_%s' ) , ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) , 
                    ( '%sLeg41_%s' , 'FK%sLeg41_%s' ) ,
                    ( '%sLeg5_%s' , 'FK%sLeg1_%s' ) , ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) ,( '%sLeg5_%s' , 'FK%sLeg1_%s' ) ,
                    ( '%sLeg5_%s' , 'FK%sLeg1_%s' ) , ( 'PoleLeg%s_%s_ref' , 'PoleLeg%s_%s' ) ,( '%sLeg5_%s' , 'FK%sLeg1_%s' ),
                    ( '%sLeg41_%s' , 'FK%sLeg41_%s' ) ]
leg_na_templa = "%sLeg%s_%s"
switch_na_templa = "FKIKLeg%s_%s"

def get_father_duplic( obj ):
    if ':' not in obj:
        father_offset = cmds.listRelatives( '*:'+obj , parent=True)[0]
    else:
        father_offset = cmds.listRelatives( obj , parent=True)[0]
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

def limb_ik_2_fk():
    control_name = cmds.ls( sl=True )[0]
    for tup in control_tuple:
        if tup[0] in control_name and  '_'+tup[1] in control_name :
            joint_ls = [ '1', '2', '3', '31', '4' ]
            for num in joint_ls:
                switch_control = switch_na_templa% ( tup[0], tup[1] )
                switch_control = cmds.ls( '*:'+switch_control )[0]
                parent_source = leg_na_templa%( tup[0],  num, tup[1] )
                if num == '1':
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
        if tup[0] in control_name and  '_'+tup[1] in control_name :
            for tup_na in list_tuple_na:
                switch_control = switch_na_templa%( tup[0], tup[1] )
                switch_control = cmds.ls( '*:'+switch_control )[0]
                parent_source = tup_na[0] %( tup[0], tup[1] )
                if 'Leg1_' in tup_na[0] and 'Leg1_' in tup_na[1]:
                    dupli , dupli_joint_father = get_father_duplic(parent_source)
                    cmds.setAttr( switch_control+'.FKIKBlend', 10)
                    child_joints_ls = cmds.listRelatives( dupli , ad = True, type = 'joint', f = True)
                    for ch in child_joints_ls:
                        cmds.rename(ch, ch.split('|')[-1] + DUPLI_SUF)
                        #if '3' in ch.split('|')[-1] + DUPLI_SUF:
                        #    crete_loc( ch.split('|')[-1] + DUPLI_SUF )
                target_original = tup_na[1]%( tup[0], tup[1] )
                if ':' not in target_original:
                    target_original = cmds.ls( '*:'+target_original)[0]
                if  '5' in tup_na[0]:
                    target_original = target_original.replace('5','1')
                elif 'PoleLeg' in tup_na[0]:
                    target_original = target_original.replace('6','3')
                parent_target , dupli_offset_target = get_father_duplic( target_original )
                if '3' in tup_na[0] or '1_' in tup_na[0]:
                    father_offset = cmds.listRelatives( target_original , parent=True)[0]
                    parent_contrain = cmds.parentConstraint (  father_offset, dupli_offset_target , mo = False )
                if '1_' in tup_na[0] or '4_' in tup_na[0] or '41_' in tup_na[0]:
                    print( tup_na[0] )
                    print(  parent_target)
                    print(parent_source+ DUPLI_SUF)
                    orient_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                    scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                if '3' in tup_na[0]:
                    point_contrain = cmds.pointConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                if  '5' in tup_na[0] :
                    parent_source = parent_source.replace('5','1')
                    parent_contrain = cmds.parentConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False )
                    scale_constrain = cmds.scaleConstraint (  parent_source+ DUPLI_SUF, parent_target , mo = False)
                if 'PoleLeg' in tup_na[0]:
                    parent_source = parent_source.replace('6','3')
                    point_contrain = cmds.pointConstraint (  parent_source, parent_target , mo = False )
                setTransf( parent_target , target_original )
                cmds.delete( dupli_offset_target )
            cmds.delete( dupli_joint_father )
#limb_fk_2_ik()
