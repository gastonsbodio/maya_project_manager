import sys
import maya.cmds as cmds
import maya.mel as mel
#import pymel.core as pm
import maya.OpenMaya as OpenMaya
import maya.OpenMayaUI as mui
from shiboken2 import wrapInstance

def getWindow(QWidget):
    pointer = mui.MQtUtil.mainWindow()
    if pointer is not None:
        try:
            return wrapInstance(long(pointer), QWidget)
        except Exception:
            return wrapInstance(int(pointer), QWidget)

def thumbnail_cmd( h, w, path, name):
    """Maya thumbnail generator command
    Args:
        h ([int]): [description]
        w ([int]): [description]
        path ([str]): [description]
        name ([str]): [description]
    """
    frame = cmds.currentTime(q=1)
    currentPanel = cmds.playblast( ae = True )
    cmds.modelEditor (currentPanel, edit = True, grid = False, hud = False  ,alo = False)
    cmds.modelEditor (currentPanel, edit = True, polymeshes = True,str = True , da = "smoothShaded")
    cmds.setAttr ('defaultRenderGlobals.imageFormat', 8)
    cmds.playblast( format = "image", cf = path + "/" + name , h = h, w = w,
                fr = [frame], viewer = False, orn = False, fp = 0, fo = True, p = 100, qlt = 100)

def get_script_fol():
    try:
        return cmds.internalVar(usd=True)
    except Exception:
        return None
def get_current_sc():
    return cmds.file(query=True, sceneName=True)

def create_empty_task( fi_na ):
    cmds.file( new=True , force=True )
    cmds.file(  rename=fi_na )#, force=True )
    cmds.file( s=True , force=True )
    
def currentFpsChoiceFunc(  ):
    current_fps = cmds.currentUnit(query=True, time=True)
    dicc_fps_sett = { "ntsc" : "30" , "game" : "15",
                      "23.976fps" : "23.976", "film" : "24", "pal" : "25" ,
                      "show" : "48", "palf": "50", "ntscf": "60"
                     }
    for key in dicc_fps_sett:
        if key == current_fps:
            value = dicc_fps_sett[ key ]
            key_string = key
    return  dicc_fps_sett , key_string , value

def get_bin_fol():
    for pathh in sys.path:
        if pathh.endswith('bin'):
            mayabinpath = pathh
            break
    return mayabinpath

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


def set_color( shape, color_index ):
    for sha in cmds.ls ( shape, l = True ):
        try:
            cmds.setAttr ( sha+'.overrideEnabled' ,1)
            cmds.setAttr ( sha+'.overrideColor' , color_index )
        except Exception as err:
            print ( err )

def delete_namespaces(  ):
    curNS = cmds.namespaceInfo( lon=True )
    defaults = ["UI", "shared"]
    diff = [item for item in curNS if item not in defaults]
    for ns in diff:
        if cmds.namespace( exists=str(ns)):
            try:
                cmds.namespace( rm=str(ns) , f = True)
            except Exception:
                pass

def fix_lambert_lock_error():
    cmds.lockNode('initialShadingGroup', l=0, lockUnpublished=0)
    print('Broken Lambert shader fixed')
    cmds.lockNode('defaultTextureList1', l=False, lockUnpublished=False)