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

from importlib import reload

reload(de)
reload(hlp)

sys.path.append( de.PY_PACKAGES)
import yaml as yaml
import shutil


def load_perf_vars():
    """instancing loging vars for make it run  Perforce queries.
    """    
    dicc = hlp.json2dicc_load( de.TEMP_FOL+de.PERF_LOG_METADATA_FI_NA )
    if dicc != {}:
        PERF_USER = str( dicc['perf_user'] ) #'user'])
        PERF_WORKSPACE = str( dicc['perf_workspace'] )
        PERF_SERVER = str( dicc['perf_server'] )
        PERF_PASS = str( dicc['perf_pass'] )
    else:
        PERF_USER = 'None'
        PERF_WORKSPACE = 'None'
        PERF_SERVER = 'None'
        PERF_PASS = 'None'
    return  PERF_USER ,PERF_SERVER ,PERF_WORKSPACE, PERF_PASS 


def write_perforce_command_file ( line, if_result, result_fi_na, perf_server, perf_user, workspace, perf_pass):
    """Specific Perforce command, will be the content on a python file
        not possible to run Perforces commands directly in Maya.
    Args:
        line ([str]): [code line to insert on script]
        if_result ([Bool]): [if is able a return ending lines]
        result_fi_na ([str]): [name of file saved with the return result]
    Returns:
        [str]: [python script command content formated]
    """
    file_content =                'import sys \n'
    file_content = file_content + 'sys.path.append( r"{path}" )\n'.format( path = de.SCRIPT_FOL )
    file_content = file_content + 'sys.path.append( r"%s" )\n' %de.PY3_PACKAGES  #de.PY2_PACKAGES
    file_content = file_content + 'from P4 import P4,P4Exception \n' 
    file_content = file_content + 'import json\n'  
    file_content = file_content + 'import perforce_conn.perforce_requests as pr\n' 
    file_content = file_content +  hlp.ADDITIONAL_LINE_PY3      
    file_content = file_content + 'reload (pr)\n'
    file_content = file_content + 'p4 = P4() \n'
    file_content = file_content + 'p4.port = "%s"   \np4.user = "%s"   \np4.client = "%s"   \n'%(perf_server, perf_user, workspace)
    file_content = file_content + 'p4.password = "%s"   \n'%(perf_pass)
    file_content = file_content + 'error_ls = [] \n'
    file_content = file_content + '%s = [] \n' %de.ls_result
    file_content = file_content + 'try:\n'
    file_content = file_content + '    perf = pr.PerforceRequests()\n'
    file_content = file_content + '    p4.connect()\n'
    file_content = file_content + line +'\n'
    file_content = file_content + '    p4.disconnect()\n' 
    file_content = file_content + 'except P4Exception as err:\n'
    file_content = file_content + '    print( err )\n' 
    file_content = file_content + '    error_ls = ["Perforce Errors"] \n' 
    file_content = file_content + '    for e in p4.errors:\n'
    file_content = file_content + '        error_ls.append(str(e))\n'
    if if_result:
        file_content = file_content + de.dicc_result +' = {}\n'
        file_content = file_content + de.dicc_result + '["'+ de.ls_result +'"] = '+ de.ls_result+'\n'
        file_content = file_content + de.dicc_result + '["'+ de.key_errors +'"] = str(error_ls)\n'
        file_content = file_content +'json_object = json.dumps( {dicc_result}, indent = 2 )\n'.format( dicc_result = de.dicc_result ) 
        file_content = file_content + 'with open( "{path}", "w") as fileFa:\n'.format( path = de.PY_PATH + result_fi_na )
        file_content = file_content +'    fileFa.write( str(json_object) )\n'
        file_content = file_content +'    fileFa.close()\n'
    return file_content

   
def perf_task_submit( app, QMessageBox , perf , item_na, area, asset_rig_full_path, 
                     PERF_SERVER, PERF_USER, PERF_WORKSPACE, PERF_PASS):
    # 
    perf.checkout_file( asset_rig_full_path , PERF_SERVER, PERF_USER, PERF_WORKSPACE, PERF_PASS )
    hlp.make_read_writeable( asset_rig_full_path )
    comment = item_na + ' ' + area +' template created'
    dicc = perf.add_and_submit( asset_rig_full_path, comment , PERF_SERVER, PERF_USER,
                               PERF_WORKSPACE, PERF_PASS )
    if dicc[de.key_errors] == '[]':
        print('Submmition Done')
    else:
        QMessageBox.information( app, u'submittion perf error.', str( dicc[de.key_errors] )  )


def transform_given_path( path, way_key , proj_settings , local_root , depot_root ):
    if way_key == 'local':
        path = hlp.go_2_local_root_path( path, proj_settings ,local_root )
    elif way_key == 'depot':
        path = hlp.go_2_perf_root_path( path, proj_settings ,depot_root )
    return path

def check_template_exists(  app, QMessageBox, source_path , source_name , perf ):
    dicc = perf.pull_file_2_local( source_path + source_name , True , app.PERF_SERVER, app.PERF_USER, 
                                  app.PERF_WORKSPACE , app.PERF_PASS)
    if dicc[de.key_errors] != '[]':
        QMessageBox.information( app, u'Downloading perforce error', str( dicc[de.key_errors] )  )
