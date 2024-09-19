#import ctypes
#from ctypes.wintypes import MAX_PATH
#dll = ctypes.windll.shell32
#buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
#if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
#	USER_DOC = buf.value
#SCRIPT_FOL = USER_DOC + "\\company_tools\\jira_manager"
#RIG_FOL = SCRIPT_FOL.replace('\\','/') + '/area_tools/rig/'
#import maya.mel as mel
#mel.eval('source "%sAdvancedSkeleton/AdvancedSkeleton.mel";AdvancedSkeleton;'%RIG_FOL)