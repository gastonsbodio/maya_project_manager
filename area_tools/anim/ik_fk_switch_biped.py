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


comtrol_ls_2ik = [ [ '*:FKIKArm_L','*:FKScapula_L','*:PoleArm_L','*:IKArm_L', '*:FKWrist_L'] ,
    ['*:FKIKArm_R','*:FKScapula_R','*:PoleArm_R','*:IKArm_R', '*:FKWrist_R'] ,
    ['*:FKIKLeg_L','*:PoleLeg_L','*:RollHeel_L', '*:IKToes_L', '*:RollToes_L', '*:RollToesEnd_L' , 
            '*:IKLeg_L' ,'*:FKAnkle_L'],
    ['*:FKIKLeg_R','*:PoleLeg_R','*:RollHeel_R', '*:IKToes_R', '*:RollToes_R', '*:RollToesEnd_R' , 
            '*:IKLeg_R' ,'*:FKAnkle_R'],

    [ '*:FKIKSpine_M', '*:IKSpine1_M', '*:IKSpine2_M', '*:IKSpine3_M' , '*:FKChest_M' ] ]

comtrol_ls_2fk = [ ['*:FKIKArm_L','*:FKScapula_L','*:FKShoulder_L','*:FKElbow_L', '*:FKWrist_L' ,'*:IKArm_L'] ,
    ['*:FKIKArm_R','*:FKScapula_R','*:FKShoulder_R','*:FKElbow_R', '*:FKWrist_R' ,'*:IKArm_R'] ,
    ['*:FKIKLeg_L','*:FKHip_L', '*:FKKnee_L', '*:FKAnkle_L', '*:FKToes_L', '*:IKLeg_L'],
    ['*:FKIKLeg_R','*:FKHip_R', '*:FKKnee_R', '*:FKAnkle_R', '*:FKToes_R', '*:IKLeg_R'] ,
    [ '*:FKIKSpine_M', '*:HipSwinger_M','*:FKSpine1_M', '*:FKSpine2_M', '*:FKSpine3_M', '*:FKChest_M' , '*:IKSpine3_M' ] ]


control_na_ls = [ 'Arm', 'Leg' , 'Spine' ]
list_tuple_na_front = [  
                      ( 'Wrist_%s' , 'IK%s_%s', 'FKMiddleFinger1_%s') , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) #,
                    ]

list_tuple_na_back= [ 
                     ( 'Ankle_%s' , 'IK%s_%s')  , ( 'Pole%s_%s_ref' , 'Pole%s_%s' ) 
                    ]

list_tuple_na_spine = [ 
                     ( 'Chest_%s' , 'IKSpine3_%s')  , ( [ 'Spine3_%s','Spine2_%s' ], 'IKSpine2_%s') ,( 'Root_%s' , 'IKSpine1_%s') 
                    ]
back_ls =  [   'Hip',    'Knee'  , 'Ankle' ] #,  'Toes' ]
front_ls = [ 'Scapula', 'Shoulder', 'Elbow' ,  'Wrist' ] #, 'Fingers1']
spine_ls = [ 'Root',  'Spine1', 'Spine2',  'Spine3',  'Spine4', 'Chest' ] #, 'Fingers1']

leg_na_templa = "%sLeg%s_%s"
switch_na_templa = "FKIK%s_%s"

