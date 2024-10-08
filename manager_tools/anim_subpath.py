import sys
import os
import time
import ast

try:
    from PySide2.QtUiTools import QUiLoader
    from PySide2 import QtCore
    from PySide2.QtGui import *
    from PySide2.QtWidgets import *
except Exception as err:
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
    
import shutil

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

class AnimSubPath( QMainWindow ):
    def __init__( self, loader = None , anim_na = '' , area = '' , anim_asset = '' , signal= '',
                  row_idx = None,  assign_user_id = '' ,  path_ls = [] , area_done_dicc = {} , 
                  issue_key = ''  , item_type = '' ):
        super(AnimSubPath, self).__init__( )
        #if loader == None:
        #    loader = QUiLoader()
        uifile = QtCore.QFile( de.SCRIPT_MANAG_FOL.replace('\\','/') + '/manager_tools/' + de.ANIM_PATH_TREE_UI)
        uifile.open(QtCore.QFile.ReadOnly)
        self.ui = loader.load( uifile, ev.getWindow( QWidget ) )
        self.anim_na = anim_na
        self.area = area
        self.anim_asset = anim_asset
        self.signal = signal
        self.row_idx = row_idx
        self.assign_user_id = assign_user_id
        self.path_ls = path_ls
        self.area_done_dicc = area_done_dicc
        self.issue_key = issue_key
        self.item_type = item_type
        self.initialize()

    def initialize(self):
        """Initializing functions, var and features.
        """
        self.jira_m = jq.JiraQueries()
        self.USER , self.APIKEY, self.PROJECT_KEY , self.JI_SERVER = hlp_ji.load_jira_vars()
        self.PERF_USER ,self.PERF_SERVER , self.PERF_WORKSPACE , self.PERF_PASS = hlp_perf.load_perf_vars()
        self.LOCAL_ROOT, self.DEPOT_ROOT = hlp_manager.load_root_vars()
        self.PROJ_SETTINGS = hlp.get_yaml_fil_data( de.SCRIPT_MANAG_FOL +'\\projects_settings\\' + self.PROJECT_KEY + de.SETTINGS_SUFIX )
        dicc_ = { 'taskType': self.area , 'itemType': self.item_type }#self.PROJ_SETTINGS['KEYW']['areaAnim'] }
        self.anim_root = hlp_manager.solve_path( 'depot' , 'Anim_Root' , '' ,  self.DEPOT_ROOT, '' ,  self.PROJ_SETTINGS , dicc_ = dicc_ )
        self.ui.lineEdit_anim_root.setText( self.anim_root )
        self.ui.listWid_lavel1.addItem('')
        self.load_qwlist(  self.ui.listWid_lavel1, 0 )
        self.ui.listWid_lavel1.currentItemChanged.connect( lambda: self.load_qwlist( self.ui.listWid_lavel2 , 1 ))
        self.ui.listWid_lavel2.currentItemChanged.connect( lambda: self.load_qwlist( self.ui.listWid_lavel3 , 2 ))
        self.ui.listWid_lavel3.currentItemChanged.connect( lambda: self.load_qwlist( self.ui.listWid_lavel4 , 3 ))
        self.ui.listWid_lavel4.currentItemChanged.connect( lambda: self.load_qwlist( self.ui.listWid_lavel4 , 4 ))
        self.ui.pushBut_create_new_folder.clicked.connect( lambda: self.pushBut_create_new_folder_action() )
        self.ui.pushBut_clean_path.clicked.connect( lambda: self.get_final_path ( '' , self.anim_na))
        self.ui.pushBut_set_this_path.clicked.connect( lambda: self.done())

        
    def load_qwlist(self, target_list_widget , signal):
        subpaths = self.generate_subpaths( signal )
        perf = pr.PerforceRequests()
        dicc = perf.get_fol_fi_on_folder( 'dirs' , self.anim_root+subpaths , True, self.PERF_SERVER ,
                                         self.PERF_USER , self.PERF_WORKSPACE , self.PERF_PASS )
        if dicc[de.key_errors] == '[]':
            folder_ls = dicc[de.ls_result]
            for item in folder_ls:
                target_list_widget.addItem( item['dir'].split('/')[-1] )
            self.get_final_path ( subpaths , self.anim_na)
        else:
            QMessageBox.information(self, u'getting folders perf error.', str( dicc[de.key_errors] )  )

    def generate_subpaths(self, signal):
        if signal != 0:
            try:
                if signal == 1:
                    sub1 = str( self.ui.listWid_lavel1.currentItem().text() )
                    subpaths =  sub1 + '/'
                    self.ui.listWid_lavel2.clear()
                    self.ui.listWid_lavel3.clear()
                    self.ui.listWid_lavel4.clear()
                elif signal == 2:
                    sub1 = str( self.ui.listWid_lavel1.currentItem().text() )
                    sub2= str( self.ui.listWid_lavel2.currentItem().text() )
                    subpaths = sub1 + '/' + sub2 + '/'
                    self.ui.listWid_lavel3.clear()
                    self.ui.listWid_lavel4.clear()
                elif signal == 3:
                    sub1 = str( self.ui.listWid_lavel1.currentItem().text() )
                    sub2= str( self.ui.listWid_lavel2.currentItem().text() )
                    sub3= str( self.ui.listWid_lavel3.currentItem().text() )
                    subpaths =  sub1 + '/' + sub2 + '/' + sub3 + '/'
                    self.ui.listWid_lavel4.clear()
                elif signal == 4:
                    sub1 = str( self.ui.listWid_lavel1.currentItem().text() )
                    sub2= str( self.ui.listWid_lavel2.currentItem().text() )
                    sub3= str( self.ui.listWid_lavel3.currentItem().text() )
                    sub4= str( self.ui.listWid_lavel4.currentItem().text() )
                    subpaths =  sub1 + '/' + sub2 + '/' + sub3 + '/' + sub4 + '/'
            except Exception:
                subpaths = ''
        else:
            subpaths = ''
        return subpaths

    def get_final_path (self, subpaths , anim_na):
        #itemType = self.PROJ_SETTINGS['KEYW']['item_types']['anim']
        dicc = { 'subpath': subpaths ,'anim_na': anim_na ,
                'taskType':  self.area ,
                'itemType' : self.item_type }
        anim_full_path_fileroot = hlp_manager.solve_path( 'depot' , 'Anim_Path' , '' ,  self.DEPOT_ROOT, '' ,
                                                self.PROJ_SETTINGS , dicc_ = dicc)
        self.ui.lab_final_anim_path.setText( anim_full_path_fileroot )
        self.ui.lab_final_anim_path.setStyleSheet("color: rgb( 0, 175 ,0 )")

    def pushBut_create_new_folder_action(self):
        text_folder = str( self.ui.lineEd_new_fol.text() )
        if self.ui.radioButt_level1.isChecked():
            self.ui.listWid_lavel1.addItem( text_folder )
        elif self.ui.radioButt_level2.isChecked():
            self.ui.listWid_lavel2.addItem( text_folder )
        elif self.ui.radioButt_level3.isChecked():
            self.ui.listWid_lavel3.addItem( text_folder )
        elif self.ui.radioButt_level4.isChecked():
            self.ui.listWid_lavel4.addItem( text_folder )
        else:
            QMessageBox.information(self, u'No radio button checked', 'Choose one radio button first. '  )

    def signal_action( self, area, path, item_na ):
        itemType = self.PROJ_SETTINGS['KEYW']['areaAnim']['anim']
        if self.signal == 'create_temp':
            area_done_dicc = self.area_done_dicc
            if 'unknown' == self.row_idx :
                key_permission , area_done_dicc , row_idx , path_ls , row_idx_crea_templa = hlp_manager.check_created_task( self, 
                                                                                    QMessageBox, gs, area, item_na  )
                if path not in path_ls:
                    path_ls.append( path)
                self.row_idx = row_idx_crea_templa
            hlp_manager.set_new_values_on_sheet(  self , gs ,QMessageBox , area,   [ de.GOOGLE_SH_ANI_NA_COL, de.GOOGLE_SH_CREAT_PATH ] ,
                                        [ item_na,    str( path_ls ) ] ,     self.row_idx  )
            label_ls , goo_colum , value_ls = hlp_manager.define_main_item_vars( self, area , self.anim_asset ,
                                                            item_na , area_done_dicc , path_ls , itemType )
            label_ls = [ de.item_path+'_'+path ]
            key = hlp_ji.set_issue_label(  self, QMessageBox , label_ls,  self.issue_key  , self.jira_m  )
            return key
        elif self.signal == 'create_full_task':
            if path not in self.path_ls:
                self.path_ls.append( path)
            #itemType = self.PROJ_SETTINGS['KEYW']['item_types']['anim']
            goo_colum , value_ls = hlp_ji.jira_creation_task_issue( self, QMessageBox , de.issue_type_task  ,
                                                                   self.assign_user_id , item_na , area ,
                                                                   self.area_done_dicc , self.path_ls ,
                                                                   self.anim_asset , itemType )
            hlp_manager.set_new_values_on_sheet( self , gs , QMessageBox , area, goo_colum , value_ls, self.row_idx  )
        return True
        
    def done( self ):
        item_area_full_path_depot = str( self.ui.lab_final_anim_path.text() )
        item_area_full_path = str( self.ui.lab_final_anim_path.text() )
        item_area_full_path = hlp_manager.transform_given_path( item_area_full_path, 'local' , self.PROJ_SETTINGS , self.LOCAL_ROOT, self.DEPOT_ROOT )
        type = de.issue_type_anim
        char_type = str( self.PROJ_SETTINGS ['KEYW']['assets_types']['characters'] )
        item_type = str( self.PROJ_SETTINGS ['KEYW']['item_types']['asset'] )
        areaRig = str( self.PROJ_SETTINGS ['KEYW']['areaAssets']['rig'] )
        genericChar_na = str( self.PROJ_SETTINGS ['KEYW']['genericChar_na'] )
        dicc = {  'ass_na' : self.anim_asset  ,  'itemType': item_type , 'genericChar_na': genericChar_na,
                 'areaAssRig': areaRig , 'taskType' :  char_type , 'areaAss': areaRig , 'taskType' : self.area}
        anim_asset_fullpath = hlp_manager.solve_path( 'local', 'Rig_Ass_Path' , self.LOCAL_ROOT ,  '', '' ,  self.PROJ_SETTINGS , dicc_ = dicc)
        dicc ['itemType'] = str( self.PROJ_SETTINGS ['KEYW']['item_types']['anim'] )
        template_full_path = hlp_manager.solve_path( 'local', 'Anim_Template' , self.LOCAL_ROOT ,  '', '' ,  self.PROJ_SETTINGS , dicc_ = dicc)
        perf = pr.PerforceRequests()
        key = self.signal_action(  self.area, item_area_full_path_depot, self.anim_na )
        if key :
            hlp_manager.copy_and_submit( self, self.PROJ_SETTINGS, QMessageBox , perf ,  template_full_path , item_area_full_path , 
                                self.area , self.anim_na  , type , anim_asset_fullpath  )
        self.ui.close()
        QMessageBox.information( self, u'Done', item_area_full_path + '   created!'  )
        
#if ev.ENVIROMENT == 'Windows':
#    if __name__ == '__main__':
#        loader = QUiLoader()
#        app = QApplication(sys.argv)
#        widget = AnimSubPath( loader )
#        widget.ui.show()
#        sys.exit(app.exec())
        
        