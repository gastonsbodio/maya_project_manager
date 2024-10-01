import os
import sys
import shutil
from importlib import reload
import ctypes
from ctypes.wintypes import MAX_PATH
dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
    USER_DOC = buf.value
SCRIPT_FOL = USER_DOC + "\\company_tools\\jira_manager"
sys.path.append(SCRIPT_FOL)
import importing_modules as  im
reload(im )
hlp_goo = im.inmporting_modules( 'google_conn.hlp_goo' )
hlp = im.inmporting_modules(  'helper' )

py_cache_fol = '/__pycache__/'
file_path = os.path.realpath( __file__ )
file_path = file_path.replace('\\','/') 
file_path = file_path.split( '/rename_cache.py' )[0]
files_ls = os.listdir( file_path + py_cache_fol )
files_ls222 = os.listdir( file_path )
files_2_upload = []

exception_ls = ['/rig/', 'maya_conn','/anim/' ]

for file in files_ls + files_ls222 :
    if 'rename_cache' not in file and 'importing_modules' not in file  and 'update_all_tools' not in file:
        key = False 
        print ( file )
        print ( 'lalala         lalala            lalala         ')
        if '.cpython-312' in file:
            key_exc = True 
            for excep in exception_ls:
                if excep in file_path+'/':
                    key_exc = False
            if  key_exc :
                key = True
                file__ = file.replace( '.cpython-312' , '_cpython-312')
        elif '.cpython-39' in file:
            key = True
            file__ = file.replace( '.cpython-39' , '_cpython-39')
        if key:
            if '__init___cpython' not in file__:
                path1 = os.path.join( file_path + py_cache_fol.replace('/','\\'), file )
                path2 = os.path.join( file_path, file__ )
                shutil.copy2( path1, path2 )
                if path2.replace('\\','/') not in files_2_upload:
                    files_2_upload.append( path2.replace('\\','/') )
                    path3 = file_path.replace( 'company_tools', 'company_tools____'  )
                    if not os.path.exists( path3):
                        os.makedirs( path3 )
                    shutil.copy2( path1, path2.replace( 'company_tools', 'company_tools____'  ) )
                    print ( 'copyng...   ' + file__)
        if file.endswith('.yaml') or file.endswith('.read') or file.endswith('.ui') or file == '__init__.py':
            if file_path + '/' + file  not in files_2_upload:
                files_2_upload.append( file_path + '/' + file  )
                if not os.path.exists( file_path + '/' ):
                    os.makedirs( file_path + '/' )
                shutil.copy2( file_path + '/' + file  , file_path.replace( 'company_tools', 'company_tools____' )+ '/' + file  )

func_na = 'upload_custom_files( %s , "%s" , "%s" )' %( files_2_upload, 'jira_manager', 'jira_manager' )
file_content = hlp_goo.write_googld_func( func_na, 'upload_.json' , True )
hlp.create_python_file ('upload_', file_content )
hlp.run_py_stand_alone( 'upload_', True )