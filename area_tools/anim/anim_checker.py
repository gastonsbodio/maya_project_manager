""" instructions: place anim_checker.py file and 'checker_anim_tool.ui' on maya script folder, 
    copy the 8th lines bellow  and paste it on script editor (python tab)
    take out the (hashtag chars)
"""

"""    Anim files checker tool """
#from importlib import reload
#import area_tools.anim.anim_checker as anc
#reload(anc)
#widget = anc.AnimCheckerApp()
#widget.ui.show()

import sys
import os
import time
import webbrowser

try:
    from PySide2.QtUiTools import QUiLoader
    from PySide2 import QtCore
    from PySide2.QtGui import *
    from PySide2.QtWidgets import *
except exception:
    from PySide6.QtUiTools import QUiLoader
    from PySide6 import QtCore
    from PySide6.QtGui import *
    from PySide6.QtWidgets import *


from importlib import reload
import perforce_conn.perforce_requests as pr
import google_conn.google_sheet_request as gs
import jira_conn.jira_queries as jq
import definitions as de
import helper as hlp
import jira_conn.hlp_jira as hlp_ji
import perforce_conn.hlp_perf as hlp_perf
import manager_tools.hlp_manager as hlp_manager
import google_conn.hlp_goo as hlp_goo
import enviroment as ev

reload(pr)
reload(gs)
reload(jq)
reload(de)
reload(hlp)
reload(hlp_ji)
reload(hlp_perf)
reload(hlp_manager)
reload(hlp_goo)
reload(ev)

