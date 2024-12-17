
""" use the bellow code with hashtag for running manager
"""

import sys
import webbrowser
import os
import time
from threading import Thread
import subprocess
si = subprocess.STARTUPINFO()
try:
    from PySide2.QtUiTools import QUiLoader
    from PySide2 import QtCore
    from PySide2.QtGui import *
    from PySide2.QtWidgets import *
except Exception:
    from PySide6.QtUiTools import QUiLoader
    from PySide6 import QtCore
    from PySide6.QtGui import *
    from PySide6.QtWidgets import *
    import sys
    import ctypes
    from ctypes.wintypes import MAX_PATH
    dll = ctypes.windll.shell32
    buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
    if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
        USER_DOC = buf.value
    SCRIPT_FOL = USER_DOC + "\\company_tools\\jira_manager"
    sys.path.append(SCRIPT_FOL)
from importlib import reload
import importing_modules as  im
reload(im )
de = im.importing_modules( 'definitions' )
gs = im.importing_modules( 'google_conn.google_sheet_request' )
jq = im.importing_modules(  'jira_conn.jira_queries' )
hlp = im.importing_modules(  'helper' )
hlp_ji = im.importing_modules(  'jira_conn.hlp_jira' )
hlp_perf = im.importing_modules(  'perforce_conn.hlp_perf' )
hlp_manager = im.importing_modules( 'manager_tools.hlp_manager' )
pr = im.importing_modules( 'perforce_conn.perforce_requests' )
ev = im.importing_modules( 'enviroment' )
comm = im.importing_modules( 'manager_tools.comments_app' )
task = im.importing_modules( 'manager_tools.task_creation_panel' )


class getThumbnClass(QLabel):
    def __init__(self, parent=None, path=None, size=(0,0)):
        """Qlabel class for asume as thumbnail
        Args:
            parent ([q object], optional): [q object for been parented]. Defaults to None.
            path ([str], optional): [thumbnail path]. Defaults to None.
            size (touple, optional): [touple with height and width values]. Defaults to (0,0).
        """
        super(getThumbnClass, self).__init__(parent)
        pic = QPixmap( path ).scaled(QtCore.QSize(size[0],size[1]), QtCore.Qt.KeepAspectRatio)
        self.setPixmap(pic)


