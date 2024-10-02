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
reload(im )
de = im.importing_modules( 'definitions' )
hlp = im.importing_modules(  'helper' )
hlp_perf = im.importing_modules(  'perforce_conn.hlp_perf' )
hlp_goo = im.importing_modules(  'google_conn.hlp_goo' )

sys.path.append( de.PY_PACKAGES)
import yaml as yaml
import shutil

def load_anim_check_vars( QMessageBox, app ):
    """instancing anim check tool vars.
    """
    dicc = hlp.json2dicc_load( de.TEMP_FOL+de.ANIM_CHECK_TOOL_SETTING )
    if dicc != {}:
        try:
            GOOG_DOC_NA      = str( dicc['docu_na'] )
            SHEET_NA         = str( dicc['sheet_na'] )
        except Exception as err:
            print ( err)
            GOOG_DOC_NA = ''
            SHEET_NA = ''
            QMessageBox.information(app, u'Googlesheet error.', 'PLease, delete: '+de.TEMP_FOL+de.ANIM_CHECK_TOOL_SETTING +"""   
                                    and fill settings again
                                    """)
        DEPOT_ANIM_ROOT  = str( dicc['depot_a_root'] )
        UNREAL_ANIM_ROOT = str( dicc['unreal_a_root'] )
    else:
        GOOG_DOC_NA = 'None'
        SHEET_NA = 'None'
        DEPOT_ANIM_ROOT = 'None'
        UNREAL_ANIM_ROOT = 'None'
    return GOOG_DOC_NA , SHEET_NA , DEPOT_ANIM_ROOT, UNREAL_ANIM_ROOT

def load_root_vars():
    """instancing roots vars for path building.
    """    
    dicc = hlp.json2dicc_load( de.TEMP_FOL+de.ROOTS_METAD_FI_NA )
    if dicc != {}:
        LOCAL_ROOT = str( dicc['local_root'] )
        DEPOT_ROOT = str( dicc['depot_root'] )
    else:
        LOCAL_ROOT = 'None'
        DEPOT_ROOT = 'None'
    return  LOCAL_ROOT , DEPOT_ROOT 


def solve_path( root_state, key_path, local_root,
                depot_root, git_root, proj_settings , dicc_ = {}):
    """Retrun local desire path or depot path depending is_local value.
    Args:
        root_state (str): ['local', 'depot', 'git']
        asset_na ([str]): [asset name]
        key_path ([str]): [dicc key built in __settintgs__]
    Returns:
        [str]: [dep path or local path depending is_local value]
    """
    if proj_settings['Paths'][ key_path ].format( **dicc_) != '': 
        if root_state == 'local':
            return local_root + proj_settings['Paths'][key_path].format(**dicc_)
        elif root_state == 'depot':
            depot_path = depot_root + proj_settings['Paths'][key_path].format(**dicc_)
            depot_path = fix_perf_mapped_root_path( depot_path , proj_settings )
            return depot_path
        elif root_state == 'git':
            return git_root + proj_settings['Paths'][key_path].format(**dicc_)
    else:
        return ''


def go_2_perf_root_path( path, proj_settings ,depot_root ,local_root):
    real_dp_fol_root = proj_settings['KEYW']['real_depot_fol_root']
    mapped_dp_fol_root = proj_settings['KEYW']['maped_depot_fol_root']
    #local_fol_root = proj_settings['KEYW']['local_fol_root']
    if real_dp_fol_root != '':
        new_root = depot_root.split( '/'+real_dp_fol_root )[0]
    else:
        new_root = depot_root
    path_ = new_root + path
    return path_


def go_2_local_root_path( path, proj_settings ,local_root ,depot_root ):
    mapped_dp_fol_root = proj_settings['KEYW']['maped_depot_fol_root']
    real_dp_fol_root = proj_settings['KEYW']['real_depot_fol_root']
    local_fol_root = proj_settings['KEYW']['local_fol_root']
    if mapped_dp_fol_root != '': 
        if '/'+mapped_dp_fol_root+'/' in path:
            path_ = local_root + path.split('/'+mapped_dp_fol_root+'/')[-1]
    elif real_dp_fol_root != '': 
        if '/'+real_dp_fol_root+'/' in path:
            path_ = local_root + path.split('/'+real_dp_fol_root+'/')[-1]
    elif real_dp_fol_root == '' and mapped_dp_fol_root == '':
        path_ = local_root +  '/'   + path.split( depot_root+'/' )[-1]
    return path_

