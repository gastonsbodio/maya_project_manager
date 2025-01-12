#### Runing the manager in differents platforms, like Maya, Houdini, Windows we need to same vars with different contents.
import sys
import ctypes
from ctypes.wintypes import MAX_PATH
dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
    USER_DOC = buf.value
SCRIPT_FOL = USER_DOC + "\\company_tools\\jira_manager"
sys.path.append( SCRIPT_FOL )
from importlib import reload
import importing_modules as  im
reload( im )
de = im.importing_modules( 'definitions' )

#ENVIROMENT = 'Windows'
for path in sys.path:
    if 'Python312' in path:
        ENVIROMENT = 'Windows'
        break
    elif "Maya2020" in path or "Maya2021" in path or "Maya2022" in path or "Maya2023" in path:
        ENVIROMENT = 'Maya'
        break
if ENVIROMENT == 'Maya': 
    com = im.importing_modules( 'maya_conn.maya_custom_cmd' )
    ENV_SCRIPT_FOL = com.get_script_fol()
    def current_scene ():
        return com.get_current_sc()
    def getWindow(QWidget):
        return com.getWindow(QWidget)
    def create_empty_task( fi_na ):
        com.create_empty_task( fi_na )
elif ENVIROMENT == 'Windows':
    def getWindow(QWidget):
        return None