class table_features( ):#QWidget ):
    """All Table functionality
    """
    def __init__( self ,  table_assetsTasks , table_animTasks ,  main_widg = None ):
        self.jira_m = jq.JiraQueries()
        self.USER , self.APIKEY, self.PROJECT_KEY, self.JI_SERVER  = hlp_ji.load_jira_vars()
        self.PERF_USER ,self.PERF_SERVER , self.PERF_WORKSPACE, self.PERF_PASS = hlp_perf.load_perf_vars()
        self.LOCAL_ROOT, self.DEPOT_ROOT = hlp_manager.load_root_vars()
        self.PROJ_SETTINGS = hlp.get_yaml_fil_data( de.SCRIPT_MANAG_FOL +'\\projects_settings\\' + self.PROJECT_KEY + de.SETTINGS_SUFIX )
        self.main_widg = main_widg
        self.table_assetsTasks = table_assetsTasks
        self.table_animTasks = table_animTasks
        self.dicc_menu_ani_func = self.generate_menu_dicc( de.ani_na )
        self.dicc_menu_ass_func = self.generate_menu_dicc( de.asset_na )
    

    def thumb_local_path_item( self , task, HEADER_LS ):
        if HEADER_LS [de.ITEM_NA_IDX ] == de.asset_na:
            asset_type = hlp_manager.asset_type_extraction ( task [ de.item_path ] , self.PROJ_SETTINGS )
            item_type = hlp_manager.item_type_extraction ( task [ de.item_path ] , self.PROJ_SETTINGS )
            dicc = { 'ass_na' : task[ de.asset_na ], 'taskType': asset_type  , 'itemType': item_type }
            item_thumb_path = hlp_manager.solve_path( 'local', 'Ass_Thumb_Path' , self.LOCAL_ROOT , 
                                        self.DEPOT_ROOT, '' ,  self.PROJ_SETTINGS , dicc_ = dicc )
        elif HEADER_LS [de.ITEM_NA_IDX ] == de.ani_na:
            local_full_path, depot_full_path = self.get_anim_path(  task[ de.ani_na ], self.tasks_ls_ani_diccs )
            item_path , item_file = hlp.separate_path_and_na( local_full_path )
            thumb_sufix = self.PROJ_SETTINGS['KEYW']['item_thumbn_sufix']
            item_thumb_path = item_path + task[ de.ani_na ] + thumb_sufix
        return item_thumb_path

    def  populate_table(self, table, area_ls, HEADER_LS ):
        """populate qtable with values.
        Args:
            table ([qtablewid]): [description]
        """
        self.USER , self.APIKEY, self.PROJECT_KEY, self.JI_SERVER = hlp_ji.load_jira_vars()
        self.PERF_USER ,self.PERF_SERVER , self.PERF_WORKSPACE, self.PERF_PASS = hlp_perf.load_perf_vars()
        self.LOCAL_ROOT, self.DEPOT_ROOT = hlp_manager.load_root_vars()
        self.PROJ_SETTINGS = hlp.get_yaml_fil_data( de.SCRIPT_MANAG_FOL +'\\projects_settings\\' + self.PROJECT_KEY + de.SETTINGS_SUFIX )
        table.clear()
        tasks_ls_diccs = hlp_ji.get_self_tasks( self, QMessageBox , area_ls )
        if self.PROJ_SETTINGS['KEYW']['areaAnim']['anim'] in area_ls:
            self.tasks_ls_ani_diccs = tasks_ls_diccs
        elif self.PROJ_SETTINGS['KEYW']['areaAssets']['rig'] in area_ls:
            self.tasks_ls_ass_diccs = tasks_ls_diccs
        for i, header in enumerate ( HEADER_LS ):
            locals()["item"+ str(i)] = QTableWidgetItem(header)
            locals()["item"+ str(i)].setBackground(QColor(180, 75, 65))
            table.setHorizontalHeaderItem( i,locals()["item"+ str(i)] )
        table.setColumnWidth( de.THUMB_IDX , de.width_as_thum )
        id_rows = self.populate_loop( table ,tasks_ls_diccs ,HEADER_LS )
        return id_rows

    def populate_loop( self, table ,tasks_ls_diccs ,HEADER_LS ):
        id_rows = {}
        for i, task in enumerate( tasks_ls_diccs ):
            per_row_ls = []
            table.setRowHeight(i, de.height_as_thum )
            per_row_ls.append(  task['Id'] )
            item_thumb_path = self.thumb_local_path_item(  task, HEADER_LS )
            thumbMediaPath, thumb_fi_na = hlp.separate_path_and_na( item_thumb_path )
            if os.path.exists(thumbMediaPath+thumb_fi_na):
                label_thumb = getThumbnClass( None,  thumbMediaPath+thumb_fi_na,  ( de.width_as_thum , de.height_as_thum )   )
                table.setCellWidget( i , de.THUMB_IDX, label_thumb )
            for idx, column in enumerate ( HEADER_LS ):
                try:
                    item = self.create_table_item( table , str( task[column] ) , idx, i )  
                except Exception as err:
                    item = self.create_table_item( table , '     ' , idx, i ) 
                if idx ==  de.TITLE_IDX:
                    item.setToolTip(str( task[ column ] ))
                elif idx ==  de.ISSUE_LINK_IDX:
                    item = self.create_table_item( table , '     ' , idx, i )  
                    label_link = getThumbnClass( None,  de.LINK_ICON_PATH,  ( de.width_as_thum , de.height_as_thum )   )
                    table.setCellWidget( i , de.ISSUE_LINK_IDX, label_link )
                elif idx ==  de.COMMENT_IDX:
                    item = self.create_table_item( table , '     ' , idx, i ) 
                    label_comment = getThumbnClass( None,  de.COMMENT_ICON_PATH,  ( de.width_as_thum , de.height_as_thum )   )
                    table.setCellWidget( i , de.COMMENT_IDX, label_comment )
                    per_row_ls.append( task[column] )
                elif idx ==  de.AREA_IDX:
                    if task[ de.itemType ] == self.PROJ_SETTINGS['KEYW']['item_types']['asset']:
                        item = self.create_table_item( table , str( task[column] ) + '_'+ task[de.areaAss] , idx, i ) 
                    
                    
                id_rows[ str(i) ]   =   per_row_ls
        if 'asset' in table.objectName():
            self.id_rows_ass = id_rows
        elif 'anim' in table.objectName():
            self.id_rows_ani = id_rows
        return id_rows

    def create_table_item( self, table ,text , idx, i ):
        if text != '':
            final_text = text
        else:
            final_text = '    '
        item = QTableWidgetItem( final_text)
        table.setItem(i ,idx, item)
        item.setTextAlignment(QtCore.Qt.AlignCenter)
        return item

    def generate_menu_dicc( self, signal ):
        """Generate a Dictionary Specifying with menu will be triggered depending column selection.
        """
        if signal == de.asset_na:
            HEADER_LS = de.HEADER_ASS_LS
        elif signal == de.ani_na:
            HEADER_LS = de.HEADER_ANI_LS
        dicc_menu_func = {}
        for header in HEADER_LS:
            if header == de.status:
                dicc_menu_func [header+'_menu_func'] = self.status_menu_func
            elif header == de.thumbnail:
                dicc_menu_func [header+'_menu_func'] = self.thumb_menu_func
            #elif header == de.spec:
            #    dicc_menu_func [header+'_menu_func'] = self.issueLink_menu_func
            elif header == de.asset_na:
                dicc_menu_func [de.asset_na+'_menu_func'] = self.AssetName_na_menu_func
            elif header == de.ani_na:
                dicc_menu_func [de.ani_na+'_menu_func'] = self.AnimName_na_menu_func
        return dicc_menu_func

    def menues_asset_table( self, position ):
        """keep initialize the proper menu function on each column.
        Args:
            position ([qposition]): [not need to set this arg]
        """
        self.menu_initiates(  de.HEADER_ASS_LS, self.table_assetsTasks, self.dicc_menu_ass_func, position )


    def menues_anim_table( self, position ):
        """keep initialize the proper menu function on each column.
        Args:
            position ([qposition]): [not need to set this arg]
        """
        self.menu_initiates(  de.HEADER_ANI_LS, self.table_animTasks, self.dicc_menu_ani_func, position )

    def menu_initiates( self, HEADER_LS, table, dicc_menu_func, position):
        for header in HEADER_LS:
            if header not in [ de.area , de.title , de.spec, de.comments ]:
                if table.horizontalHeaderItem( table.currentColumn()).text() == header:
                    dicc_menu_func[ header + '_menu_func']( table, position )
                
    def initialized_features_table(self, table):
        """initialize table menues and actions.
        """ 
        if 'asset' in table.objectName( ):
            table.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
            table.customContextMenuRequested.connect( self.menues_asset_table )
            table.setEditTriggers( QTableWidget.NoEditTriggers )
        elif 'anim' in table.objectName( ):
            table.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
            table.customContextMenuRequested.connect( self.menues_anim_table )
            table.setEditTriggers( QTableWidget.NoEditTriggers )

    def refresh_tables( self  ):
        """Refresh given tables
        """
        id_rows_dicc_ls = [    self.id_rows_ass ,   self.id_rows_ani    ]
        area_ass_ls = list( self.PROJ_SETTINGS['KEYW']['areaAssets'].values() )
        area_ani_ls = list( self.PROJ_SETTINGS['KEYW']['areaAnim'].values() )
        area_ls_ls = [ area_ass_ls , area_ani_ls ]
        HEADER_LS_ls = [ de.HEADER_ASS_LS, de.HEADER_ANI_LS]
        for idx, table in enumerate([ self.table_assetsTasks, self.table_animTasks ]):
            id_rows_dicc_ls[ idx ] =  self.populate_table( table , area_ls_ls[ idx ] , HEADER_LS_ls[idx] )

    def get_text_item_colum( self, table , colum_idx):
        """Return the text value for t he current row and specified column index of  table.
        Args:
            table ([qtablewidget]): [description]
            colum_idx ([int]): [column headers have internally assigned an index begining the first as 0, etc]
        Returns:
            [type]: [description]
        """
        item_text = table.currentRow()
        item_text = table.item( item_text, colum_idx )
        return str(item_text.text())

    def AssetName_na_menu_func( self , table , position):
        self.item_na_menu_func( table, position , de.asset_na)

    def AnimName_na_menu_func( self , table , position):
        self.item_na_menu_func( table, position , de.ani_na)

    def item_na_menu_func(self, table, position , type):
        """Floatting menu on asset name column.
        Args:
            table ([qtablewidget obj]): []
            position ([qposition]): [not need to set this arg]
        """
        menu_item_na = QMenu()
        item_na = str( table.currentItem().text() )
        area = self.get_text_item_colum(table, de.AREA_IDX)
        exploreAction = menu_item_na.addAction(de.open_fi_fol)
        getFiAction = menu_item_na.addAction( de.dowload_fi_perf )
        actionMenu = menu_item_na.exec_(table.mapToGlobal(position))
        if actionMenu != None:
            if str(actionMenu.text()) == de.open_fi_fol:
                self.explore_char_fol( item_na, area, type)
            elif str(actionMenu.text()) == de.dowload_fi_perf:
                self.get_task_file( item_na, area, type )

    def get_task_file(self, asset_na, area, type ):
        """dowload given asset data file to local
        Args:
            asset_na ([str]): [asset name]
            area ([str]): [could be Rig|Mod|Surf]
        """
        local_full_path, depot_full_path = self.get_asset_path( asset_na, area, type )
        perf = pr.PerforceRequests()
        dicc = perf.pull_file_2_local( depot_full_path, True , self.PERF_SERVER,
                                    self.PERF_USER, self.PERF_WORKSPACE , self.PERF_PASS )
        if dicc[de.key_errors] != '[]':
            QMessageBox.information(self.main_widg, u'Downloading task error', str( dicc[de.key_errors] )  )
            
    def get_asset_path(self, item_na, area, type):
        """return depot and local asset path
        Args:
            asset_na ([str]): [asset name]
            area ([str]): [asset area]
        Returns:
            [tuple]: [return to arg as touple format: local full path and perforce repo full path]
        """
        if type == de.asset_na:
            asset_type = self.get_text_item_colum( self.table_assetsTasks, de.ITEMTYPE_IDX)
            depot_full_path = hlp_manager.get_path_from_task_ls ( item_na, asset_type, self.tasks_ls_ass_diccs )
            local_full_path = hlp_manager.transform_given_path( depot_full_path, 'local' ,
                                                     self.PROJ_SETTINGS , self.LOCAL_ROOT , self.DEPOT_ROOT )
        if type == de.ani_na:
            anim_type = self.get_text_item_colum( self.table_animTasks, de.ITEMTYPE_IDX)
            item_path = hlp_manager.get_path_from_task_ls ( item_na, anim_type, self.tasks_ls_ani_diccs )
            itemt_type = hlp_manager.item_type_extraction ( item_path , self.PROJ_SETTINGS )
            local_full_path, depot_full_path = self.get_anim_path( item_na, self.tasks_ls_ani_diccs )
        return local_full_path, depot_full_path

    def get_anim_path( self, item_na, tasks_ls_ani_diccs ):
        #item_type = hlp_manager.item_type_extraction ( task [ de.item_path ] , self.PROJ_SETTINGS )
        for task in tasks_ls_ani_diccs:
            if item_na == task[ de.ani_na ]:
                depot_full_path = task[ de.item_path ]
                local_full_path = hlp_manager.transform_given_path( depot_full_path, 'local' , self.PROJ_SETTINGS , self.LOCAL_ROOT, self.DEPOT_ROOT )
                break
        return local_full_path, depot_full_path


    def explore_char_fol(self, asset_na, area, type):
        """this function will open the file containing folder
        Args:
            asset_na ([str]): [asset name]
            area ([str]): [asset area]
        """
        local_full_path, depot_full_path = self.get_asset_path( asset_na, area, type )
        path_, fi_na = hlp.separate_path_and_na(local_full_path)
        os.startfile(path_)
    
    def thumb_menu_func(self, table, position ):
        """thumbnail menu generator
        Args:
            table ([qtable]): [qtable widget]
            position ([qposition]): [don t need to be instanced]
        """
        item_na = self.get_text_item_colum( table, de.ITEM_NA_IDX)
        assAni_type = self.get_text_item_colum( table, de.ITEMTYPE_IDX)
        if 'asset' in table.objectName():
            item_path = hlp_manager.get_path_from_task_ls ( item_na, assAni_type, self.tasks_ls_ass_diccs )
            itemt_type = hlp_manager.item_type_extraction ( item_path , self.PROJ_SETTINGS )
            assetType = hlp_manager.asset_type_extraction ( item_path , self.PROJ_SETTINGS )
            dicc = {'ass_na': item_na, 'taskType': assetType, 'itemType' : itemt_type}
            thumbLocalPath, thumb_fi_na = hlp.separate_path_and_na(    hlp_manager.solve_path( 'local', 'Ass_Thumb_Path', self.LOCAL_ROOT, self.DEPOT_ROOT, ''  , self.PROJ_SETTINGS , dicc_ = dicc ))
            thumbDepotPath, thumb_fi_na = hlp.separate_path_and_na(    hlp_manager.solve_path( 'depot', 'Ass_Thumb_Path' , self.LOCAL_ROOT, self.DEPOT_ROOT, ''  , self.PROJ_SETTINGS, dicc_ = dicc ))
        elif 'anim' in table.objectName():
            item_path = hlp_manager.get_path_from_task_ls ( item_na, assAni_type, self.tasks_ls_ani_diccs )
            itemt_type = hlp_manager.item_type_extraction ( item_path , self.PROJ_SETTINGS )
            item_thumb_path = self.thumb_local_path_item(  { de.ani_na : item_na } , de.HEADER_ANI_LS )
            thumbLocalPath, thumb_fi_na = hlp.separate_path_and_na( item_thumb_path )
            thumbDepotPath = hlp_manager.transform_given_path( thumbLocalPath, 'depot' , self.PROJ_SETTINGS , self.LOCAL_ROOT, self.DEPOT_ROOT )
        menu_thumb = QMenu()
        doThumbnailAc1 = menu_thumb.addAction( de.do_thumb, lambda: self.do_row_thumb( thumbLocalPath, thumb_fi_na, table , de.THUMB_IDX ) )
        doThumbnailAc2 = menu_thumb.addAction( de.snip_thumb, lambda: self.do_snip_thumb( thumbLocalPath, thumb_fi_na, table , de.THUMB_IDX ) )
        doThumbnailAc3 = menu_thumb.addAction( de.get_thumb , lambda: self.get_thumb_from_depot( thumbDepotPath , thumb_fi_na , table , de.THUMB_IDX) )
        actionThumb = menu_thumb.exec_(table.mapToGlobal(position))

    def get_thumb_from_depot( self, thumbDepotPath, thumb_fi_na , table , colum_idx ):
        """trigging action to dowload depot thumbnail on local and load it on task
        Args:
            thumbMediaPath ([str]): [path]
            thumb_fi_na ([str]): [file name]
            table ([qtalbe]): [qtable widget]
            colum_idx ([int]): [integer related to the column index]
        """
        local_path = hlp_manager.transform_given_path( thumbDepotPath, 'local' , self.PROJ_SETTINGS, self.LOCAL_ROOT, self.DEPOT_ROOT)
        try:
            os.remove( local_path+thumb_fi_na )
        except Exception:
            pass
        perf = pr.PerforceRequests()
        dicc = perf.pull_file_2_local( thumbDepotPath+thumb_fi_na, True , self.PERF_SERVER,
                                      self.PERF_USER, self.PERF_WORKSPACE , self.PERF_PASS )
        thumb_fi = os.path.join(  local_path, thumb_fi_na)
        if os.path.isfile( thumb_fi ):
            label_thumb = getThumbnClass( None, local_path +thumb_fi_na,   (de.width_as_thum , de.height_as_thum)   )
            table.setCellWidget(table.currentRow(), colum_idx, label_thumb )
        if dicc[de.key_errors] != '[]':
            QMessageBox.information(self.main_widg, u'Dowloading humbnail error.', str( dicc[de.key_errors] )  )



    def do_row_thumb ( self, thumbLocalPath, thumb_fi_na, table , colum_idx ):
        """Creates thumbnail, applies this thumbnail to the task, and submits it to perforce depot
        Args:
            thumbMediaPath ([str]): [thumb path]
            thumb_fi_na ([str]): [thumb file name]
            table ([qtalbe]): [qtable widget]
            colum_idx ([int]): [integer related to the column index]
        """
        try:
            if ev.current_scene().startswith( thumbLocalPath ):
                if os.path.exists(thumbLocalPath):
                    perf = pr.PerforceRequests()
                    try:
                        perf.checkout_file( thumbLocalPath+thumb_fi_na , self.PERF_SERVER,
                                           self.PERF_USER, self.PERF_WORKSPACE , self.PERF_PASS )
                        hlp.make_read_writeable( thumbLocalPath+thumb_fi_na )
                        os.remove( thumbLocalPath+thumb_fi_na )
                    except Exception as er:
                        print(er)
                    ev.com.thumbnail_cmd( de.height_as_thum, de.width_as_thum, thumbLocalPath, thumb_fi_na)
                    label_thumb = getThumbnClass( None, thumbLocalPath+thumb_fi_na,  (de.width_as_thum , de.height_as_thum)   )
                    table.setCellWidget(table.currentRow(), colum_idx, label_thumb )
                    comment='new thumbnail created'
                    dicc = perf.add_and_submit( thumbLocalPath+thumb_fi_na, comment , self.PERF_SERVER,
                                               self.PERF_USER, self.PERF_WORKSPACE , self.PERF_PASS )
                    if dicc[de.key_errors] != '[]':
                        QMessageBox.information(self.main_widg, u' ', str(dicc[de.key_errors]))
                else:
                    QMessageBox.information(self.main_widg, u' ', " Check if you have localized this task ")
            else:
                QMessageBox.information(self.main_widg, u' ', " Check if current Scene is matching with selected task ")
        except AttributeError: 
            QMessageBox.information(self.main_widg, u' ',  " No Scene Opened ")

    def thumbnail_snip_cmd( self, thumbLocalPath, thumb_fi_na, h , w , bucle_fi_na) :
        
        line, lineBat = hlp_manager.line_4_snipping( thumbLocalPath + thumb_fi_na , h , w , bucle_fi_na)
        file_content = hlp_manager.snipping_tool_launch( line , True, 'snipping_featue.json' )
        hlp.create_python_file ( 'snipping_featue', file_content )
        hlp.run_py_stand_alone( 'snipping_featue', with_console = False , extraLine= lineBat)
        #while not os.path.isfile ( thumbLocalPath + thumb_fi_na ):
        #    time.sleep(0.1)

    def do_snip_thumb( self, thumbLocalPath, thumb_fi_na, table , THUMB_IDX ) :
        """Creates thumbnail sniping tool sourcing screen images
        Args:
            thumbMediaPath ([str]): [thumb path]
            thumb_fi_na ([str]): [thumb file name]
            table ([qtalbe]): [qtable widget]
            colum_idx ([int]): [integer related to the column index]
        """
        perf = pr.PerforceRequests()
        try:
            perf.checkout_file( thumbLocalPath+thumb_fi_na , self.PERF_SERVER,
                               self.PERF_USER, self.PERF_WORKSPACE , self.PERF_PASS )
            hlp.make_read_writeable( thumbLocalPath+thumb_fi_na )
            os.remove( thumbLocalPath+thumb_fi_na )
        except Exception as er:
            print(er)
        bucle_fi_na = 'EmptyFile.txt'
        full_path_bucle_fi = os.path.join (de.PY_PATH.replace('\\','/'),bucle_fi_na)
        self.thumbnail_snip_cmd( thumbLocalPath, thumb_fi_na, de.height_as_thum, de.width_as_thum , bucle_fi_na)
        time.sleep(0.1)
        while os.path.isfile ( full_path_bucle_fi ):
            time.sleep(0.1)
        label_thumb = getThumbnClass( None, thumbLocalPath+thumb_fi_na,  (de.width_as_thum , de.height_as_thum)   )
        table.setCellWidget(table.currentRow(), THUMB_IDX, label_thumb )
        comment='new thumbnail created'
        full_path = os.path.join (thumbLocalPath, thumb_fi_na)
        dicc = perf.add_and_submit( full_path, comment , self.PERF_SERVER,
                                   self.PERF_USER, self.PERF_WORKSPACE , self.PERF_PASS )
        if dicc[de.key_errors] != '[]':
            QMessageBox.information(self.main_widg, u' ', str(dicc[de.key_errors]))

    def status_menu_func(self, table, position):
        """Menu on Status column witch change jira issue status.
        Args:
            table ([qtablewidget]): [needed table]
            position ([qposition]): [not instantiable var]
        """
        row = table.currentRow()
        if 'asset' in table.objectName( ):
            id_rows = self.id_rows_ass
        elif 'anim' in table.objectName( ):
            id_rows = self.id_rows_ani
        issue_key = id_rows[str(row)][ 0 ]
        dicc = self.jira_m.get_all_statuses_types( self.USER , de.JI_SERVER , self.APIKEY , issue_key )
        if dicc[ de.key_errors ] != '[]':
            QMessageBox.information(self.main_widg, u'Getting status types error.', str( dicc[de.key_errors] )  )
        menu_status = QMenu()
        self.dicc_status_trans_ls = dicc[de.ls_ji_result]["transitions"]
        # {    "id" : "int_str"   ,   "name" : "str"    }
        for status in self.dicc_status_trans_ls:
            statusAction = menu_status.addAction( str ( status["name"] ) )
        actionStatus = menu_status.exec_(table.mapToGlobal(position))
        if actionStatus != None:
            status_na = actionStatus.text()
            for dicc in self.dicc_status_trans_ls:
                if status_na == dicc[ "name" ]:
                    status_transit_id = dicc[ "id" ]
            dicc = self.jira_m.change_issue_status( issue_key, self.USER, de.JI_SERVER, self.APIKEY, status_transit_id )
            if dicc[ de.key_errors ] != '[]':
                QMessageBox.information(self.main_widg, u'Changing status error.', str( dicc[de.key_errors] )  )
            if dicc [de.ls_ji_result ] != []:
                item = QTableWidgetItem( status_na )
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                table.setItem( row ,de.STATUS_IDX, item )
    
    def issueLink_menu_func(self, table, position):
        """Menu on Spec column witch browse you to the jira issue link.
        Args:
            table ([qtablewidget]): [needed table]
            position ([qposition]): [not instantiable var]
        """
        link = table.currentItem().text()
        menu_link = QMenu()
        linkAction = menu_link.addAction('open issue link')
        actionLink = menu_link.exec_(table.mapToGlobal(position))
        if actionLink != None:
            if actionLink.text() == "open issue link":
                webbrowser.open(link, new=2) 