def get_source_dupli_and_father( source  ):
    if ':' not in source:
        father_offset = cmds.listRelatives( '*:'+source , parent=True, f=True)[0]
    else:
        father_offset = cmds.listRelatives( source , parent=True, f=True)[0]
    
    dupli_offset = father_offset.split(':')[-1] + DUPLI_SUF
    dupli_offset = cmds.duplicate( father_offset , name= dupli_offset)[0]

    cmds.parent( dupli_offset, w=True)
    return  dupli_offset


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
    elif part in spine_ls:
        place='Spine'
        key1 = 'Root'
        key2 = 'notkey'
        list_tuple_na = list_tuple_na_spine
        part_na_ls = spine_ls
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
    ##control_na_ls = [ 'Arm',  'Leg' ]
    for limb_ls in control_na_ls:
        part = control_name.split(':IK')[-1].split('_')[0]
        side = control_name.split('_')[-1]
        place , key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part )
        if place == limb_ls :
            if control_name.endswith( '_R' ) or control_name.endswith( '_L' ) or control_name.endswith( '_M' )  :
                switch_control = nameSpace + ':' + switch_na_templa%( limb_ls, side )
                if place =='Spine':
                    if cmds.ls( 'IKSpine1_M_follow' ) == []:
                        try:
                            mel.eval( 'CBdeleteConnection "%s:IKSpine3_M.follow";' %nameSpace )
                        except Exception:
                            pass
                        cmds.setAttr( nameSpace + ':IKSpine3_M.follow', 0 )
                        loc = mel.eval( "spaceLocator -p 0 0 0;" )
                        cmds.parent ( loc , nameSpace + ':IKSpine1_M' )
                        com.resetTransf( loc)
                        loc = cmds.rename ( loc, 'IKSpine1_M_follow' )
                        cmds.addAttr ( loc , r=True, k=True , h=False, ln = 'followRoot'  ,at ="bool" ) 
                        cmds.setAttr( loc+'.followRoot'  ,  1   )
                        cmds.setAttr(  nameSpace + ':IKOffsetConstrainedSpine1_M_pointConstraint1.RootX_MW0' ,  1   )
                        cmds.setDrivenKeyframe( nameSpace + ':IKOffsetConstrainedSpine1_M_pointConstraint1.RootX_MW0',
                                            cd =  loc+'.followRoot' )
                        cmds.setAttr( loc+'.followRoot'  ,  0   )
                        cmds.setAttr(  nameSpace + ':IKOffsetConstrainedSpine1_M_pointConstraint1.RootX_MW0' ,  0   )
                        cmds.setDrivenKeyframe( nameSpace + ':IKOffsetConstrainedSpine1_M_pointConstraint1.RootX_MW0',
                                            cd =  loc+'.followRoot' )
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.tx";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.ty";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.tz";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.rx";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.ry";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.rz";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.sx";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.sy";')
                        mel.eval( 'setAttr -keyable false -channelBox false "IKSpine1_M_follow.sz";')
                        com.resetTransf( loc)

                    
                    
                for limb_part_na in part_na_ls:
                    cmds.setAttr( switch_control+'.FKIKBlend', 10 ) # 10 es ik
                    parent_source = nameSpace + ':' + limb_part_na + "_" + side 
                    parent_dupli = limb_part_na + "_" + side 
                    target_base_na =  "FK" + limb_part_na + "_" + side 
                    target_original = nameSpace + ':' + target_base_na
                    

                    if place =='Spine':
                        if 'Root' in parent_source:
                            dupli_joint_father = get_source_dupli_and_father( parent_source)
                            target_original = nameSpace + ':HipSwinger' + "_" + side 
                            target_base_na = 'HipSwinger' + "_" + side 
                        
                        parent_target =   target_base_na


                        dupli_offset_target = get_source_dupli_and_father( target_original )
                        #if 'Root' in parent_source:
                        #    parent_contrain = cmds.orientConstraint (  parent_dupli , parent_target , mo = False )
                        #else:
                        parent_contrain = cmds.parentConstraint (  parent_dupli , parent_target , mo = False )
                        try:
                            scale_constrain = cmds.scaleConstraint (  parent_dupli , parent_target , mo = False)
                        except Exception:
                            pass
                        com.setTransf( parent_target , target_original )
                        
                        
                        com.break_connection( parent_target  , ['x','y','z'] , transf_ls = ['t','r',] )
                        cmds.delete( dupli_offset_target )

                        
                    else:
                        com.setTransf( parent_source , target_original )
                    if signalAnim == True:
                        cmds.select ( target_original )
                        mel.eval('SetKey;')
                if place =='Spine':
                    cmds.delete( dupli_joint_father )
                    print('   sfsfs     ')
                if signalAnim == False:
                    cmds.setAttr( switch_control+'.FKIKBlend', 0)

#limb_ik_2_fk( )

def delete_contraint( contraint ):
    try:
        cmds.delete ( contraint )
    except Exception:
        pass


