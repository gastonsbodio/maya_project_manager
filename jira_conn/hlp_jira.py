### common functions module
import sys
import json
import ast
import os
import stat
import subprocess
si = subprocess.STARTUPINFO()
import definitions as de
import helper as hlp
import manager_tools.hlp_manager as hlp_manager
from importlib import reload

reload(de)
reload(hlp)
reload(hlp_manager)

sys.path.append( de.PY_PACKAGES)
import yaml as yaml
import shutil

 
def load_jira_vars():
    """instancing loging vars for make it run Jira queries.
    """
    dicc = hlp.json2dicc_load( de.TEMP_FOL+de.LOGIN_METADATA_FI_NA )
    if dicc != {}:
        USER = str( dicc['emailAddress'] ) 
        APIKEY = str( dicc['apikey'] )
        PROJECT_KEY = str( dicc['project'] )
    else:
        USER = 'None'
        APIKEY = 'None'
        PROJECT_KEY = 'None'
    return  USER , APIKEY, PROJECT_KEY, de.JI_SERVER

def write_jira_command_file( line, if_result, result_fi_na , user , server, apikey, with_jira_q = True ):
    """Specific Jira command, will be the content on a python file
        not possible to run Jira commands when you launch Maya with Gearbox launcher.
    Args:
        line ([str]): [code line to insert on script]
        if_result ([Bool]): [if is able a return ending lines]
        result_fi_na ([str]): [name of file saved with the return result]
        user ([str]): [user email jira login]
        server ([str]): [example: "https://genvidtech.atlassian.net"]
        apikey ([str]): [jira api key instead of using password]
    Returns:
        [str]: [python script command content formated]
    """
    file_content =                   'import sys\n'
    file_content = file_content +    'sys.path.append( r"{path}" )\n'.format( path = de.SCRIPT_MANAG_FOL )
    file_content = file_content +    'import definitions as de\n'
    file_content = file_content +    'import jira_conn.jira_queries as jq\n'
    file_content = file_content +    hlp.ADDITIONAL_LINE_PY3   
    file_content = file_content +    'reload(de)\n'
    file_content = file_content +    'reload(jq)\n'
    file_content = file_content +    'sys.path.append( de.PY3_PACKAGES )\n'
    file_content = file_content +    'from jira import JIRA\n'
    file_content = file_content +    'import requests\n'
    file_content = file_content +    'from requests.auth import HTTPBasicAuth\n'
    file_content = file_content +    'import json\n'
    file_content = file_content +    'options = {"server": "%s" }\n'%( server )
    file_content = file_content +    'error_ls = []\n'
    file_content = file_content +    '%s = []\n' %de.ls_ji_result
    file_content = file_content +    'try:\n'
    file_content = file_content +    '    jira_m = jq.JiraQueries()\n'
    file_content = file_content +    '    jira =  JIRA(options, basic_auth=( "%s", "%s" ))\n'%( user, apikey )
    if with_jira_q :
        file_content = file_content +    '    ' + line.format( object = 'jira_m.')  + '\n'
    else:
        file_content = file_content +    '    ' + line + '\n'
    file_content = file_content +    'except Exception as err:\n'
    file_content = file_content +    '    error_ls = ["Jira Error"]\n'
    file_content = file_content +    '    error_ls.append(err)\n'
    file_content = file_content +    '    print( err )\n'
    if if_result:
        file_content = file_content + de.dicc_ji_result +' = {}\n'
        file_content = file_content + de.dicc_ji_result + '["'+ de.ls_ji_result +'"] = '+ de.ls_ji_result+'\n'
        file_content = file_content + de.dicc_ji_result + '["'+ de.key_errors +'"] = str(error_ls)\n'
        file_content = file_content +'json_object = json.dumps( {dicc_ji_result}, indent = 2 )\n'.format( dicc_ji_result = de.dicc_ji_result ) 
        file_content = file_content + 'with open( "{path}", "w") as fileFa:\n'.format( path = de.PY_PATH + result_fi_na )
        file_content = file_content +'    fileFa.write( str(json_object) )\n'
        file_content = file_content +'    fileFa.close()\n'
    return file_content

