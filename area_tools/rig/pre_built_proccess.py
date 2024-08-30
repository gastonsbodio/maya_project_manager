import maya.cmds as cmds
import maya.mel as mel


#import maya.mel as mel
#import pre_built_proccess as pbp
#from importlib import reload
#reload( pbp )
#import char_setup_post_proccess as csp
#reload( csp )


##   1     import unreal skeleton template
#pbp.run_all_preskeleton_code()

##   2  create and fit adv skeleton    ___
#pbp.create_ad_sk_code()

##   3    do some fixes on adv skeleton
#pbp.run_all_fixes()

##   4     built  adv skeleton
#mel.eval("asReBuildAdvancedSkeleton;")

##    5    add some features to the built set up
#csp.launch_full_post_procces()


###  3.1    after creating manually unreal custom joint, create advance skeleton
#pbp.create_custom_advanceSk_joints()






PATH_FOOT_HELP = 'C:/dev/rig_micelane/generic_skeleton.ma'


def delete_namespaces( is_checked ):
    if is_checked:
        curNS = cmds.namespaceInfo( lon=True )
        defaults = ["UI", "shared"]
        diff = [item for item in curNS if item not in defaults]
        for ns in diff:
            if cmds.namespace( exists=str(ns)):
                try:
                    cmds.namespace( rm=str(ns) , f = True)
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


def unlock_transf( name , transf = ['t','r','s'] ):
    for attr in [ 't' , 'r' , 's' ]:
        if attr in transf:
            for axe in [ 'x', 'y', 'z' ]:
                try:
                    cmds.setAttr(name+'.'+attr+axe, lock=0)
                except Exception:
                    pass



##### pre_keleton procces ##################################################################
def mel_pre_code():
    mel.eval( """asNameMatcherUI;
                 asNameMatcherAutoRigFit;
                 int $worldmatch=`checkBox -q -v asAutoOrientWorldMatchCheckBox`;
                 if ($worldmatch!= 1){
                     checkBox -e -v 1 asAutoOrientWorldMatchCheckBox;}
                 asWorldMatchChanged;""" )
                 #deleteUI NameMatcher;

def create_foot_fitting_helper():
    cmds.file( PATH_FOOT_HELP , i = True )
    delete_namespaces( True )

def run_all_preskeleton_code():
    print ('que ondaaa  ???')
    create_foot_fitting_helper()
    print ('done')
    #mel_pre_code()

def create_ad_sk_code():
    mel_pre_code()

##### pre builting proccess #################################################################

def fix():
    cmds.lockNode('initialShadingGroup', l=0, lockUnpublished=0)
    print('Broken Lambert shader fixed')
    cmds.lockNode('defaultTextureList1', l=False, lockUnpublished=False)

def break_connection( control  , axe_ls ,transf_ls = ['t','r','s']):
    for axe in axe_ls:
        for transf in transf_ls:
            try:
                mel.eval( 'source channelBoxCommand;CBdeleteConnection "%s.%s%s";'%( control, transf, axe ) )
            except Exception:
                pass

def mirror_unre_skele():
    for joint in ['clavicle_r', 'thigh_r', 'eye_r']:
        cmds.select( joint )
        mel.eval( 'mirrorJoint -mirrorYZ -mirrorBehavior -searchReplace "_r" "_l";' )
    contrain = cmds.parentConstraint ( 'hand_l' , 'ik_hand_l' , mo = False )[0]
    contrain = cmds.parentConstraint ( 'foot_l' , 'ik_foot_l' , mo = False )[0]
    

def spine_pos_fix ():
    dicc = { 'Spine1': 'spine_01',  'Spine2': 'spine_02', 
            'Spine3': 'spine_03', 'Spine4': 'spine_04',  'Chest': 'spine_05'}
    for key in dicc:
        #select -r Root ;
        #select -r Spine1 ;
        #select -r Spine1 ;
        #select -cl  ;
        #select -r Jaw ;
        #select -r Head ;
        #select -r Chest ;
        #select -r Neck ;
        #select -r Spine1 ;
        unlock_transf( key , transf = ['t','r','s'] )
        contrain = cmds.parentConstraint ( dicc[key ]  , key , sr=['x','y','z'] , mo = False )[0]
        break_connection( key  , ['x','y','z'] ,transf_ls = ['r'] )
        cmds.delete( contrain )
        
