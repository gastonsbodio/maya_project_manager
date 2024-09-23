### Main Constants on the manager System. 
import sys
import tempfile
import os
import ctypes
from ctypes.wintypes import MAX_PATH
dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
	USER_DOC = buf.value
USER_NA = os.environ['USERNAME']
COMPANY_TOOLS_FOL = "company_tools"
PY_PACK_MOD = USER_DOC + "\\"+COMPANY_TOOLS_FOL+"\\packages"

sys.path.append( PY_PACK_MOD )
import py3.yaml as yaml

def get_yaml_fil_data ( path ):
    """Read a yaml metadata file and return a dicc
    Args:
        path ([str]): [given yamel file path]
    Returns:
        [dicc]: [description]
    """
    data = {}
    if os.path.isfile( path ):
        with open(path , "r") as stream:
            try:
                data = yaml.safe_load(stream)
            except yaml.YAMLError as exc:
                print(exc)
            stream.close()
        return data
    else:
        return None


##### general vars ##
###########
######
#

PY2_PACKAGES = PY_PACK_MOD + "\\py2" 
PY3_PACKAGES = PY_PACK_MOD + "\\py3" 
JIRA_MANAGE_FOL = 'jira_manager'
SCRIPT_MANAG_FOL = USER_DOC + "\\"+COMPANY_TOOLS_FOL+"\\"+JIRA_MANAGE_FOL
OPEN_DEFINI_YAML = 'open_definitions.yaml'
HELP_YAML_NA = '__help__.yaml' 
ANIM_FOL_FILES = '/area_tools/anim/'
RIG_FOL_FILES = '/area_tools/rig/'

DEFIN_DICC = get_yaml_fil_data( SCRIPT_MANAG_FOL +'\\' + OPEN_DEFINI_YAML )
HELP_DICC = get_yaml_fil_data( SCRIPT_MANAG_FOL +'\\' + HELP_YAML_NA )

if sys.version_info.major == 2:
	PY_PACKAGES = PY2_PACKAGES
elif sys.version_info.major == 3:
	PY_PACKAGES = PY3_PACKAGES
PY3CACHE_FOL = '__pycache__'
TEMP_FOL = tempfile.gettempdir().replace("\\","/") + "/"
JI_SERVER = DEFIN_DICC['KEYW']['WEB_LINKS']['JI_SERVER']
# witch python standalone we will use
PY_PATH = 'C:/Users/%s/AppData/Local/Programs/Python/Python312/'%USER_NA #'C:/Python27/'  
TRACK_SHEET_ITEMS = DEFIN_DICC['KEYW']['WEB_LINKS']['TRACK_SHEET_ITEMS']

INSTRUCTION_CHECK_ANIM_TOOL = 'https://docs.google.com/document/d/1gAxtH1fhukNAWPnWSfflYai9NQe0qsh6OVcnn7FzlKU/edit?usp=sharing'
#### lo voy a descontinuar con el nuevo help yaml

LINK_ICON_PATH =  PY2_PACKAGES.replace('\\','/')  + "/icon/link.png" 
COMMENT_ICON_PATH =  PY2_PACKAGES.replace('\\','/')  + "/icon/comment.png" 
ANIM_CHECK_TOOL_SETTING ='anim_check_settings.json'
ANIM_PATH_TASK_CREAT = 'anim_path_creation_tool.json'
LOGIN_METADATA_FI_NA ='login_metadata.json'
PERF_LOG_METADATA_FI_NA ='perf_log_metadata.json'
ROOTS_METAD_FI_NA = 'roots_metadata.json'
SETTINGS_SUFIX = '__settings__.yaml'
MANAGE_PROD_UI = 'management_tool.ui'
TASK_CREATION_UI = 'task_creation_panel.ui'
ANIM_CHECK_UI = 'checker_anim_tool.ui'
ANIM_PATH_TREE_UI = 'anim_path_treel.ui'
COMMENTS_UI = 'comments_panel.ui'
TRANSF_ANIM_T_UI = "transferAnimTool.ui"
PARENTWEAP_TOOL_UI = "parentWeaponTool.ui"
FORBIDDEN_CHARS = [" ","-","_","@","%", "$","?", "!", "|","*",".",",",";"]

###########
#MASTER_USER = ""
#MASTER_API_KEY = ""

########
### company vars
COMPANY_MENU_NA = DEFIN_DICC['KEYW']['COMPANY']['COMPANY_MENU_NA']
TOOLS_MENU_NA = DEFIN_DICC['KEYW']['COMPANY']['TOOLS_MENU_NA']
ANIM_TOOLS_MENU_NA = DEFIN_DICC['KEYW']['COMPANY']['ANIM_TOOLS_MENU_NA']
RIG_TOOLS_MENU_NA = DEFIN_DICC['KEYW']['COMPANY']['RIG_TOOLS_MENU_NA']
SKIP_AUTO_READ_PHRASE = DEFIN_DICC['KEYW']['COMPANY']['SKIP_AUTO_READ_PHRASE']

