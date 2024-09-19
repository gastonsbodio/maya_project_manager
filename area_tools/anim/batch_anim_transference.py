"""avoid_auto_read"""
import os
import maya.cmds as cmds
import maya.mel as mel
ANIM_FOLDER = "C:/Users/gasco/Downloads/anim_list/"
MATCH_FILE_NA = "anim_rig_exporter.ma"
SKELETON_SETUP_MATCH_FILE = "C:/dev/hydrogen/ContentSource/characters/zikius/archer/Model/Rig/" + MATCH_FILE_NA

SET_UP_REF = 'Archer_Rig.ma'
SET_UP_REF_PATH = "C:/dev/hydrogen/ContentSource/characters/zikius/archer/Model/Rig/"




COG_CONTROL = 'pelvis'
FPS = 'ntsc'




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

def constraining_rig():
    cmds.namespace(setNamespace=':')
    # Collect all namespaces except for the Maya built ins.
    all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True) if x != "UI" and x != "shared"]
    for namespace in all_namespaces:
        for key in DICC_M:
            print ( key )
            print ( cmds.ls ( '*:' + key + '_M', '*:' + key   ) )
            control = cmds.ls ( '*:' + key + '_M' , '*:' + key )[0]
            print ( namespace )
            print ( control)
            if namespace not in control:
                print( ' * * * * * ' )
                print ( namespace +':'+ DICC_M[key] )
                print ( control )
                cmds.parentConstraint ( namespace +':'+ DICC_M[key] , control ,  mo = True )
                cmds.scaleConstraint ( namespace +':'+ DICC_M[key] , control , mo = True ) 
            
        for key in DICC_MIRROR:
            for side in ['L','R']:
                #print ( key )
                #print ( cmds.ls ( '*:' + key + '_'+side ) )
                control = cmds.ls ( '*:' + key + '_'+side )[0]
                if 'list'  not in str(type( DICC_MIRROR[key] )):
                    driver_joint = namespace +':'+ DICC_MIRROR[key]+'_'+side.lower() 
                else:
                    driver_joint = []
                    for base_na in DICC_MIRROR[key]:
                        joint = cmds.ls ( namespace +':'+base_na+'_'+side.lower() ) [0]
                        driver_joint.append( joint )
                if namespace not in control:
                    cmds.parentConstraint ( driver_joint , control ,  mo = True )
                    cmds.scaleConstraint ( driver_joint , control , mo = True ) 
    
    
def delete_namespace():
    # Set root namespace
    cmds.namespace(setNamespace=':')
    # Collect all namespaces except for the Maya built ins.
    all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True) if x != "UI" and x != "shared"]
    if all_namespaces:
        # Sort by hierarchy, deepest first.
        all_namespaces.sort(key=len, reverse=True)
        for namespace in all_namespaces:
            # When a deep namespace is removed, it also removes the root. So check here to see if these still exist.
            if cmds.namespace(exists=namespace) is True:
                cmds.namespace(removeNamespace=namespace, mergeNamespaceWithRoot=True)

def import_reference( path_dir = ANIM_FOLDER  ):
    listAnims = os.listdir( path_dir )
    for anim in listAnims:
        if anim.endswith('.ma') and not anim.startswith(SET_UP_REF):
            try:
                cmds.file( path_dir+anim, o =True , force = True )
            except Exception:
                pass
            cmds.file( rename = path_dir+'new_version_'+anim )
            all_ref_paths = cmds.file( q=True, reference=True ) or []
            for ref_path in all_ref_paths:
                if cmds.referenceQuery(ref_path, isLoaded=True): 
                    cmds.file(ref_path, importReference=True)
            delete_namespace()
            cmds.file( s=True, type='mayaAscii', force = True )


def transfer_anim( ):#path_dir_new_version = ANIM_FOLDER ):
    listAnims = os.listdir( ANIM_FOLDER )
    for anim in listAnims:
        #if True: #anim.endswith('.ma') and anim.startswith('new_ver'):
        cmds.file( SKELETON_SETUP_MATCH_FILE, o =True , force = True )
        cmds.currentUnit( time=FPS )
        all_ref_paths = cmds.file( q=True, reference=True ) or []
        for ref in all_ref_paths:
            if not ref.endswith('/'+SET_UP_REF): ### or is == to unreal skeleton
                refNode = cmds.referenceQuery( ref, referenceNode=True)
                cmds.file( ANIM_FOLDER+anim, loadReference=refNode)
        cmds.select( '*:ControlSet' )
        cnt_ls = cmds.ls(sl=True)
        rig_name_space = cnt_ls[0].split(':')[0]
        for cog in cmds.ls( "*:"+COG_CONTROL, "*:*:"+COG_CONTROL) :
            if rig_name_space not in cog:
                cnt = cog
        if cnt != []:
            cmds.select( cnt )
            control_key = cmds.ls(sl=True)[0]
            end_value = int( cmds.keyframe( control_key, query=True, timeChange=True )[-1] )
            cmds.playbackOptions( minTime=0, maxTime=end_value, e = True )
        cmds.bakeResults( cnt_ls, t = (0 , end_value), simulation=True )
        cmds.file( rename = ANIM_FOLDER+anim.split('.ma')[0]+'_exported.ma' )
        cmds.file ( removeReference = True , referenceNode = refNode)
        cmds.file( s=True, type='mayaAscii', force = True )


#transfer_anim( )
