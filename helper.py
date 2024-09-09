### common functions module
import sys
import json
import ast
import os
import stat
import subprocess
si = subprocess.STARTUPINFO()
import definitions as de

from importlib import reload
reload(de)

sys.path.append( de.PY_PACKAGES)
#import yaml as yaml
import shutil

ADDITIONAL_LINE_PY3 = 'from importlib import reload\n'  #'\n'#

def make_read_writeable(filename):
    """set file as read-only false
    Args:
        filename ([str]): [description]
    """
    os.chmod(filename, stat.S_IWRITE)

def metadata_dicc2json( path, dicc ):
    """Creates a json file from a givem dicctionary
    Args:
        path ([str]): [json file path ]
        dicc ([dicc obj]): [description]
    """
    json_object = json.dumps( dicc, indent = 2 ) 
    with open( path, 'w') as fileFa:
        fileFa.write( str(json_object) )
        fileFa.close()
        
def json2dicc_load(path):
    """Read a json dicc and return a python dicc
    Args:
        path ([str]): [json file path]

    Returns:
        [dicc]: [description]
    """
    dicc = {}
    if os.path.isfile( path ):
        with open( path) as fileFa:
            dicc = json.load(fileFa)
            fileFa.close()
    return dicc

def byte_string2string( string ):
    if string.startswith("b'"):
        string=string.replace("b'","")
        string=string.replace("'","")
    return string

def get_yaml_fil_data( path ):
    return de.get_yaml_fil_data( path )
     

def separate_path_and_na(full_path):
    """Return separated values on a full path (path and file)
    Args:
        full_path ([str]): [full file path]
    Returns:
        [touple]: [touple of strings with path, and file name]
    """
    fi_na = full_path.split('/')[-1]
    path_ = full_path.split(fi_na)[0]
    return path_ , fi_na

def format_path(path):
    path = path.replace('\\','/')
    if not path.endswith('/'):
        path = path + '/'
    return path


def go_2_perf_root_path( path, proj_settings , depot_root ):
    real_dp_fol_root = proj_settings['KEYW']['real_depot_fol_root']
    mapped_dp_fol_root = proj_settings['KEYW']['maped_depot_fol_root']
    local_fol_root = proj_settings['KEYW']['local_fol_root']
    path_ = path.replace(    '/'+local_fol_root+'/'  ,    '/'+mapped_dp_fol_root+'/'   )
    new_root = depot_root.split( '/'+real_dp_fol_root )[0]
    path_ = new_root+'/'+mapped_dp_fol_root+'/'+ path_.split( '/'+mapped_dp_fol_root+'/' )[-1]
    return path_

def go_2_local_root_path( path, proj_settings , local_root ):
    mapped_dp_fol_root = proj_settings['KEYW']['maped_depot_fol_root']
    local_fol_root = proj_settings['KEYW']['local_fol_root']
    path_ = path.replace(    '/'+mapped_dp_fol_root+'/'     ,   '/'+local_fol_root+'/'    )
    path_ = local_root+'/'+local_fol_root+'/'+ path_.split( '/'+local_fol_root+'/' )[-1]
    return path_

def fix_perf_mapped_root_path( path, proj_settings ):
    real_dp_fol_root = proj_settings['KEYW']['real_depot_fol_root']
    mapped_dp_fol_root = proj_settings['KEYW']['maped_depot_fol_root']
    local_fol_root = proj_settings['KEYW']['local_fol_root']
    path_ = path.replace(    real_dp_fol_root+'/'+local_fol_root     ,   mapped_dp_fol_root    )
    return path_


def only_name_out_extention( file_path , with_prefix = True, prefix = '' ):
    path, name = separate_path_and_na( file_path )
    file = name.split('.')[0]
    if with_prefix:
        if not file.startswith (prefix):
            file = prefix + file
    return file

def run_py_stand_alone( python_file_na , with_console = False, extraLine= '' ):
    """create a bat file witch run python stand alone
    Args:
        python_file_na ([str]): [python file path]
    """
    batPythonExec = '@echo off\n'
    batPythonExec = batPythonExec + '"'+ de.PY_PATH.replace('/','\\') + 'python.exe" "'+de.PY_PATH.replace('/','\\')+python_file_na+'.py" \n'
    batPythonExec = batPythonExec + '\n'+extraLine
    with open( de.PY_PATH+"Execute_" + python_file_na + ".bat", "w") as fileFa:
        fileFa.write( batPythonExec )
        fileFa.close()
    si.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    if with_console == False:
        subprocess.call( [r'%sExecute_%s.bat'%( de.PY_PATH.replace('/','\\\\') , python_file_na ) ] , startupinfo = si )
    elif with_console == True:
        subprocess.Popen( [r'%sExecute_%s.bat'%( de.PY_PATH.replace('/','\\\\')  , python_file_na ) ] )
    elif with_console == 'Special':
        subprocess.call( [r'%sExecute_%s.bat'%( de.PY_PATH.replace('/','\\\\')  , python_file_na ) ] )
    #subprocess.call(["start", 'C:\\Python27\\Execute_google_sheet_query.bat'], shell=True)


def create_python_file( python_file_na, python_file_content ):
    """Jus create python file with a given content
    Args:
        python_file_na ([str]): [python file name]
        python_file_content ([str]): [script content]
    """
    with open( de.PY_PATH + python_file_na + ".py", "w") as fileFa:
        fileFa.write( python_file_content )
        fileFa.close()
 
def get_matching_key( dicc, value ):
    for key in dicc:
        if dicc[key] == value:
            return key
        