def create_metacarp():
    wrist = 'Wrist'
    metacarpalsAll = cmds.duplicate( wrist , n = 'metacarpalsAll' )[0]
    
    cmds.setAttr ( "metacarpalsAll.drawLabel" , 0 )
    
    children_ls = cmds.listRelatives( metacarpalsAll , ad=True, f = True)
    cmds.delete( children_ls )
    cmds.parent( metacarpalsAll, wrist)
    cmds.setAttr( metacarpalsAll + ".translateX", -1.133 )
    
    finger_adv_sk_ls = [ 'PinkyFinger1', 'RingFinger1', 'MiddleFinger1', 'IndexFinger1' ]
    metacarp_unr_ls = [ 'pinky_metacarpal_r', 'ring_metacarpal_r', 'middle_metacarpal_r', 'index_metacarpal_r' ]
    for idx, fing in enumerate( finger_adv_sk_ls ):
        metacarp_adv_sk = cmds.duplicate( fing , n = fing.replace('Finger1','Metacarpal'))[0]
        meta_a_s_children = cmds.listRelatives( metacarp_adv_sk, ad = True , f=True)
        cmds.delete( meta_a_s_children )
        contrain = cmds.pointConstraint ( metacarp_unr_ls[ idx ]  , metacarp_adv_sk , mo = False )[0]
        if 'Ring' in metacarp_adv_sk or 'Pinky' in metacarp_adv_sk:
            cmds.parent( metacarp_adv_sk , w = True )
            if 'Pinky' in metacarp_adv_sk:
                pinky_metac = metacarp_adv_sk
            else:
                ring_metac = metacarp_adv_sk

        cmds.delete( contrain )
        cmds.parent( fing , metacarp_adv_sk )
    contrain = cmds.parentConstraint ( [ pinky_metac, ring_metac ]  , "Cup" , sr=['x','y','z'] , mo = False )[0]
    cmds.delete ( contrain )    
    value = cmds.getAttr(  "Cup.translateX" )
    cmds.setAttr(  "Cup.translateX", value * 0.75 )
    for meta in [ pinky_metac, ring_metac ]:
        cmds.parent( meta , 'Cup' )
    for finf_root in ['Cup', 'MiddleMetacarpal', 'IndexMetacarpal', 'ThumbFinger1' ]:
        cmds.parent( finf_root , metacarpalsAll )
    contrain0 = cmds.parentConstraint ( 'pinky_metacarpal_r', pinky_metac , mo = True )[0]
    contrain1 = cmds.parentConstraint ( 'ring_metacarpal_r' , ring_metac , mo = True )[0]
    dupli_pink = cmds.duplicate ( pinky_metac )[0]
    dupli_ring = cmds.duplicate ( ring_metac )[0]
    contrain2 = cmds.orientConstraint ( [  dupli_pink, dupli_ring   ],  "Cup" , mo = False )[0]
    break_connection( "Cup"  , ['x','y','z'] ,transf_ls = ['t','r'])
    cmds.delete( contrain2 )
    cmds.delete( dupli_pink , dupli_ring )
    break_connection( pinky_metac  , ['x','y','z'] ,transf_ls = ['t','r'])
    break_connection( ring_metac  , ['x','y','z'] ,transf_ls = ['t','r'])
    cmds.delete (contrain0 , contrain1 )

  
def bendy_setup():
    cmds.setAttr( "Elbow.bendyJoints", 1 )
    cmds.setAttr( "Elbow.twistJoints", 2 )
    cmds.setAttr( "Shoulder.bendyJoints", 1 )
    cmds.setAttr( "Shoulder.twistJoints", 2 )
    


def pose_extra_joints():
    dicc = { 'Jaw' : 'jaw', 'Eye': 'eye_r' ,
            'Heel':'Heel_ref' , 'FootSideOuter':'FootSideOuter_ref',
            'FootSideInner' : 'FootSideInner_ref', 'ToesEnd' : 'ToesEnd_ref'}
    for key in dicc:
        try:
            unlock_transf( key , transf = ['t','r','s'] )
            contrain = cmds.pointConstraint (  dicc[key] , key , mo = False )[0]
            cmds.delete( contrain )
        except Exception:
            pass
        

def resample_joints( joint_start, joint_end , amount ):
    mel.eval ( 'asFitResample;' )
    mel.eval ( 'select "%s";' %joint_start )
    mel.eval ( 'asFitResamplePick asFitResampleStartJointtextFieldGrp;' )
    mel.eval ( 'select "%s";' %joint_end )
    mel.eval ( 'asFitResamplePick asFitResampleEndJointtextFieldGrp;' )
    mel.eval ( 'intFieldGrp -v1 %i -e asFitResampleNumJoints;' % amount)
    mel.eval ( 'asFitResampleJoints;' )
    mel.eval ( 'deleteUI asFitResample;' )
    

def spine_resample():
    resample_joints( 'Spine1', 'Chest' , 5 )
    cmds.rename( 'Spine11', 'Spine2')
    cmds.rename( 'Spine12', 'Spine3')
    cmds.rename( 'Spine13', 'Spine4')

def mel_action():
    print('')
    #asNameMatcherUI;
    #asNameMatcherAutoRigFit;
    #int $worldmatch=`checkBox -q -v asAutoOrientWorldMatchCheckBox`;
    #if ($worldmatch!= 1){
    #    checkBox -e -v 1 asAutoOrientWorldMatchCheckBox;
    #    asWorldMatchChanged;  
    #}
    #deleteUI asNameMatcherUI;



def run_all_fixes():
    fix()
    pose_extra_joints()
    bendy_setup()
    create_metacarp()
    resample_joints( 'Neck', 'Head' , 3 )
    spine_resample()
    spine_pos_fix ()



####################################
###################################
##################################

