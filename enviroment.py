#### Runing the manager in differents platforms, like Maya, Houdini, Windows we need to same vars with different contents.
import sys
from importlib import reload

ENVIROMENT = 'Windows'
for path in sys.path:
    if "Maya2020" in path or "Maya2021" in path or "Maya2022" in path or "Maya2023" in path:
        ENVIROMENT = 'Maya'
        break

if ENVIROMENT == 'Maya': 
    import maya_conn.maya_custom_cmd as com
    reload(com)
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