ANIM_FOL_FILES = de.ANIM_FOL_FILES
class AnimCheckerApp( QMainWindow ):
    def __init__(self):
        super(AnimCheckerApp, self).__init__( )
        loader = QUiLoader()
        uifile = QtCore.QFile( de.SCRIPT_MANAG_FOL.replace('\\','/') + ANIM_FOL_FILES + de.ANIM_CHECK_UI)
        uifile.open(QtCore.QFile.ReadOnly)
        self.ui = loader.load( uifile, ev.getWindow( QWidget ) )
        self.initialize_widget_conn()

    def initialize_widget_conn(self):
        """Initializing functions, var and features.
        """
        self.ui.actionfirst_steps.triggered.connect(self.instruction_menu_action)
        GOOGLE_DOC_NA, SHEET_NA , DEPOT_ANIM_ROOT, UNREAL_ANIM_ROOT = self.load_line_edit_text()
        self.jira_m = jq.JiraQueries()
        self.USER , self.APIKEY, self.PROJECT_KEY , self.JI_SERVER = hlp_ji.load_jira_vars()
        self.PERF_USER ,self.PERF_SERVER , self.PERF_WORKSPACE , self.PERF_PASS = hlp_perf.load_perf_vars()
        self.LOCAL_ROOT, self.DEPOT_ROOT = hlp_manager.load_root_vars()
        self.GIT_ROOT = self.LOCAL_ROOT
        self.PROJ_SETTINGS = hlp.get_yaml_fil_data( de.SCRIPT_MANAG_FOL +'\\projects_settings\\' + self.PROJECT_KEY + de.SETTINGS_SUFIX )
        self.load_table( self.ui.table_anim_check, 'populate' , GOOGLE_DOC_NA , SHEET_NA ,DEPOT_ANIM_ROOT, UNREAL_ANIM_ROOT ) 
        self.ui.push_butt_start_check.clicked.connect( lambda: self.check_trigged_action() )

    
    def set_table_columns(self, table):
        for i, header in enumerate (de.CHECK_ANIM_LS):
            locals()["item"+ str(i)] = QTableWidgetItem(header)
            #locals()["item"+ str(i)].setBackground(QColor(180, 75, 65))
            table.setHorizontalHeaderItem( i,locals()["item"+ str(i)] )
        table.setColumnWidth( de.THUMB_IDX , de.width_as_thum )
        table.setColumnWidth( 0,  280 )
        table.setColumnWidth( 1,  50 )
        table.setColumnWidth( 2,  50 )
        table.setColumnWidth( 3,  50 )


    def  load_table(self, table, type, googl_doc_name, sheet_name,depot_anim_root, unreal_anim_root):
        """populate qtable with values.
        Args:
            table ([qtablewid]): [description]
        """
        table.clear()
        self.set_table_columns( self.ui.table_anim_check )
        if type == 'check':
            unreal_anim_fi_ls = self.list_unreal_files( unreal_anim_root )
            try:
                table_anims, ma_files_ls, fbx_files_ls = self.get_all_anim_check_files( depot_anim_root )
            except Exception as err:
                print (err)
                table_anims = []
                ma_files_ls = []
                fbx_files_ls = []
        try:
            tasks_ls_diccs = hlp_goo.get_google_doc_data(self, QMessageBox, gs, googl_doc_name , sheet_name)
        except Exception as err:
            print (err)
            tasks_ls_diccs = []
        table.setRowCount( len( tasks_ls_diccs ) )
        self.id_rows = {}
        for i, task in enumerate( tasks_ls_diccs ):
            table.setRowHeight( i, de.height_anim_ch_row )
            for idx, column in enumerate ( de.CHECK_ANIM_LS ):
                if column == de.anim:
                    item = QTableWidgetItem( str( task[ de.anim_check_colum_sheet_column]  ) )
                    table.setItem(i ,idx, item)
                else:
                    item = QTableWidgetItem( '' )
                    checkb =  QCheckBox(None)
                    checkb.setChecked(False)
                    table.setCellWidget( i , idx, checkb )
                    table.setItem(i ,idx, item)
                    item.setTextAlignment( QtCore.Qt.AlignCenter )
                    if type == 'check':
                        table_anim = hlp.only_name_out_extention( task[ de.anim_check_colum_sheet_column ], with_prefix = True, prefix = 'AS_' )
                        if column == de.maya:
                            if table_anim in ma_files_ls :
                                checkb.setChecked(True)
                        elif column == de.fbx:
                            if table_anim in fbx_files_ls :
                                checkb.setChecked(True)
                        elif column == de.unreal:
                            if table_anim in unreal_anim_fi_ls :
                                checkb.setChecked(True)
                    checkb.setEnabled(False)

    def get_all_anim_check_files(self, depot_path_root):
        perf = pr.PerforceRequests()
        dicc_fol = perf.get_all_dir_fol( depot_path_root, self.PERF_SERVER , self.PERF_USER ,
                                        self.PERF_WORKSPACE, return_ls = [], pyStAl = True )
        if dicc_fol[de.key_errors] == '[]':
            table_anim_ls = []
            return_ma_list = []
            return_fbx_list = []
            for depot_folder in dicc_fol[de.ls_result] :
                folder_ls = perf.get_fol_fi_on_folder( 'files' ,depot_folder, True, self.PERF_SERVER, self.PERF_USER, self.PERF_WORKSPACE )
                for file in folder_ls[de.ls_result]:
                    print( file['depotFile'] )
                    talbe_fi = hlp.only_name_out_extention( file['depotFile'] , with_prefix = False )
                    if talbe_fi not in table_anim_ls:
                        table_anim_ls.append(  talbe_fi  )
                    if file['depotFile'].endswith('.ma') or file['depotFile'].endswith('.mb'):
                        maya_fi = hlp.only_name_out_extention( file['depotFile'] , with_prefix = True, prefix = 'AS_' )
                        if maya_fi not in return_ma_list:
                            return_ma_list.append(  maya_fi )
                    if file['depotFile'].endswith('.fbx'):
                        fbx_fi = hlp.only_name_out_extention( file['depotFile'] , with_prefix = True, prefix = 'AS_' )
                        if fbx_fi not in return_fbx_list:
                            return_fbx_list.append( fbx_fi )
            return table_anim_ls, return_ma_list, return_fbx_list
        else:
            QMessageBox.information(self, u'getting perf folders error.', str( dicc_fol[de.key_errors] )  )
            return None

    def list_unreal_files( self, unreal_root_anim_path ):
        unreal_fi_ls = []
        for pathhh, subdirs, files in os.walk( unreal_root_anim_path ):
            for fi in files:
                if fi.endswith('.uasset'):
                    un_fi = hlp.only_name_out_extention( fi , with_prefix = True, prefix = 'AS_' )
                    unreal_fi_ls.append( un_fi )
        return unreal_fi_ls

    def instruction_menu_action(self):
        """Browse instruction to use anim check tool
        """
        link = de.INSTRUCTION_CHECK_ANIM_TOOL
        webbrowser.open(link, new=2)
        
    def set_settings(self):
        dicc = {}
        dicc['docu_na'] =  str( self.ui.lineEd_google_sheet_na.text() )
        dicc['sheet_na'] =  str( self.ui.lineEd_sheet_na.text() ) 
        dicc['depot_a_root'] = hlp.format_path( str( self.ui.lineEd_depot_anim_root.text() ) )
        dicc['unreal_a_root'] = hlp.format_path( str(self.ui.lineEd_unreal_anim_root.text() ) )
        hlp.metadata_dicc2json( de.TEMP_FOL+de.ANIM_CHECK_TOOL_SETTING , dicc )
        

    def check_trigged_action(self):
        self.set_settings()
        google_doc_name = str(self.ui.lineEd_google_sheet_na.text( ))
        sheet_name = str(self.ui.lineEd_sheet_na.text( ))
        depot_anim_root = hlp.format_path (  str( self.ui.lineEd_depot_anim_root.text( ) )  )
        unreal_anim_root = hlp.format_path ( str(self.ui.lineEd_unreal_anim_root.text( )) )
        self.ui.table_anim_check.setEditTriggers(QTableWidget.NoEditTriggers)
        self.load_table( self.ui.table_anim_check, 'check' , google_doc_name, sheet_name, depot_anim_root, unreal_anim_root )

    def load_line_edit_text( self ):
        GOOGLE_DOC_NA, SHEET_NA , DEPOT_ANIM_ROOT, UNREAL_ANIM_ROOT = hlp_manager.load_anim_check_vars( QMessageBox, self )
        self.ui.lineEd_google_sheet_na.setText(GOOGLE_DOC_NA) 
        self.ui.lineEd_sheet_na.setText(SHEET_NA) 
        self.ui.lineEd_depot_anim_root.setText(DEPOT_ANIM_ROOT) 
        self.ui.lineEd_unreal_anim_root.setText(UNREAL_ANIM_ROOT) 
        return GOOGLE_DOC_NA , SHEET_NA , DEPOT_ANIM_ROOT, UNREAL_ANIM_ROOT
    
if ev.ENVIROMENT == 'Windows':
    if __name__ == '__main__':
        app = QApplication(sys.argv)
        widget = AnimCheckerApp()
        widget.ui.show()
        sys.exit(app.exec_())