class MyMainWindow(QMainWindow):
    def __init__(self, loader = None ):
        super(MyMainWindow, self).__init__( )
        if loader == None:
            loader = QUiLoader()
        
        uifile = QtCore.QFile( r''+de.SCRIPT_MANAG_FOL.replace('\\','/') +'/manager_tools/' + de.MANAGE_PROD_UI)
        uifile.open(QtCore.QFile.ReadOnly)
        self.ui = loader.load( uifile, ev.getWindow(QWidget) )
        self.initialize_widget_conn()

    def initialize_widget_conn(self):
        """Initializing functions, var and features.
        """
        #self.get_master_creds()
        self.jira_m = jq.JiraQueries()
        self.USER , self.APIKEY, self.PROJECT_KEY , self.JI_SERVER = hlp_ji.load_jira_vars()
        self.PERF_USER ,self.PERF_SERVER , self.PERF_WORKSPACE , self.PERF_PASS = hlp_perf.load_perf_vars()
        self.LOCAL_ROOT, self.DEPOT_ROOT = hlp_manager.load_root_vars()
        self.load_project_combo()
        hlp_manager.set_logged_data_on_combo( self.ui.comboB_projects, self.PROJECT_KEY)
        self.set_roots()
        self.PROJ_SETTINGS = hlp.get_yaml_fil_data( de.SCRIPT_MANAG_FOL +'\\projects_settings\\' + self.PROJECT_KEY + de.SETTINGS_SUFIX )
        self.ui.comboB_projects.currentIndexChanged.connect(lambda: self.jira_combo_change_ac(1))
        self.ui.lab_jiraServer.setText( self.JI_SERVER )
        self.ui.lineEd_jira_user.setText( self.USER )
        self.ui.lineEd_apiKey.setEchoMode( QLineEdit.Password )
        self.ui.lineEd_apiKey.setText( self.APIKEY )
        self.ui.pushBut_set_jira_login.clicked.connect( lambda: self.jira_login_action() )

        self.ui.pushBut_login_perf.clicked.connect(lambda: self.perf_combo_change_ac(1))
        self.ui.lineEd_perforce_server.setText( self.PERF_SERVER )
        self.ui.lineEd_perforce_user.setText( self.PERF_USER )
        self.ui.lineEd_perf_worksp.setText( self.PERF_WORKSPACE  )
        self.ui.lineEd_perforce_pass.setEchoMode( QLineEdit.Password )
        self.ui.lineEd_perforce_pass.setText( self.PERF_PASS  )
        self.t_fea = table_features( self.ui.table_assetsTasks , self.ui.table_animTasks , main_widg = self )


        if self.PROJ_SETTINGS != None:
            diccAni =  self.PROJ_SETTINGS['KEYW']['areaAnim'] 
            diccAss =   self.PROJ_SETTINGS['KEYW']['areaAssets'] 
            assetsAreaLs = list(diccAss.values())
            animAreaLs = list(diccAni.values())
            self.id_rows_ass = self.t_fea.populate_table( self.ui.table_assetsTasks, assetsAreaLs  , de.HEADER_ASS_LS)
            self.id_rows_ani = self.t_fea.populate_table( self.ui.table_animTasks, animAreaLs  , de.HEADER_ANI_LS )
            area_ani_ls = list(diccAni.values())
            area_ass_ls = list(diccAss.values())
            self.t_fea.initialized_features_table(self.ui.table_assetsTasks)
            self.t_fea.initialized_features_table(self.ui.table_animTasks)
            self.ui.table_animTasks.itemClicked.connect( lambda: self.tableOnClicItemAction( self.ui.table_animTasks , self.id_rows_ani  , area_ani_ls  )    )
            self.ui.table_assetsTasks.itemClicked.connect( lambda: self.tableOnClicItemAction( self.ui.table_assetsTasks , self.id_rows_ass , area_ass_ls  )  )
        else:
            area_ani_ls = []
            area_ass_ls = []
            self.id_rows_ass = {}
            self.id_rows_ani = {}
        self.run_menues( )

        self.ui.pushBut_reload_tables.clicked.connect( lambda: self.t_fea.refresh_tables( )  )

    def run_menues( self ):
        self.menu_help()
        self.menu_pipeline_tools( )
        
    def menu_help(self):
        help_dicc = hlp.get_yaml_fil_data( de.SCRIPT_MANAG_FOL +'\\'+ de.HELP_YAML_NA )
        self.dicc_menu = help_dicc['HELP_MENU']
        action_ls = []
        for idx, key in enumerate ( self.dicc_menu ):
            link = self.dicc_menu[ key ]
            self.key_value = key
            action = QAction( key , self.ui  )
            action_ls.append( ( action , link ))
            self.ui.menu_Help.addAction(   action   )
            receiver = lambda link=link : self.get_help_link( link  ) 
            self.ui.connect( action,   QtCore.SIGNAL('triggered()') , receiver)
            
    def get_help_link( self, link  ):
        """Browse help
        """
        webbrowser.open( link , new=2) 

    def menu_pipeline_tools( self):
        action = QAction( de.TASK_CREATION_TOOL , self.ui  )
        self.ui.menuPipeline_Tools.addAction(  action )#, triggered = self.launch_task_creation_panel )
        receiver = lambda: self.launch_task_creation_panel() 
        self.ui.connect( action,   QtCore.SIGNAL('triggered()') , receiver)
        
        action2 = QAction( de.TASK_TRACKER_SHEET , self.ui  )
        self.ui.menuPipeline_Tools.addAction(  action2 )#, triggered = self.launch_task_creation_panel )
        receiver = lambda: self.get_help_link( de.GOOGLE_SH_TASK_TRACKER  )
        self.ui.connect( action2,   QtCore.SIGNAL('triggered()') , receiver)

    def launch_task_creation_panel( self ):
        loader = QUiLoader()
        widget = task.TaskCreationPanel( loader = loader, parent = self.ui ,launched_by = 'manager')
        widget.ui.show()   

    def tableOnClicItemAction( self ,table, id_rows ,area_ls):
        column_idx = table.currentColumn()
        row_idx = table.currentRow()
        item_na = self.t_fea.get_text_item_colum(table, de.ITEM_NA_IDX)
        area = self.t_fea.get_text_item_colum(table, de.AREA_IDX)
        if column_idx ==  de.ISSUE_LINK_IDX :
            link = de.JI_SERVER +'/browse/'+ id_rows[str(row_idx)][0]
            webbrowser.open(link, new=2)
        elif column_idx == de.COMMENT_IDX :
            widget = comm.CommentsApp( mainApp = self.ui, issue_key = id_rows[str(row_idx)][0]  , dicc_comment_ls = id_rows[str(row_idx)][1]   ,
                                        area_ls = area_ls  , item_na = item_na ,  area = area)
            widget.ui.show()

            
    def load_project_combo(self):
        """populate projects combob.
        """
        self.ui.comboB_projects.clear()
        dicc = self.jira_m.get_projects( de.JI_SERVER , self.USER , self.APIKEY )
        if dicc[ de.key_errors ] != '[]':
            QMessageBox.information(self, u'Loading projects error.', str( dicc[de.key_errors] )  )
        for proj in ['None'] + dicc[ de.ls_ji_result ]:
            self.ui.comboB_projects.addItem(str(proj))

    def set_roots(self):
        """instancing local root and depot root related with the choosen workspace.
        """
        self.set_worksp_ls()
        dicc = {}
        for proj in self.worksp_ls:
            try:
                if str(proj['client']) == self.PERF_WORKSPACE:
                    self.LOCAL_ROOT = str(proj['Root']).replace('\\','/')
                    dicc['local_root'] = self.LOCAL_ROOT
                    self.DEPOT_ROOT = str(proj['Stream']).replace('\\','/')
                    dicc['depot_root'] = self.DEPOT_ROOT
                    break
            except Exception as err:
                print ( err)
                print ('try warning')
        hlp.metadata_dicc2json( de.TEMP_FOL+de.ROOTS_METAD_FI_NA , dicc)


    def set_worksp_ls(self):
        """get all workspaces data
        """
        perf = pr.PerforceRequests()
        if self.PERF_USER != 'None' and self.PERF_USER != '':
            dicc = perf.workspaces_ls( True , self.PERF_SERVER, self.PERF_USER,
                                      self.PERF_WORKSPACE, self.PERF_PASS )
            if dicc[de.key_errors] == '[]':
                self.worksp_ls = dicc[de.ls_result]
            else:
                self.worksp_ls = []
                QMessageBox.information(self, u'Loading perf workspaces error.', str( dicc[de.key_errors] )  )
        else:
            self.worksp_ls = []

    def jira_login_action(self):
        self.jira_combo_change_ac( 2 )
        self.load_project_combo()
        hlp_manager.set_logged_data_on_combo( self.ui.comboB_projects, self.PROJECT_KEY)
        QMessageBox.information(self, u'', "Jira login\n settings done"  )
        
    def jira_combo_change_ac(self, signal):
        """ComboB or other widget action triggered when user changes values on Jira logging
        Args:
            signal ([int]): [number for distinguish witch particular widget change you want to work with]
        """
        dicc = hlp.json2dicc_load( de.TEMP_FOL+de.LOGIN_METADATA_FI_NA )
        if dicc!={}:
            self.USER , self.APIKEY, self.PROJECT_KEY, self.JI_SERVER = hlp_ji.load_jira_vars()
        else:
            dicc['project'] = 'None'
            dicc['emailAddress'] = 'None'
            dicc['apikey'] = 'None'
        if signal == 1 :
            dicc['project'] = str( self.ui.comboB_projects.currentText() )
            self.PROJECT_KEY = dicc['project']
            self.PROJ_SETTINGS = hlp.get_yaml_fil_data( de.SCRIPT_MANAG_FOL +'\\projects_settings\\' + self.PROJECT_KEY + de.SETTINGS_SUFIX )
        elif signal == 2:
            dicc['emailAddress'] = str( self.ui.lineEd_jira_user.text() )
            self.USER = dicc['emailAddress']
            self.ui.lineEd_jira_user.setText( self.USER )
            dicc['apikey'] = str(self.ui.lineEd_apiKey.text())
            self.APIKEY = str( dicc['apikey'] )
            self.ui.lineEd_apiKey.setText('')
        hlp.metadata_dicc2json( de.TEMP_FOL+de.LOGIN_METADATA_FI_NA , dicc )
        area_ani_ls = list( self.PROJ_SETTINGS['KEYW']['areaAnim'].values() )
        area_ass_ls = list( self.PROJ_SETTINGS['KEYW']['areaAssets'].values() )
        if self.PROJ_SETTINGS != None:
            self.id_rows_ass = self.t_fea.populate_table( self.ui.table_assetsTasks, area_ass_ls , de.HEADER_ASS_LS)
            self.id_rows_ani = self.t_fea.populate_table( self.ui.table_animTasks, area_ani_ls  , de.HEADER_ANI_LS)
        else:
            QMessageBox.warning(self, u'', "Project Settings Value is None"  )

    def perf_combo_change_ac( self, signal ):
        """ComboB or other widget action triggered when user changes values perforce logging
        Args:
            signal ([int]): [number for distinguish witch particular widget change you want to work with]
        """
        dicc = hlp.json2dicc_load( de.TEMP_FOL+de.PERF_LOG_METADATA_FI_NA )
        if dicc =={}:
            dicc['perf_user'] = 'None'
            dicc['perf_server'] = 'None'
            dicc['perf_workspace'] = 'None'
            dicc['perf_pass'] = 'None'
        else:
            self.PERF_USER ,self.PERF_SERVER ,self.PERF_WORKSPACE, self.PERF_PASS = hlp_perf.load_perf_vars()
        if signal == 1:
            dicc['perf_user'] = str(self.ui.lineEd_perforce_user.text() )
            self.PERF_USER = dicc['perf_user']

            dicc['perf_server'] = str(self.ui.lineEd_perforce_server.text() )
            self.PERF_SERVER = dicc['perf_server']

            dicc['perf_pass'] = str(self.ui.lineEd_perforce_pass.text() )
            self.PERF_PASS = dicc['perf_pass']
            
            QMessageBox.information(self, u'', "Perforce login \n     settings done"  )

            dicc['perf_workspace'] = str(self.ui.lineEd_perf_worksp.text())
            self.PERF_WORKSPACE = str( dicc['perf_workspace'] )
            self.set_roots()
        hlp.metadata_dicc2json( de.TEMP_FOL+de.PERF_LOG_METADATA_FI_NA , dicc)