def detect_keyed( signalAnim , target_original, frame ):
    if signalAnim == True:
        cmds.select ( target_original )
        mel.eval('SetKey;')
    else:
        isKeyed = cmds.keyframe( target_original, attribute='rotateY', q=True, time=(frame,) )
        cmds.select ( target_original )
        mel.eval('SetKey;')
        if isKeyed == None:
            cmds.cutKey( time=( frame,) )
            
def limb_fk_2_ik( signalAnim=False , frame = 0):
    control_name = cmds.ls( sl=True )
    control_name=control_name[0]
    nameSpace = control_name.split(':')[0] 
    for tup in control_na_ls: 
        part = control_name.split(':FK')[-1].split('_')[0]
        side = control_name.split('_')[-1]
        place, key1, key2, list_tuple_na , part_na_ls = set_front_back_vars( part)
        if place == tup and control_name.endswith( '_'+side ) :
            switch_control = nameSpace + ':' + switch_na_templa%( tup, side )
            cmds.setAttr( switch_control+'.FKIKBlend', 0 )
            dupli_joint_father = get_source_dupli_and_father( key1+'_' + side )
            #list_tuple_na = [ ( 'Chest_M' , 'IKSpine3_M')  , ( [ 'Spine3_M','Spine2_M' ], 'IKSpine2_M') ,( 'Root_M' , 'IKSpine1_M') ]
            count_num = 1
            for tup_na in list_tuple_na:
                

                
                
                parent_contrain = ''
                switch_control = nameSpace + ':' + switch_na_templa%( tup, side )
                cmds.setAttr( switch_control+'.FKIKBlend', 0 )
                try:
                    parent_source = nameSpace + ':' + tup_na[0] %( tup, side )
                    parent_source_dupli = tup_na[0] %( tup, side )
                except Exception:
                    if 'list' not in str( type ( tup_na[0] )):
                        parent_source = nameSpace + ':' + tup_na[0] %(  side )
                        parent_source_dupli =  tup_na[0] %(  side )
                    else:
                        parent_source= []
                        parent_source_dupli=[]
                        for t in tup_na[0]:
                            parent_source.append( nameSpace + ':' + t %(  side ))
                            parent_source_dupli.append( t %(  side ) )
                try:
                    target_original = tup_na[1]%( tup, side )
                except Exception:
                    target_original = tup_na[1]%( side )
                if ':' not in target_original:
                    target_original = nameSpace + ':' + target_original
                    
                if  'Spine' in target_original:
                    ik_hybrid = nameSpace + ':IKhybridSpine%s_M'%str( count_num )
                    com.resetTransf( ik_hybrid)
                    count_num = count_num + 1
                    
                if key2 in tup_na[0]:
                    dupli_offset_target = get_source_dupli_and_father( target_original  )
                    parent_target = target_original.split(':')[-1]
                    parent_contrain = cmds.parentConstraint (  parent_source_dupli, parent_target , mo = False )
                    loc_matcherB =   tup_na[0]%( side ) + '_matcherB' # esta emparentado al ik control
                    loc_matcherA =  tup_na[0]%( side ) + '_matcherA'  # esta emparentado al wrist skeleton
                    cmds.parent( loc_matcherB , dupli_offset_target )
                    com.break_connection( parent_target  , ['x','y','z'] , transf_ls = ['t','r',] )
                    parent_contrain = cmds.parentConstraint (  loc_matcherB, parent_target , mo = True )
                    cmds.parentConstraint (  loc_matcherA , loc_matcherB , mo = False )
                    com.setTransf( parent_target , target_original )
                elif 'Pole' in tup_na[0]:
                    point_contrain = cmds.pointConstraint (  parent_source, target_original , mo = False )
                elif 'list' not in str( type ( parent_source )) or 'Spine' in target_original:
                    parent_contrain = cmds.parentConstraint (  parent_source, target_original , mo = False )

                detect_keyed( signalAnim , target_original, frame )
                if 'Pole' in tup_na[0]:
                    delete_contraint( point_contrain )
                elif  'Spine' in target_original:
                    delete_contraint( parent_contrain )
                try:
                    cmds.delete( dupli_offset_target )
                except Exception:
                    pass
            cmds.delete( dupli_joint_father )
            if signalAnim == False:
                cmds.setAttr( switch_control+'.FKIKBlend', 10)
#limb_fk_2_ik()