def fix_perf_mapped_root_path( deppath, proj_settings ):
    real_dp_fol_root = proj_settings['KEYW']['real_depot_fol_root']
    mapped_dp_fol_root = proj_settings['KEYW']['maped_depot_fol_root']
    local_fol_root = proj_settings['KEYW']['local_fol_root']
    if '' == mapped_dp_fol_root:
        depot_part = '/'
    else:
        depot_part = '/'+mapped_dp_fol_root+'/'
    if '' == local_fol_root:
        local_part = '/'
    else:
        local_part = '/'+local_fol_root+'/'
    if depot_part != '/' and local_part != '/':
        path_ = deppath.replace(    real_dp_fol_root+'/'+local_fol_root     ,   mapped_dp_fol_root    )
    elif depot_part == '/' and local_part != '/':
        path_ = '/'+local_fol_root+ deppath
    elif depot_part != '/' and local_part == '/':
        path_ =  '/'+local_fol_root + deppath.split( depot_part )[-1]
    elif depot_part == '/' and local_part == '/':
        path_ =   deppath
    return path_

def transform_given_path( path, way_key , proj_settings , local_root , depot_root ):
    if way_key == 'local':
        path = go_2_local_root_path( path, proj_settings ,local_root ,depot_root)
    elif way_key == 'depot':
        path = go_2_perf_root_path( path, proj_settings ,depot_root ,local_root)
    return path

def get_item_na_label(  area , PROJ_SETTINGS ):
    if area.split('_')[-1] in list(    PROJ_SETTINGS['KEYW']['areaAssets'].values()    ):
        item_na = de.asset_na
    elif area  in list(    PROJ_SETTINGS['KEYW']['areaAnim'].values()    ):  
        item_na = de.ani_na
    return item_na
        
def set_logged_data_on_combo( comboB, data2check):
    """Set previus selected item on this particular combobox.
    Args:
        comboB ([qcombobox]): [combobox needed for]
        data2check ([str]): [the text value you wanted to combobox get focus on]
    """
    combo_item_ls = [comboB.itemText(i) for i in range(comboB.count())]
    for idx, item in enumerate ( combo_item_ls ):
        if str(data2check) == str(item):
            comboB.setCurrentIndex(idx)
            break

def copy_local_asset_template(  target_path, source_path, target_name , source_name):
    if not os.path.exists ( target_path ):
        os.makedirs( target_path )
    shutil.copy2( os.path.join( source_path , source_name  ),
                        os.path.join( target_path , target_name ) )
    
def change_reference( PROJ_SETTINGS, template_2_edit , full_file_path_rig_asset, app):
    generic_asset_na = str( PROJ_SETTINGS ['KEYW']['genericChar_na'] )
    areaRig = str( PROJ_SETTINGS ['KEYW']['areaAssets']['rig'] ) 
    itemTypeAss = PROJ_SETTINGS['KEYW']['item_types']['asset']
    char_type = PROJ_SETTINGS ['KEYW']['assets_types']['characters']
    dicc = {  'itemType': itemTypeAss , 'genericChar_na': generic_asset_na,
             'areaAssRig': areaRig , 'taskType' :  char_type , 'areaAss': areaRig }
    generic_rig_full_path = solve_path( 'local', 'RigTemplatePath' , app.LOCAL_ROOT ,  
                                       '', '' , PROJ_SETTINGS , dicc_ = dicc )

    new_asset_name = full_file_path_rig_asset.split( '_'+areaRig  )[0].split('/')[-1]
    generic_path = generic_rig_full_path.split( app.LOCAL_ROOT )[-1]
    char_anim_path = full_file_path_rig_asset.split( app.LOCAL_ROOT )[-1]
    hlp.make_read_writeable( template_2_edit  )
    dicc_pattern_change = {  generic_path : char_anim_path ,  
                           generic_asset_na : new_asset_name }
    
    hlp.change_patther_reading_file( template_2_edit , dicc_pattern_change )
        