#### Googles vars
STU_LIB_FOL_NA = DEFIN_DICC['KEYW']['STU_LIB_FOL_NA']
GOOG_CONTENT_TOOLS_FOL = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOG_CONTENT_TOOLS_FOL']
GOOG_CONT_ANI_TOO_FOL = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOG_CONT_ANI_TOO_FOL']
GOOG_CONT_RIG_TOO_FOL = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOG_CONT_RIG_TOO_FOL']
GOOGLE_SHEET_DOC_NA = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SHEET_DOC_NA']
GOOGLE_SHEET_ANIM_CHECK = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SHEET_ANIM_CHECK']
GOOGLE_SH_ASS_NA_COL = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SH_ASS_NA_COL']
GOOGLE_SH_ANI_NA_COL = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SH_ANI_NA_COL']
GOOGLE_SH_CREAT_AREA_COL = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SH_CREAT_AREA_COL']
GOOGLE_SH_CREAT_PATH = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SH_CREAT_PATH']
GOOGLE_SH_ANIM_ASSET_COL = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SH_ANIM_ASSET_COL']
GOOGLE_SH_ISSUE_KEY = DEFIN_DICC['KEYW']['GOO_SHEETS_TRACK']['GOOGLE_SH_ISSUE_KEY']

GOOG_SH_ALPHA_LS =   ["A","B","C","D","E","F","G","H","I","J", "K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
GOOG_SH_NUM_COL =[ 1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11, 12, 13, 14, 15, 16, 17,18, 19, 20, 21, 22, 23, 24, 25, 26]


##  table vars
assignee = 'Assignee'
reporter = 'Reporter'
id = 'Id'
status = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['status']
comments = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['comments']
spec = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['spec']
title = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['title']
area = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['area']
asset_na = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['asset_na']
ani_na = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['ani_na']
anim_char = 'CharIn'
item_path = 'Path'
thumbnail = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['thumbnail']
assType = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['assType']
aniType = DEFIN_DICC['KEYW']['ANIM_ASSET_TABLES_LABELS']['aniType']
itemType = 'Item Type'
HEADER_ASS_LS = [ thumbnail , asset_na , assType,  area , title , spec, comments , status ]
HEADER_ANI_LS = [ thumbnail , ani_na , aniType , area , title , spec, comments , status ]

##### jira comments 
comment_body = 'comm_body'
comment_author = 'comm_author'
comment_date = 'comm_date'

### check anim tool
anim = DEFIN_DICC['KEYW']['CHECK_ANIM_TOOL']['anim']
maya = DEFIN_DICC['KEYW']['CHECK_ANIM_TOOL']['maya']
fbx = DEFIN_DICC['KEYW']['CHECK_ANIM_TOOL']['fbx']
unreal = DEFIN_DICC['KEYW']['CHECK_ANIM_TOOL']['unreal']
anim_check_colum_sheet_column = DEFIN_DICC['KEYW']['CHECK_ANIM_TOOL']['anim_check_colum_sheet_column']
CHECK_ANIM_LS = [ anim , maya , fbx , unreal ]

THUMB_IDX = 0
ITEM_NA_IDX = 1
ITEMTYPE_IDX = 2
AREA_IDX = 3
TITLE_IDX = 4
STATUS_IDX = 7
ISSUE_LINK_IDX = 5
COMMENT_IDX = 6

width_as_thum = 100
height_as_thum = 65
height_anim_ch_row = 20

##  menues texts
open_fi_fol = DEFIN_DICC['KEYW']['MENUES_LABELS']['open_fi_fol']
dowload_fi_perf = DEFIN_DICC['KEYW']['MENUES_LABELS']['dowload_fi_perf']
do_thumb = DEFIN_DICC['KEYW']['MENUES_LABELS']['do_thumb']
snip_thumb = DEFIN_DICC['KEYW']['MENUES_LABELS']['snip_thumb']
get_thumb = DEFIN_DICC['KEYW']['MENUES_LABELS']['get_thumb']

## perforce vars
dicc_result = 'dicc_result'
ls_result = 'ls_result'

## jira vars
issue_type_asset = 'Asset'
issue_type_anim = 'Animation'
issue_type_task = 'Task'
dicc_ji_result = 'dicc_result'
ls_ji_result = 'ls_result'
key_connected = 'keyConnected'

### commons keys
key_errors= 'errors'

#######  anim check tool vars
UNR_EXCEPTION_SUFIXS = [ "_Cinematics.uasset", "_Montage.uasset"]

#######  menu pipeline  tools ##
TASK_CREATION_TOOL = 'Task Creation Tool'