def write_request_jira_file( line, if_result, result_fi_na ):#
    """Specific Jira command, will be the content on a python file made with python requests.
        not possible to run Jira commands when you launch Maya with Gearbox launcher.
    Args:
        line ([str]): [code line to insert on script]
        if_result ([Bool]): [if is able a return ending lines]
        result_fi_na ([str]): [name of file saved with the return result]
    Returns:
        [str]: [python script command content formated]
    """
    file_content =                   'import sys\n'
    file_content = file_content +    'sys.path.append( r"{path}" )\n'.format( path = de.SCRIPT_MANAG_FOL )
    file_content = file_content +    'import definitions as de\n'
    file_content = file_content +    hlp.ADDITIONAL_LINE_PY3
    file_content = file_content +    'reload(de)\n'
    file_content = file_content +    'sys.path.append( de.PY3_PACKAGES )\n'
    file_content = file_content +    'import requests\n'
    file_content = file_content +    'from requests.auth import HTTPBasicAuth\n'
    file_content = file_content +    'import json\n'
    file_content = file_content +    '%s = []\n' %de.ls_ji_result
    file_content = file_content +    'error_ls = []\n'
    file_content = file_content +     line  + '\n'
    if if_result:
        file_content = file_content + de.dicc_ji_result +' = {}\n'
        file_content = file_content + de.dicc_ji_result + '["'+ de.ls_ji_result +'"] = '+ de.ls_ji_result+'\n'
        file_content = file_content + de.dicc_ji_result + '["'+ de.key_errors +'"] = str(error_ls)\n'
        file_content = file_content +'json_object = json.dumps( {dicc_ji_result}, indent = 2 )\n'.format( dicc_ji_result = de.dicc_ji_result ) 
        file_content = file_content + 'with open( "{path}", "w") as fileFa:\n'.format( path = de.PY_PATH + result_fi_na )
        file_content = file_content +'    fileFa.write( str(json_object) )\n'
        file_content = file_content +'    fileFa.close()\n'
    return file_content
    

def set_issue_label( app, QMessageBox , label_ls, issue_key, jira_m):
    for label in label_ls:
        dicc = jira_m.set_label( issue_key , label , app.USER , de.JI_SERVER , app.APIKEY  )
        if dicc[ de.key_errors ] != '[]':
            QMessageBox.information( app, u'Jira  setting tags labels Error.', str( dicc[de.key_errors] )  )
            return False
    return True

def jira_creation_task_issue( app ,QMessageBox ,issue_type ,assign_user_id , item_na , area ,
                             area_done_dicc , path_ls , anim_asset , itemType):
    description = 'Jira Manager Tool'
    summary = area + '  task  for: '+ item_na
    dicc = app.jira_m.create_issue( app.USER, de.JI_SERVER, app.APIKEY, app.PROJECT_KEY , summary ,
                                        description, issue_type, app.USER )
    if dicc[ de.key_errors ] != '[]':
        QMessageBox.information( app, u'Jira  creating issue Error.', str( dicc[de.key_errors] )  )
    else:
        issue_key =     hlp.byte_string2string(  dicc [ de.ls_ji_result ]  )
    area_done_dicc [ area ] =  issue_key
    dicc = app.jira_m.assign_2_user ( issue_key, assign_user_id, app.USER ,de.JI_SERVER , app.APIKEY )
    if dicc[ de.key_errors ] != "[]":
        QMessageBox.information( app, u'Jira  assigning user Error.', str( dicc[de.key_errors] )  )
    else:
        label_ls , goo_colum , value_ls = hlp_manager.define_main_item_vars( app, area , anim_asset , item_na , 
                                                                            area_done_dicc , path_ls , itemType )
        key = set_issue_label( app,  QMessageBox ,label_ls, issue_key  , app.jira_m)
        if key:
            return  goo_colum , value_ls


def get_self_tasks( app , QMessageBox , area_ls ):
    """Query Jira for get own assigned issues.
    Returns:
        [ls]: [list of jira issues]
    """
    if app.PROJECT_KEY != '' and app.PROJECT_KEY != 'None':
        if app.APIKEY != 'None' and app.USER != 'None':
            dicc = app.jira_m.get_custom_user_issues( app.USER, de.JI_SERVER, app.APIKEY, 'assignee', app.PROJECT_KEY , 'jira'  )
            if dicc[ de.key_errors ] != '[]':
                QMessageBox.information(app.main_widg, u'getting user task errors', str( dicc[de.key_errors] )  )
        filtered_tasks_ls = []
        for task_dicc in dicc[de.ls_ji_result]:
            if task_dicc[ de.area ] in area_ls:
                filtered_tasks_ls.append( task_dicc )
        return  filtered_tasks_ls
    else:
        return []