def create_custom_unreal_joints():
    selection = cmds.ls( sl = True )
    for sel in selection:
        dupl = cmds.duplicate( sel )[0]
        list_ch = cmds.listRelatives( dupl, ad = True, type = 'joint' , f = True) or []
        for idx, obj in enumerate(list_ch + [dupl]):
            short_na = obj.split('|')[-1]
            print('*********')
            print( obj )
            print ( dupl )
            print('_______')
            if obj == dupl:
                short_na = sel
            new_na = short_na[0].lower() + short_na[1:]
            digit_na = ''
            key = True
            for char in new_na:
                if char.isdigit():
                    if key:
                        char = '0'+char
                        key = False
                digit_na= digit_na+char
            tuple_pos = cmds.xform ( obj ,  q=True , ws=True, t=True)

            if digit_na.endswith( '_M' ):
                digit_na = digit_na.replace( '_M', '_m')
            elif  digit_na.endswith( '_R' ):
                digit_na = digit_na.replace( '_R', '_r')
            elif  digit_na.endswith( '_L' ):
                digit_na = digit_na.replace( '_L', '_l')
            cmds.rename ( obj, digit_na )
            if idx == len(list_ch + [dupl])-1:
                try:
                    cmds.parent( digit_na, w=True)
                except Exception:
                    pass
            
            
def create_custom_advanceSk_joints():
    selection = cmds.ls( sl = True )
    for sel in selection:
        dupl = cmds.duplicate( sel )[0]
        list_ch = cmds.listRelatives( dupl, ad = True, type = 'joint' , f = True) or []
        for idx, obj in enumerate(list_ch + [dupl]):
            short_na = obj.split('|')[-1]

            if obj == dupl:
                short_na = sel
            new_na = short_na[0].upper() + short_na[1:]
            digit_na = ''
            key = True
            for char in new_na:
                if char.isdigit():
                    if key:
                        if char == '0':
                            char = ''
                        key = False
                digit_na= digit_na+char
            tuple_pos = cmds.xform ( obj ,  q=True , ws=True, t=True)

            if digit_na.endswith( '_m' ):
                digit_na = digit_na.replace( '_m', '')
            elif  digit_na.endswith( '_r' ):
                digit_na = digit_na.replace( '_r', '')
            elif  digit_na.endswith( '_l' ):
                digit_na = digit_na.replace( '_l', '')
            cmds.rename ( obj, digit_na )
            if idx == len(list_ch + [dupl])-1:
                try:
                    cmds.parent( digit_na, w=True)
                except Exception:
                    pass
 
 
 
            
def copy_control_shapes():
    ####  copy control shapes
    cmds.select('ControlSet')
    control_ls = cmds.ls(sl=True)
    for control in control_ls:
        try:
            control_source = cmds.ls( '*:'+control)[0]
            print ( control_source )
            controls_cv = cmds.ls( control+'.cv[*]' )
            if controls_cv != []:
                rangee = controls_cv[0].split(':')[-1].split(']')[0]
                rangee = int( rangee )
                type(rangee)
                for idx in range (  rangee + 1 ):
                    for axe in ['x','y','z']:
                        value = cmds.getAttr ( control_source+".controlPoints["+str(idx)+"]."+axe+"Value" )
                        print(value )
                        cmds.setAttr ( control+".controlPoints["+str(idx)+"]."+axe+"Value", value )
                        #move -r 0 -20.595056 0 ;
        except Exception as err:
            print ( str(err) + '666666666666666666666666' )
            pass
        
def shapes_control_source_target():
    ####  copy control shapes

    control_ls = cmds.ls(sl=True)
    control_source = control_ls[0]
    target = 'FK'+control_ls[0]
    control_ls = [target]
    for control in control_ls:
        try:
            control_source = cmds.ls( '*:'+control)[0]
            print ( control_source )
            controls_cv = cmds.ls( control+'.cv[*]' )
            if controls_cv != []:
                rangee = controls_cv[0].split(':')[-1].split(']')[0]
                rangee = int( rangee )
                type(rangee)
                for idx in range (  rangee + 1 ):
                    for axe in ['x','y','z']:
                        value = cmds.getAttr ( control_source+".controlPoints["+str(idx)+"]."+axe+"Value" )
                        print(value )
                        cmds.setAttr ( control+".controlPoints["+str(idx)+"]."+axe+"Value", value )
                        #move -r 0 -20.595056 0 ;
        except Exception as err:
            print ( str(err) + '666666666666666666666666' )
            pass
        
        


########  skeleton pose #######

joints_ls = cmds.listRelatives( '*:FitSkeleton' , type = 'joint' , ad = True )
nameSpa = cmds.ls ( '*:FitSkeleton')[0].split(':')[0]
#setTransf( nameSpa+':FitSkeleton', 'FitSkeleton', transf=['s'])
for joint in joints_ls:
    try:
        cmds.parentConstraint( joint, joint.split(':')[-1] , mo = False)
    except Exception:
        pass
for joint in joints_ls:
    break_connection( joint.split(':')[-1]  , ['x','y','z'] ,transf_ls = ['t','r'])