def copy_and_submit( app, PROJ_SETTINGS, QMessageBox , perf ,template_full_path , item_area_full_path 
                    , area, item_na  , type , anim_asset_fullpath ):
    if type == de.issue_type_asset:
        source_path , source_name = hlp.separate_path_and_na( template_full_path )
        target_path , target_name = hlp.separate_path_and_na( item_area_full_path )
    elif type == de.issue_type_anim:
        source_path , source_name = hlp.separate_path_and_na( template_full_path )
        target_path , target_name = hlp.separate_path_and_na( item_area_full_path )
        anim_asset_path , anim_asset_fi_name = hlp.separate_path_and_na( anim_asset_fullpath )
        #anim_asset_na = anim_asset_name.split('.')[0]
    if os.path.isfile( os.path.join(  target_path , target_name ) ):
        hlp.make_read_writeable( target_path + target_name  )
    perf_hlp.check_template_exists(  app , QMessageBox , source_path , source_name , perf )
    copy_local_asset_template(  target_path, source_path, target_name , source_name )
    if str( PROJ_SETTINGS ['KEYW']['areaAnim']['anim'] ) == str( area ):
        change_reference(  PROJ_SETTINGS, item_area_full_path , anim_asset_path+anim_asset_fi_name , app )
    perf_hlp.perf_task_submit( app, QMessageBox, perf, item_na, area, target_path+target_name , app.PERF_SERVER,
                     app.PERF_USER, app.PERF_WORKSPACE , app.PERF_PASS )

def set_new_values_on_sheet( app, gs , QMessageBox , area , column_ls , value_ls , row_idx ):
    if area == app.PROJ_SETTINGS ['KEYW']['areaAnim']['anim']:
        sheet_num = app.PROJECT_KEY+'_'+de.issue_type_anim
    else:
        sheet_num = app.PROJECT_KEY+'_'+de.issue_type_asset
    hlp_goo.edit_google_sheet_cell( app, QMessageBox , gs , de.GOOGLE_SHEET_DOC_NA , sheet_num,
                                                column_ls , value_ls , row_idx )
    
def check_forbiden_char( app, full_word_2_analize, QMessageBox):
    key_permission = True
    for char in full_word_2_analize:
        if char in de.FORBIDDEN_CHARS:
            key_permission = False
            QMessageBox.information(app, u'invalid character', "Please don't use characters on this list:\n" + str(de.FORBIDDEN_CHARS) )
            break
    return key_permission
        
def check_created_task( app , QMessageBox , gs, area, item_na ):
    if area == app.PROJ_SETTINGS ['KEYW']['areaAnim']['anim']:
        item_na_colum  = de.GOOGLE_SH_ANI_NA_COL 
        sheet_num = app.PROJECT_KEY+'_'+de.issue_type_anim
    else:
        item_na_colum  = de.GOOGLE_SH_ASS_NA_COL
        sheet_num = app.PROJECT_KEY+'_'+de.issue_type_asset
    item_tracked_ls_diccs = hlp_goo.get_google_doc_data( app, QMessageBox , gs , de.GOOGLE_SHEET_DOC_NA , sheet_num )
    area_done_dicc = {} 
    path_ls = []
    item_created_ls = [ item[ item_na_colum ] for item in item_tracked_ls_diccs ]
    row_idx = len( item_tracked_ls_diccs )
    row_idx_crea_templa = len( item_tracked_ls_diccs )
    key_permission = check_forbiden_char( app, item_na , QMessageBox )
    if key_permission:
        if item_na in item_created_ls:
            for idx, item in enumerate ( item_tracked_ls_diccs ):
                if item[ item_na_colum ] == item_na:
                    area_done_dicc = ast.literal_eval( item[ de.GOOGLE_SH_CREAT_AREA_COL ] )
                    if item[ de.GOOGLE_SH_CREAT_PATH ] != u'':
                        path_ls = ast.literal_eval( item[ de.GOOGLE_SH_CREAT_PATH ] )
                    if area in str(area_done_dicc):
                        key_permission = False
                        row_idx_crea_templa = idx
                        break
                    else:
                        row_idx = idx
                        row_idx_crea_templa = idx
                        break
    return key_permission , area_done_dicc, row_idx , path_ls, row_idx_crea_templa