if str(sys.version).startswith('2'): #ThreadReturnPy2
    class ThreadReturn(Thread):
        def __init__(self, group=None, target=None, name=None,args=(), kwargs={}, Verbose=None):
            Thread.__init__(self, group, target, name, args, kwargs) #, Verbose
            self._return = None
        def run(self):
            try:
                print (self._Thread__target)
            except Exception:
                self._Thread__target = None
            if self._Thread__target is not None:
                self._return = self._Thread__target(*self._Thread__args,
                                                   **self._Thread__kwargs)
        def join(self):
            Thread.join(self)
            return self._return

elif str(sys.version).startswith('3'):
    class ThreadReturn(Thread): #ThreadReturnPy3
        def __init__(self, group=None, target=None, name=None,
                    args=(), kwargs={}, Verbose=None):
            Thread.__init__(self, group, target, name, args, kwargs)
            self._return = None
        def run(self):
            if self._target is not None:
                self._return = self._target(*self._args,
                                                    **self._kwargs)
        def join(self, *args):
            Thread.join(self, *args)
            return self._return


if ev.ENVIROMENT == 'Windows':
    ###   manager launch  ####
    #import manager_tools.jira_project_manager as jiraM
    loader = QUiLoader()
    app = QApplication(sys.argv)
    widget = MyMainWindow( loader = loader)
    widget.ui.show()
    sys.exit(app.exec())
