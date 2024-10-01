import sys
import ctypes
from ctypes.wintypes import MAX_PATH
dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
    USER_DOC = buf.value
SCRIPT_FOL = USER_DOC + "\\company_tools\\jira_manager"
sys.path.append( SCRIPT_FOL )
import importlib

def only_modules( import_str ):
    try:
        module = __import__( import_str )
    except Exception:
        try:
            module = __import__( import_str + '.cpython-39')
        except Exception:
            module = __import__( import_str  + '.cpython-312' )
    importlib.reload( module )
    return module

importlib.import_module('concurrent.futures')

def with_package( import_str ):
    try:
        inmp_mod = importlib.import_module( import_str )
    except Exception :
        try:
            typee = '_cpython-39'
            import_str___ = import_str + typee
            inmp_mod = importlib.import_module( import_str___ )
        except Exception:
            typee = '_cpython-312'
            import_str___ = import_str + typee
            inmp_mod = importlib.import_module( import_str___ )
    return inmp_mod


def inmporting_modules( import_str ):
    if '.' in import_str:
        imported = with_package( import_str )
    else:
        imported = only_modules( import_str )
    return imported


