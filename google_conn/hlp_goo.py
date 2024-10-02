### common functions module
import sys
import json
import ast
import os
import stat
import subprocess
si = subprocess.STARTUPINFO()

from importlib import reload
import importing_modules as  im
reload( im )

de = im.importing_modules( 'definitions' )
hlp = im.importing_modules(  'helper' )

sys.path.append( de.PY_PACKAGES)
import yaml as yaml
import shutil

def is_local_fi_mod( local_mod_date , gdrive_mod_date ):
    day_hour_ls = []
    key_ = False
    for day_hour in [local_mod_date , gdrive_mod_date ]:
        day = day_hour.split('T')[0]
        day = int(day.split('-')[0] + day.split('-')[1] + day.split('-')[2] )
        day_hour_ls.append( day )
        hour = day_hour.split('T')[-1]
        hour = int(hour.split(':')[0] + hour.split(':')[1] + hour.split(':')[2] )
        day_hour_ls.append( hour )
    if day_hour_ls[0] > day_hour_ls[2]:
        key_ = True
    elif day_hour_ls[0] == day_hour_ls[2]:
        if day_hour_ls[1] > day_hour_ls[3]:
            key_ = True
    return key_


def get_google_doc_data( app, QMessageBox, gs ,sheet_na ,sheet_num):
    """read_google_sheet.
    """
    goo_sheet = gs.GoogleSheetRequests()
    if sheet_na != '' and sheet_na != 'None':
        dicc =  goo_sheet.get_data_custom_google_sheet( sheet_na , sheet_num)
        if dicc[ de.key_errors ] == '[]':
            return dicc[ de.ls_result ] 
        else:
            QMessageBox.information(app, u'Googlesheet error.', str( dicc[de.key_errors] )  )
            return []
    else:
        return []

def edit_google_sheet_cell( app , QMessageBox , gs , sheet_na , sheet_num , goog_sh_col_ls , new_value_ls , rowIdx ):
    """read_google_sheet.
    """
    goo_sheet = gs.GoogleSheetRequests()
    if sheet_na != '' and sheet_na != 'None':
        dicc =  goo_sheet.edit_goog_sheet_cell(  sheet_na, sheet_num, goog_sh_col_ls , new_value_ls , rowIdx )
        if dicc[ de.key_errors ] == '[]':
            return dicc[ de.ls_result ] 
        else:
            QMessageBox.information( app, u'Googlesheet error.', str( dicc[de.key_errors] )  )
            return []
    else:
        return []

