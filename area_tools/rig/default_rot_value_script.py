""" instructions: place this file on maya script folder, 
    copy the 4th lines bellow  and paste it on script editor (python tab)
    take out the hashtag chars
    before executing, select first, the target ( control to parent to), and after that, all the sources ( objects to be parented with)
"""
"""avoid_auto_read"""

#from importlib import reload
#import area_tools.rig.parent_to_tool as p2t
#reload(p2t)
#p2t.do_parenting_thing('parent')

import os
from datetime import datetime
import maya.mel as mel
from functools import partial
import maya.cmds as cmds
from maya import OpenMayaAnim as oma

import ctypes
from ctypes.wintypes import MAX_PATH
dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
	USER_DOC = buf.value
SCRIPT_FOL = USER_DOC + "\\company_tools\\jira_manager"

DEFAULT_ROT_IK = 'defaultRot'

########
old_time = 0
old_frame = 0

def current_time():
    now = str(datetime.now())
    date_ = str(now).replace('-','')
    date_ = date_.replace(' ','')
    date_ = date_.replace(':','')
    date_ = date_.replace('.','') 
    date_ = float ( date_ )
    return date_

def if_loop( old_frame , old_time ):#, *args ):
    key = True
    curent_date = current_time()
    current_frame = cmds.currentTime( q=True ) 
    delta_time = curent_date - old_time
    ###### one second      1000000
    #one_sec = 250719461.0 ### one second divide by 2
    one_sec = 1000000
    if delta_time < one_sec:
        key = False
    #else:
    #    if current_frame != old_frame:
    #        key = False
    return key


def do_default_ik_rot_attr ( control , mult_div ):
    global old_time
    global old_frame
    key = if_loop ( old_frame ,old_time )
    old_time = current_time()
    old_frame = cmds.currentTime( q=True ) 
    if key:
        sel_cont = cmds.ls( sl = True )
        if len (sel_cont)== 1:
            sel_cont = sel_cont[0]
        elif len (sel_cont)< 1 or len (sel_cont)> 1:
            sel_cont = 'None'
        old_time = current_time()
        old_frame = cmds.currentTime( q=True ) 
        if sel_cont == control:
            indexChangeHided = cmds.getAttr( control + "."+ DEFAULT_ROT_IK+"_hided" )
            indexChange = cmds.getAttr( control + "."+ DEFAULT_ROT_IK )
            old_time = current_time()
            old_frame = cmds.currentTime( q=True ) 
            if indexChangeHided != indexChange:
                valueX = cmds.getAttr( mult_div +'.input1X' ) 
                valueY = cmds.getAttr( mult_div +'.input1Y' ) 
                valueZ = cmds.getAttr( mult_div +'.input1Z' ) 
                cmds.setAttr( control+'.rotateX', valueX ) 
                cmds.setAttr( control+'.rotateY', valueY )
                cmds.setAttr( control+'.rotateZ', valueZ )
                cmds.setAttr( control+ "."+ DEFAULT_ROT_IK+"_hided", indexChange ) # defaultRot_hided
                old_time = current_time()
                old_frame = cmds.currentTime( q=True ) 
                cmds.select( control )

def script_job( cnt , MULT_DIV_ROT_VALUE, attribname):
    control = cmds.ls( cnt , '*:'+ cnt , '*:*:'+ cnt )[0]
    multipl_div = cmds.ls( MULT_DIV_ROT_VALUE % cnt , '*:'+ MULT_DIV_ROT_VALUE % cnt , '*:*:'+ MULT_DIV_ROT_VALUE % cnt)[0]
    cmds.scriptJob( attributeChange=[ control+'.'+attribname , partial( do_default_ik_rot_attr, control , multipl_div ) ] )

def create_script_node( cnt_na, MULT_DIV_ROT_VALUE , attribname = ""):
    script =          "sys.path.append( '" + SCRIPT_FOL + "' );"
    script = script + "import importing_modules as im;"
    script = script + "drv = im.inmporting_modules( 'area_tools.rig.default_rot_value_script' );"  
    script = script + "drv.script_job( '%s', '%s' , '%s') ;" %( cnt_na, MULT_DIV_ROT_VALUE , attribname )
    nodeName = cmds.scriptNode( st=2, bs= 'python( "%s" );'%script , n = 'script_rot_defa_'+cnt_na+'_value')