def item_path_builder( app, item_na , area , anim_asset  , assetType , *arg ):
    projsett = app.PROJ_SETTINGS
    localr = app.LOCAL_ROOT
    itemTypeAss = projsett['KEYW']['item_types']['asset']
    genericChar_na = projsett['KEYW']['genericChar_na']
    dicc = { 'ass_na' : item_na , 'taskType' : area ,'itemType': itemTypeAss ,
            'genericChar_na': genericChar_na }
    animed_char_fullpath = ''
    if str( projsett ['KEYW']['areaAssets']['rig'] ) == str( assetType ):
        type = de.issue_type_asset
        if area == projsett ['KEYW']['assets_types']['characters']:
            dicc['areaAssRig'] = projsett ['KEYW']['areaAssets']['rig']
            dicc['areaAss'] = assetType
            template_full_path = solve_path( 'local', 'RigTemplatePath' , localr,  '', '' ,  projsett, dicc_ = dicc )
        item_area_full_path = solve_path( 'local' , 'Rig_Ass_Path' , localr ,  '', '' ,  projsett, dicc_ = dicc)
        item_depot_path = solve_path( 'depot' , 'Rig_Ass_Path' , localr ,  app.DEPOT_ROOT, '' ,  projsett, dicc_ = dicc)

    elif str( projsett ['KEYW']['areaAssets']['mod'] ) == str( assetType ):
        type = de.issue_type_asset
        dicc['areaAssMod'] = projsett ['KEYW']['areaAssets']['mod']
        template_full_path = solve_path( 'local', 'ModTemplatePath' , localr,  '', '' ,  projsett , dicc_ = dicc )
        item_area_full_path = solve_path( 'local' , 'Mod_Ass_Path' , localr ,  '', '' ,  projsett, dicc_ = dicc )
        item_depot_path = solve_path( 'depot' , 'Mod_Ass_Path' , localr ,  app.DEPOT_ROOT, '' ,  projsett, dicc_ = dicc )

    elif str( projsett ['KEYW']['areaAnim']['anim'] ) == str( assetType ):
        type = de.issue_type_anim
        character = projsett ['KEYW']['assets_types']['characters']
        itemTypeAni = projsett['KEYW']['item_types']['anim']
        areaAni = projsett['KEYW']['areaAnim']['anim']
        rig = projsett ['KEYW']['areaAssets']['rig']
        dicc = { 'ass_na' : anim_asset , 'taskType' : character ,
                 'itemType': itemTypeAni , 'areaAssRig' : rig , 'taskType': area}
        animed_char_fullpath = solve_path( 'local', 'Rig_Ass_Path' , localr ,  '', '' ,  projsett , dicc_ = dicc)
        template_full_path = solve_path( 'local', 'Anim_Template' , localr ,  '', '' ,  projsett , dicc_ = dicc )
        dicc = { 'taskType' : area, 'itemType': itemTypeAni}
        item_area_full_path = solve_path( 'local' , 'Anim_Root' , localr ,  '', '' ,  projsett , dicc_ = dicc)
        item_depot_path = solve_path( 'depot' , 'Anim_Root' , localr ,  app.DEPOT_ROOT, '' ,  projsett , dicc_ = dicc)
    return type, animed_char_fullpath, template_full_path, item_area_full_path, item_depot_path

def get_area_path_from_path_ls (path_ls, area):
    if len(path_ls) == 1 :
        path = path_ls[0]
    elif len(path_ls) > 1 :
        for p in path_ls:
            if area in p:
                path = p
    elif len(path_ls) == 0 :
        path = ''
    return path