def write_goo_sheet_request( line, if_result, result_fi_na , GOOGLE_SHEET_DOC_NA , sheet_num ):
    """Specific Jira command, will be the content on a python file made with python requests.
        not possible to run Jira commands when you launch Maya with Gearbox launcher.
    Args:
        line ([str]): [code line to insert on script]
        if_result ([Bool]): [if is able a return ending lines]
        result_fi_na ([str]): [name of file saved with the return result]
    Returns:
        [str]: [python script command content formated]
    """
    file_content =                'import sys\n'
    file_content = file_content + 'import json\n'
    file_content = file_content + 'sys.path.append( r"%s")\n' %de.SCRIPT_MANAG_FOL
    file_content = file_content + 'for path in sys.path:\n'
    file_content = file_content + '    if "Maya2020" in path or "Maya2021" in path or "Maya2022" in path or "Maya2023" in path:\n'
    file_content = file_content + '        sys.path.remove(path)\n'
    file_content = file_content + 'import importing_modules as im\n'
    file_content = file_content + 'de = im.importing_modules( "definitions" )\n'
    file_content = file_content + hlp.ADDITIONAL_LINE_PY3
    file_content = file_content + 'sys.path.append( de.PY_PACK_MOD )\n'
    if '\n' == hlp.ADDITIONAL_LINE_PY3:
        file_content = file_content + 'import py2.oauth2client.service_account as ServiceAcc\n'
    else:
        file_content = file_content + 'import py3.oauth2client.service_account as ServiceAcc\n'
    file_content = file_content + 'import gspread\n'
    file_content = file_content + 'scope = [ "https://spreadsheets.google.com/feeds", "https://www.googleapis.com/auth/spreadsheets" ,\n'
    file_content = file_content + '    "https://www.googleapis.com/auth/drive.file", "https://www.googleapis.com/auth/drive"  ]\n'
    file_content = file_content + 'creds = ServiceAcc.ServiceAccountCredentials.from_json_keyfile_name( de.PY3_PACKAGES.replace("\\\\","/") + "/creds/creds.json" , scope)\n'
    file_content = file_content + 'error_ls = []\n'
    file_content = file_content + '%s = []\n' %de.ls_result
    file_content = file_content + 'try:\n'
    file_content = file_content + '    client = gspread.authorize (creds)\n'
    file_content = file_content + '    sheetLs = client.openall( "%s" )\n' %( GOOGLE_SHEET_DOC_NA )
    file_content = file_content + '    for she in sheetLs:\n'
    file_content = file_content + '        worksheets = she.worksheets()\n'
    file_content = file_content + '        for sheet in worksheets:\n'
    file_content = file_content + '            if "%s" in str(sheet):\n'%(sheet_num)
    file_content = file_content + '                ' +  line  + '\n'
    file_content = file_content + 'except Exception as err:\n'
    file_content = file_content + '    error_ls = ["G Sheet Error"]\n'
    file_content = file_content + '    error_ls.append(err)\n'
    file_content = file_content + '    print( err )\n'
    if if_result:
        file_content = file_content + de.dicc_result +' = {}\n'
        file_content = file_content + de.dicc_result + '["'+ de.ls_result +'"] = ' + de.ls_result+'\n'
        file_content = file_content + de.dicc_result + '["'+ de.key_errors +'"] = str(error_ls)\n'
        file_content = file_content +'json_object = json.dumps( {dicc_result}, indent = 2 )\n'.format( dicc_result = de.dicc_result ) 
        file_content = file_content + 'with open( "{path}", "w") as fileFa:\n'.format( path = de.PY_PATH + result_fi_na )
        file_content = file_content +'    fileFa.write( str(json_object) )\n'
        file_content = file_content +'    fileFa.close()\n'
    return file_content

def write_googld_func( func_na, result_fi_na, if_result):
    """Specific Google Drive command, will be the content on a python file.
        not possible to run Google Drive commands when you launch Maya with Gearbox launcher.
    Returns:
        [str]: [python script command content formated]
    """
    file_content =                'import sys\n'
    file_content = file_content + 'sys.path.append( r"%s")\n' %de.SCRIPT_MANAG_FOL
    file_content = file_content + 'import json\n'
    file_content = file_content + 'for path in sys.path:\n'
    file_content = file_content + '    if "Maya2020" in path or "Maya2021" in path or "Maya2022" in path or "Maya2023" in path:\n'
    file_content = file_content + '        sys.path.remove(path)\n'

    file_content = file_content + 'error_ls = []\n'
    file_content = file_content + '%s = []\n' %de.ls_result
    file_content = file_content + 'try:\n'
    
    file_content = file_content + '    import importing_modules as im\n'
    file_content = file_content + '    gs = im.importing_modules( "google_conn.google_sheet_request" )\n'
    
    file_content = file_content + '    ' + hlp.ADDITIONAL_LINE_PY3
    file_content = file_content + '    reload( gs )\n'
    file_content = file_content + '    goo_dri = gs.GoogleDriveQuery()\n'
    file_content = file_content + '    %s = goo_dri.%s\n' %( de.ls_result , func_na ) #update_tools

    file_content = file_content + 'except Exception as err:\n'
    file_content = file_content + '    error_ls = ["G Sheet Error"]\n'
    file_content = file_content + '    error_ls.append(err)\n'
    file_content = file_content + '    print( err )\n'
    if if_result:
        file_content = file_content + de.dicc_result +' = {}\n'
        file_content = file_content + de.dicc_result + '["'+ de.ls_result +'"] = '+ de.ls_result+'\n'
        file_content = file_content + de.dicc_result + '["'+ de.key_errors +'"] = error_ls\n'
        file_content = file_content +'json_object = json.dumps( {dicc_result}, indent = 2 )\n'.format( dicc_result = de.dicc_result ) 
        file_content = file_content + 'with open( "{path}", "w") as fileFa:\n'.format( path = de.PY_PATH + result_fi_na )
        file_content = file_content +'    fileFa.write( str(json_object) )\n'
        file_content = file_content +'    fileFa.close()\n'
    return file_content
    
   

