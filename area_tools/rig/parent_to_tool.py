""" instructions: place this file on maya script folder, 
    copy the 4th lines bellow  and paste it on script editor (python tab)
    take out the 'hashtag' chars
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

PARENT_PREFIX = '_offset_'
ATTR_NA = "parentTo"
BRIDGE = '_bridge_control'
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
    one_sec =  1000000.0
    if delta_time < one_sec:
        key = False
    #if current_frame != old_frame:
    #    key = False
    return key

def action_getPos_set_keep( control , indexChange):
    
    offset = cmds.listRelatives( control , p=True)[0]
    offset_refe = cmds.duplicate( offset , name= offset+'_refe' , rc=True)[0]
    cmds.parent( offset_refe, w = True )
    controlRefe =  cmds.listRelatives( offset_refe , c=True, type = 'transform')[0]
    current = cmds.currentTime( query=True )
    key_f_ls = cmds.keyframe( control+"."+ATTR_NA , q=True, time=() ) or []
    if current in key_f_ls:
        value = cmds.keyframe( control, attribute=ATTR_NA, query=True, ev=True )[0]
        cmds.setAttr( control+BRIDGE+"."+ATTR_NA, value ) 
        cmds.setKeyframe( control+BRIDGE, attribute=ATTR_NA )
    else:
        cmds.select( control+BRIDGE )
        mel.eval("timeSliderClearKey;")
        
    cmds.setAttr( control+BRIDGE+"."+ATTR_NA, indexChange )  
    cmds.parent( controlRefe , offset )
    valueTx = cmds.getAttr ( controlRefe+".translateX" )
    valueTy = cmds.getAttr ( controlRefe+".translateY" )
    valueTz = cmds.getAttr ( controlRefe+".translateZ" )
    valueRx = cmds.getAttr ( controlRefe+".rotateX" )
    valueRy = cmds.getAttr ( controlRefe+".rotateY" )
    valueRz = cmds.getAttr ( controlRefe+".rotateZ" )
    attr_ls = cmds.listConnections( offset, c = True ) or []
    key = False
    for attr in attr_ls:
        if '.translate' in attr:
            key = True
    if key:
        cmds.setAttr ( control+".translateX" ,valueTx )
        cmds.setAttr ( control+".translateY" ,valueTy )
        cmds.setAttr ( control+".translateZ" ,valueTz )
    cmds.setAttr ( control+".rotateX" , valueRx )
    cmds.setAttr ( control+".rotateY" , valueRy )
    cmds.setAttr ( control+".rotateZ" , valueRz )
    cmds.delete( controlRefe )
    cmds.delete( offset_refe )
    cmds.select( control )
    old_time = current_time()
    old_frame = cmds.currentTime( q=True ) 
    return  old_time,  old_frame


def match_control( control ):#, old_time ):
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
            print ( control+BRIDGE+"."+ATTR_NA  )
            indexChangeBridge = cmds.getAttr( control+BRIDGE+"."+ATTR_NA ) 
            indexChange = cmds.getAttr( control+"."+ATTR_NA )
            old_time = current_time()
            old_frame = cmds.currentTime( q=True ) 
            if indexChangeBridge != indexChange:
                old_time,  old_frame = action_getPos_set_keep( control , indexChange )


def script_job_matcher( cnt ):
    control = cmds.ls( cnt , '*:'+ cnt , '*:*:'+ cnt )
    control = control[0]
    cmds.scriptJob( attributeChange=[ control+'.'+ATTR_NA , partial( match_control, control  ) ] )

def create_script_node( cnt_na ):
    script =          "sys.path.append( r'" + SCRIPT_FOL + "' );"
    script = script + "import importing_modules as im;"
    script = script + "p2t = im.importing_modules( 'area_tools.rig.parent_to_tool' );"  
    script = script + "p2t.script_job_matcher( '%s' )" %cnt_na
    nodeName = cmds.scriptNode( st=2, bs= 'python( "%s" );'%script , n = cnt_na+'matcher')


######
#########3####
###############


def do_set_driving( control, constrain_ls, tup_attr_ctr , dicc_idx , with_scriptjob):
    if with_scriptjob:
        control = control+BRIDGE   
    cmds.setAttr( control+'.'+ATTR_NA, dicc_idx[ tup_attr_ctr[0] ] )
    for attribute in dicc_idx:
        if tup_attr_ctr[0] ==attribute:
            cmds.setAttr( constrain_ls[0]+'.'+attribute, 1 )
            if constrain_ls[1] != '':
                cmds.setAttr( constrain_ls[1]+'.'+attribute, 1 )
        else:
            cmds.setAttr( constrain_ls[0]+'.'+attribute, 0 )
            if constrain_ls[1] != '':
                cmds.setAttr( constrain_ls[1]+'.'+attribute, 0 )
        cmds.setDrivenKeyframe( constrain_ls[0]+'.'+attribute, cd = control+'.'+ATTR_NA )
        if constrain_ls[1] != '':
            cmds.setDrivenKeyframe( constrain_ls[1]+'.'+attribute, cd = control+'.'+ATTR_NA )
    cmds.setAttr( control+'.'+ATTR_NA, 0)


def do_parenting_thing( constrain_type  , disconnect_t_ls,
                       with_scriptjob = True, constrain_offset = True,
                       attribname = ATTR_NA):
    global ATTR_NA
    ATTR_NA = attribname
    controls_ls = cmds.ls(sl=True)
    source_ls = []
    for idx, target_cnt in enumerate(controls_ls):
        if idx == 0:
            control = target_cnt
        else:
            source_ls.append( target_cnt )
    cmds.duplicate( control , name= PARENT_PREFIX+attribname+control )
    try:
        cmds.sets(  PARENT_PREFIX+attribname+control , edit= True , rm = 'ControlSet' )
    except Exception as err:
        print ( 'try warning error ---------------------------')
        print (err)
    if with_scriptjob:
        cmds.duplicate( control , name= control+BRIDGE )
        try:
            cmds.sets(  control+BRIDGE , edit= True , rm = 'ControlSet' )
        except Exception as err:
            print ( 'try warning error ---------------------------')
            print ( err )   
    if with_scriptjob:
        shapes_off = cmds.listRelatives( PARENT_PREFIX+attribname+control , control+BRIDGE ,
                                    ad=True, f =True ) or []
    else:
        shapes_off = cmds.listRelatives( PARENT_PREFIX+attribname+control , ad=True, f =True ) or []
    for sh in shapes_off:
        cmds.delete( sh )
    try:
        cmds.parent( control , PARENT_PREFIX+attribname+control )
    except Exception:
        pass
    for sh in shapes_off:
        try:
            cmds.delete( sh )
        except Exception:
            pass
    orig_offset_ls = cmds.listRelatives( PARENT_PREFIX+attribname+control , p=True, type='transform')
    if constrain_type == 'parent':
        contrain = cmds.parentConstraint (  source_ls + orig_offset_ls , PARENT_PREFIX+attribname+control , mo = constrain_offset ,st=disconnect_t_ls)[0]
        contrain1 = ''
    elif constrain_type == 'orient':
        contrain = cmds.orientConstraint (  source_ls + orig_offset_ls , PARENT_PREFIX+attribname+control , mo = constrain_offset )[0]
        contrain1 = ''
    elif constrain_type == 'point_orient':
        contrain = cmds.pointConstraint (  source_ls + orig_offset_ls , PARENT_PREFIX+attribname+control , mo = False )[0]
        contrain1 = cmds.parentConstraint (  source_ls + orig_offset_ls , PARENT_PREFIX+attribname+control ,st=['x','y','z'] ,mo = True )[0]
    elif constrain_type == 'gun_space':
        contrain = cmds.parentConstraint (  source_ls + orig_offset_ls , PARENT_PREFIX+attribname+control ,st=['x','y','z'] ,mo = True )[0]
        contrain1 = ''

    contrain_ls = [ contrain , contrain1]
    attrb_ls = cmds.listAttr( contrain, r=True, v=True)
    parent_choices = ''
    for choices in ['None']+source_ls:
        parent_choices = parent_choices + choices+':'
    try:
        cmds.addAttr ( control                    ,r=True,k=True ,h=False,ln = ATTR_NA  ,at ="enum" ,en = parent_choices )
    except Exception:
        pass
    if with_scriptjob:
        cmds.addAttr ( control+BRIDGE             ,r=True,k=True ,h=False,ln = ATTR_NA  ,at ="enum" ,en = parent_choices )
    attrb_clean_ls=[]
    dicc_idx={}
    for idx, source in enumerate(orig_offset_ls+source_ls):
        for attr in attrb_ls :
            if attr.startswith( source+'W' ): 
                dicc_idx[attr] = idx
                attrb_clean_ls.append ( (attr,source) )
    for tup_attr_ctr in attrb_clean_ls :
        do_set_driving( control, contrain_ls, tup_attr_ctr ,
                       dicc_idx , with_scriptjob)
    if with_scriptjob:
        create_script_node( control)
    