def define_main_item_vars( app, area , anim_asset, item_na , area_done_dicc  , path_ls , itemType):
    type, anim_ass_fullpath, templ_full_path, item_area_full_path , item_depot_path = item_path_builder( app, 
                                                                         item_na , area , ''  , itemType ) #
    if area == app.PROJ_SETTINGS ['KEYW']['areaAnim']['anim']:
        item_na_prefix = de.ani_na
        item_depot_path = get_area_path_from_path_ls ( path_ls, area )
        if item_depot_path != '':
            label_ls = [ de.area+'_'+area  , item_na_prefix + '_' + item_na , de.item_path+'_'+item_depot_path , de.anim_char+'_'+anim_asset] 
        else:
            label_ls = [ de.area+'_'+area  , item_na_prefix + '_' + item_na  ,  de.anim_char+'_'+anim_asset] 
        goo_colum = [ de.GOOGLE_SH_ANI_NA_COL , de.GOOGLE_SH_CREAT_AREA_COL , de.GOOGLE_SH_CREAT_PATH  , de.GOOGLE_SH_ANIM_ASSET_COL ]
        value_ls =   [         item_na        ,           str(area_done_dicc)     ,          str(path_ls)        ,        anim_asset           ]
    else:
        if item_depot_path not in path_ls:
            path_ls.append( item_depot_path )
        item_na_prefix = de.asset_na
        label_ls = [ de.area+'_'+area  , item_na_prefix + '_' + item_na  , de.item_path+'_'+item_depot_path ] 
        goo_colum  = [ de.GOOGLE_SH_ASS_NA_COL ,  de.GOOGLE_SH_CREAT_AREA_COL ,  de.GOOGLE_SH_CREAT_PATH        ]
        value_ls =   [         item_na         ,        str(area_done_dicc)        ,          str(path_ls)               ]
    return label_ls , goo_colum , value_ls


def asset_type_extraction( path , proj_sett ):
    assets_types_ls = list( proj_sett['KEYW']['assets_types'].values() )
    for type in assets_types_ls:
        if '/' + type + '/' in path:
            return type

def area_asset_extraction( path , proj_sett ):
    area_assets_ls = list( proj_sett['KEYW']['areaAssets'].values() )
    for areaass in area_assets_ls:
        if '/' + areaass + '/' in path:
            return areaass


def item_type_extraction( path , proj_sett ):
    item_types_ls = list( proj_sett['KEYW']['item_types'].values() )
    for type in item_types_ls:
        if '/' + type + '/' in path:
            return type
        
def get_path_from_task_ls(name, as_ani_type, task_ls_dicc):
    for task in task_ls_dicc:
        try:
            task_na = task[de.asset_na]
            task_type = task[de.taskType] 
        except Exception:
            task_na = task[de.ani_na]
            task_type = task[de.taskType] 
        if task_na == name :
            if task_type == as_ani_type :
                return task[de.item_path]
            
def line_4_snipping( thumb_full_path , h , w , bucle_fil_na):
    line =        "app = QApplication(sys.argv)\n"
    line = line + "windSnip = st.MyWidget( '%s' )\n" %thumb_full_path
    line = line + "windSnip.show()\n"
    line = line + "sys.exit(app.exec())\n"

    nircmdPath = de.PY3_PACKAGES +'\\nircmd\\'
    nircmdFilePath = '%snircmd.exe' %(nircmdPath)
    path =   thumb_full_path.replace('/','\\') 
    #linesBat =             '"%s" cmdwait 1500 savescreenshotwin "%s"   beep 1600 500 \n' %( nircmdFilePath, path )
    linesBat =   'type NUL > "%s%s"\n'%(de.PY_PATH+'\\', bucle_fil_na)
    linesBat =  linesBat +'"%sffmpeg" -y -i "%s" ' %( nircmdPath, path )
    linesBat =  linesBat + ' -vf scale=%s:%s "%s" \n' %( str(w) , str(h) , path )
    linesBat = linesBat + 'del "%s%s"\n'%(de.PY_PATH+'\\', bucle_fil_na)
    return line, linesBat

#def execute_bat():

def snipping_tool_launch( line, if_result, result_fi_na ):#
    """.
    Args:
        line ([str]): [code line to insert on script]
        if_result ([Bool]): [if is able a return ending lines]
        result_fi_na ([str]): [name of file saved with the return result]
    Returns:
        [str]: [python script command content formated]
    """
    file_content =                   'import sys\n'
    file_content = file_content +    'sys.path.append( r"{path}" )\n'.format( path = de.SCRIPT_MANAG_FOL )
    file_content = file_content +    'from subprocess import call\n'
    file_content = file_content +    hlp.ADDITIONAL_LINE_PY3
    #file_content = file_content +    'reload(de)\n'
    file_content = file_content +    'sys.path.append( r"%s" )\n'%de.PY3_PACKAGES
    file_content = file_content +    'from PySide6.QtWidgets import *\n'
    file_content = file_content +    'import importing_modules as im\n'
    file_content = file_content +    'st = im.importing_modules( "manager_tools.snipping_tool" )\n'
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
