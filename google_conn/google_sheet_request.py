import sys
import os
import ast
import time

from importlib import reload
import importing_modules as  im
de = im.importing_modules( 'definitions' )
hlp = im.importing_modules(  'helper' )
hlp_goo = im.importing_modules(  'google_conn.hlp_goo' )

if de.PY_PACK_MOD not in sys.path:
    sys.path.append( de.PY_PACK_MOD.replace('/','\\') + '\\' )
PYTHON_VERSION_PATH = de.PY3_PACKAGES
try:
    from py3.pydrive2 import auth
    from py3.pydrive2.auth import GoogleAuth
    from py3.pydrive2.drive import GoogleDrive
except Exception:
    pass
import sys
import ctypes
from ctypes.wintypes import MAX_PATH
dll = ctypes.windll.shell32
buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
    USER_DOC = buf.value

        
class GoogleSheetRequests():
    def get_master_credentials( self ):
        """Get master user and pass for getting jira projects
        Returns:
            [dicc]: [dicc with master user and pass]
        """
        line = '%s  = sheet.get_all_records()\n' %de.dicc_ji_result
        file_content = hlp_goo.write_goo_sheet_request ( line , True, 'google_sheet_query.json',
                                                    de.GOOGLE_SHEET_DOC_NA , 'Sheet1' )
        hlp.create_python_file ( 'google_sheet_query', file_content )
        hlp.run_py_stand_alone( 'google_sheet_query' )
        dicc = hlp.json2dicc_load( de.PY_PATH  + 'google_sheet_query.json')[0]
        os.remove( de.PY_PATH  + 'google_sheet_query.json' )
        os.remove( de.PY_PATH  + 'google_sheet_query.py' ) 
        os.remove( de.PY_PATH  + 'Execute_google_sheet_query.bat' )
        return dicc['master_user'], dicc['master_pass']
    
    def get_data_custom_google_sheet( self , google_sheet_doc_na, google_sheet_num):
        """Get data on custom google sheet
        Returns:
            [dicc]: [dicc with master user and pass]
        """
        line = '%s  = sheet.get_all_records()\n' %de.ls_result
        file_content = hlp_goo.write_goo_sheet_request ( line , True, 'custom_google_doc.json',
                                                    google_sheet_doc_na, google_sheet_num )
        hlp.create_python_file ( 'custom_google_doc', file_content )
        hlp.run_py_stand_alone( 'custom_google_doc' )
        list_dicc = hlp.json2dicc_load( de.PY_PATH  + 'custom_google_doc.json')
        return list_dicc

    def edit_goog_sheet_cell( self , google_sheet_doc_na, google_sheet_num, google_sheet_col_ls, new_value_ls , rowIdx ):
        """Get data on custom google sheet
        Returns:
            [dicc]: [dicc with master user and pass]
        """
        tab = '                '
        line =               'letCol = None\n'
        line =  line + tab + 'for i, col in enumerate( %s ):\n' %google_sheet_col_ls
        line =  line + tab + '    if col != "":\n'
        line =  line + tab + '        for idx, column in enumerate( %s ):\n' %de.GOOG_SH_NUM_COL
        line =  line + tab + '            if col == str(sheet.cell(1,column).value ):\n'
        line =  line + tab + '                letCol = str( %s[idx] )\n' %de.GOOG_SH_ALPHA_LS
        line =  line + tab + '                break\n'
        line =  line + tab + '        num = %s + 2 \n' %int( rowIdx )
        line =  line + tab + '        sheet.update_acell( letCol + str( num ), %s[i] )\n' %str( new_value_ls )
        file_content = hlp_goo.write_goo_sheet_request ( line , True, 'edit_goo_sh_cell.json',
                                                    google_sheet_doc_na, google_sheet_num )
        hlp.create_python_file ( 'edit_goo_sh_cell', file_content )
        hlp.run_py_stand_alone( 'edit_goo_sh_cell' )
        list_dicc = hlp.json2dicc_load( de.PY_PATH  + 'edit_goo_sh_cell.json')
        return list_dicc

class GoogleDriveQuery():
    def login(self):
        """Creates a google drive object ( with the proper log in )able to do queries
        Returns:
            [type]: [description]
        """
        gauth = GoogleAuth( )
        GoogleAuth.DEFAULT_SETTINGS['client_config_file'] = PYTHON_VERSION_PATH.replace('\\','/') + "/creds/client_secrets.json"
        c = gauth.LoadCredentialsFile( PYTHON_VERSION_PATH.replace('\\','/')  + "/creds/mycreds.txt" )
        if gauth.credentials is None or c is None:
            gauth.LocalWebserverAuth()
        elif gauth.access_token_expired:
            try:
                gauth.Refresh()
            except Exception:
                gauth.Authorize(c)
        else:
            gauth.Authorize()
        gauth.SaveCredentialsFile( PYTHON_VERSION_PATH.replace('\\','/') + "/creds/mycreds.txt" )
        return GoogleDrive(gauth)

    def dowload_fi(self, googleFi, targuet_full_path):
        """Download to local a file, with the given google file object.
        Args:
            googleFi ([google file obj]): [description]
            targuet_full_path ([str]): [local target full path]
        """
        googleFi.GetContentFile( targuet_full_path )
        
    def listContentFold( self, credenciales, idFather , final_ls = []):
        """
        Args:
            credenciales ([google drive obj]): [given logged in google drive obj]
            idFather ([str]): [id code associated to a google file or folder]
        Returns:
            [ls]: [list of google files objects]
        """
        query = " '%%%s%%' in parents and trashed=false"%(idFather)
        query = query.replace('%','')
        contentLs = credenciales.ListFile({'q':query}).GetList()
        for file in contentLs:
            if file['mimeType'] == 'application/vnd.google-apps.folder':
                self.listContentFold( credenciales, file['id'] , final_ls = final_ls)
            else:
                final_ls.append( file )
        return final_ls
        
    def list_goog_root_fol_fi( self, credentials ):
        """List and return all files or folder on google drive top level.
        Args:
            credenciales ([google drive obj]): [given logged in google drive obj]
        Returns:
            [ls]: [list of google files objects]
        """
        print ("credentials")
        print ( credentials )
        top_list = credentials.ListFile({'q': "'root' in parents and trashed=false"}).GetList()
        return top_list

    def find_goo_tools_fol( self , credentials , fol_name):
        """it uses tools files content folder name to get this google folder obj.
        Args:
            credenciales ([google drive obj]): [given logged in google drive obj]
        Returns:
            [google folder obj]: [description]
        """
        for goo_obj in self.list_goog_root_fol_fi( credentials ):
            for dicc_key in goo_obj:
                try:
                    if str( dicc_key ) == 'title' and str( goo_obj[ dicc_key ] ) == fol_name: #de.GOOG_CONTENT_TOOLS_FOL: 
                        return goo_obj
                except Exception:
                    pass
        return None

    def buildPathGooD( self, credenciales, dicGoFileList ):
        pathTuple = []
        fatherID = ''
        for idx, f in enumerate(dicGoFileList):
            parented = f['parents'][0]['isRoot']
            pathh = ''
            if len(pathh.split('/')) < 2:
                pathh = f['title']
            if f['parents'][0]['isRoot'] == False:
                fatherID = f['parents'][0]['id']
            allFolders = credenciales.ListFile({'q': "mimeType  contains 'folder' and trashed = false"}).GetList()
            while parented == False:
                for fol in allFolders:
                    if fol['id'] == fatherID:
                        pathh = str ( fol['title'] ) + "/"+ pathh
                        if fol['parents'] != []:
                            fatherID = fol['parents'][0]['id']
                            parented = fol['parents'][0]['isRoot']
                        else:
                            parented = True
                if idx == len(dicGoFileList) -1 :
                    break
            gRoot = ''
            for f in allFolders:
                if fatherID == f['id']:
                    gRoot = f['title']
            pathh = gRoot +'/'+ pathh
            if not pathh.startswith('/'):
                pathh = '/'+pathh
            pathTuple.append(pathh)
        return pathTuple

    def list_fi_contente (self ,credentials, google_fol_id ):
        tool_fi_ls = credentials.ListFile({
                                            'q': "'%s' in parents" %google_fol_id,
                                            'supportsAllDrives': True, 
                                            'includeItemsFromAllDrives': True,
                                            }).GetList()
        return tool_fi_ls

    def update_tools (self, google_fol_dicc, folder ):
        """log in list tool files and download them to local.
        """
        google_fol_id = list( ast.literal_eval(google_fol_dicc).values() )[0]
        google_fol_na = list(ast.literal_eval(google_fol_dicc).keys() )[0]
        credentials = self.login()
        tool_fi_ls = self.list_fi_contente ( credentials, google_fol_id )
        if not os.path.exists( folder ):
            try:
                os.makedirs( folder )
            except Exception:
                pass
        if google_fol_na ==  list(  de.GOOG_CONTENT_TOOLS_FOL.keys() )[0]:
            #google_fol_na = list(  ast.literal_eval( google_fol_dicc           ).keys()  )[0]
            self.dowload_sk_menu_fi( credentials  )
        self.dowloading_ls( credentials, google_fol_na, folder , tool_fi_ls )
        

    def dowload_sk_menu_fi( self , credentials  ):
        google_fol_id = list( de.GOOG_CONT_MAYA_MENU_FOL.values() )[0]
        google_fol_na = list( de.GOOG_CONT_MAYA_MENU_FOL.keys() )[0]
        tool_fi_ls = self.list_fi_contente ( credentials, google_fol_id )
        self.dowloading_ls( credentials, google_fol_na, de.MAYA_MENU_FOL , tool_fi_ls )
        
    def dowloading_ls(self, credentials, google_fol, folder , tool_fi_ls):
        for goo_fi in tool_fi_ls:
            goo_path_name = self.buildPathGooD( credentials, [ goo_fi ] )[0]
            if not goo_path_name.startswith('/'):
                goo_path_name = '/'+goo_path_name
            end_path_name = goo_path_name.split('/'+google_fol+'/')[-1]
            full_path_name = folder + '/'+end_path_name.replace('__pycache__/', '')
            if '.cpython' in full_path_name:
                full_path_name = full_path_name.split( '.cpython')[0] + '.pyc'
            self.dowload_fi ( goo_fi, full_path_name  )
            print ( ' downloading:      ' + full_path_name )

    def download_studio_library (self):
        """log in list tool files and download them to local.
        """
        credentials = self.login()
        goo_obj_tool_fol = self.find_goo_tools_fol( credentials , de.STU_LIB_FOL_NA)
        tool_fi_ls = self.listContentFold(  credentials , goo_obj_tool_fol['id'] )
        if not os.path.exists(  de.USER_DOC.replace('\\','/')  + "/" + de.STU_LIB_FOL_NA  ):
            try:
                os.makedirs( de.SCRIPT_MANAG_FOL.replace('\\','/') )
            except Exception:
                pass
        for goo_fi in tool_fi_ls:
            full_path_name = self.buildPathGooD( credentials, [goo_fi] )
            full_path = de.USER_DOC.replace("\\","/") + "/" + full_path_name[0] 
            path , name = hlp.separate_path_and_na( full_path )
            if not os.path.exists(  path ):
                try:
                    os.makedirs( path )
                except Exception:
                    pass
            self.dowload_fi ( goo_fi, full_path )
            print ( ' downloading:      ' + full_path )

    def shelf_butt_launch_update_tools():
        """is not a real function, it is just to preserve the code to call -update tools-
        """
        sys.path.append( de.SCRIPT_MANAG_FOL )
        file_content = hlp_goo.write_googld_func ( 'update_tools', '', False)
        hlp.create_python_file ('update_tools', file_content)
        hlp.run_py_stand_alone( 'update_tools', True)

    def pathOnlyBuilt (self, pathh):        
        allFolNaLs = pathh.split ("/")
        pathOnly = ''        
        for idx , partFol in enumerate(allFolNaLs):
            if partFol != '':
                resta = 1
                if allFolNaLs[-1] == '':
                    resta = 2
                if idx != len(allFolNaLs)-resta:
                    pathOnly = pathOnly+partFol+'/'
        return pathOnly
    
    def strip_bar(self, pathAlone):
        if pathAlone.endswith('/'):
            partes = pathAlone.split('/')
            if partes[-1] == '':
                namea = partes[-2]
            else:
                namea = partes[-1]
            ruta =    self.pathOnlyBuilt( pathAlone )
            onlyPath = ruta + namea
        else:
            onlyPath = pathAlone
        return onlyPath

    def upload_file(self, credenciales, ruta_archivo, id_folder):
        try:
            drive ='drive#fileLink'
            archivo = credenciales.CreateFile({'parents':[{'kind': drive , 'id': id_folder}] })
            archivo['title']= ruta_archivo.split('/')[-1]
            archivo.SetContentFile(ruta_archivo)
            archivo.Upload()
        except Exception as err:
            print (err)

    def builtPathSinceRoot (self, file_full_pathh, projRootNa, credenciales):
        projName = projRootNa.split('/')[-1]
        filePath, fileName= hlp.separate_path_and_na(file_full_pathh)
        if fileName == '':
            fileName = file_full_pathh.split('/')[-2]
        pathOnly = self.pathOnlyBuilt(file_full_pathh)
        pathOnly = pathOnly.split(projName)[-1]
        partsPathNa = pathOnly.split('/')
        partsPathNa =  partsPathNa + [ fileName ]
        try:
            partsPathNa.remove('')
        except Exception:
            pass
        try:
            partsPathNa.remove('')
        except Exception:
            pass
        dicFileGooD = credenciales.ListFile({'q': "title = '%s' and trashed = false and mimeType  contains 'folder'" %projName}).GetList()
        project_root_g_obj = dicFileGooD[0]
        id_path = '/'+project_root_g_obj['id']
        pathInGooglId = ''
        pathInGoogl = ''
        objGooLast = []
        if dicFileGooD != []:
            key_exist = False
            cantFolLev = len(partsPathNa)
            for idx, fol in enumerate( partsPathNa ):
                if key_exist:
                    break
                children_obj_ls = self.get_childrens ( credenciales, fol, id_path )
                for gooObj in children_obj_ls: 
                    print ( gooObj['title'] )
                    if gooObj['title'] == fol:
                        id_path = '/'+gooObj['id']
                        pathInGooglId = pathInGooglId + '/' + gooObj['id']
                        pathInGoogl = pathInGoogl + '/' + gooObj['title']
                        objGooLast = objGooLast + [gooObj]
                        if gooObj['title'] == fileName:
                            key_exist = True
                            break
                            
        if key_exist :
            return ( pathInGoogl , pathInGooglId ,objGooLast )
        else:
            return False 

    def get_multi_format_child(self, pathInGooglId, pathInGoogl,chil):
        if not pathInGooglId.endswith('/'):
            pathInGooglId = pathInGooglId + '/'
        if not pathInGoogl.endswith('/'):
            pathInGoogl = pathInGoogl + '/'
        pathInGooglId = pathInGooglId + chil['id']
        pathInGoogl = pathInGoogl + chil['title']
        return pathInGooglId , pathInGoogl, chil

    def createPathGooD(self, credenciales, pathh, projRootName):
        fiName =  pathh.split('/')[-1]
        #dirvePath = pathh.split(fiName)[0]
        dirvePath =    self.pathOnlyBuilt( pathh )
        self.projName = projRootName.split('/')[-1]
        dirvePath = dirvePath.split( projRootName )[-1]
        dirvePath = self.projName + dirvePath
        pathhFolLs = dirvePath.split('/')
        pathhFolLs.remove('')
        dicFileGooD = credenciales.ListFile({'q': "title = '%s' and trashed = false" %self.projName}).GetList()
        if [] != dicFileGooD:
            for dr in dicFileGooD:
                if dr['parents'] != []:
                    if dr['parents'][0]['isRoot']:
                        projectId = dr['id']
                else:
                    projectId = dr['id']
        for i, f in enumerate (pathhFolLs):
            if i == 0:
                fatherId = projectId # deberia existir la carpeta del proyecto por eso solo asigno el id para el que venga
            else:
                query = " '%%%s%%' in parents and trashed=false and title = '%%%s%%'"%(fatherId,f)
                query = query.replace('%','')
                dicFileGooD = credenciales.ListFile({'q':query}).GetList()
                eximed = []
                if [] != dicFileGooD:
                    for dr in dicFileGooD:
                        key = True
                        try:
                            bla = dr['parents'][0]['id']
                        except Exception:
                            key = False
                        if key:
                            if fatherId == dr['parents'][0]['id']:
                                if f not in eximed:
                                    eximed.append(f)
                                fatherId = dr['id']
                                break
                        else:
                            # aca hay que crear un if para discriminar a las carp
                            ## ANM o Sequence  o todas aquellas que se repitan muchas veces
                            key = False
                            for gd in dicFileGooD:
                                try:
                                    if fatherId == gd['parents'][0]['id']:
                                        key = True
                                except Exception as err:
                                    print ("try warning ")
                                    print (err)
                            if key == False:
                                folder = credenciales.CreateFile({'title' : f, "parents":  [{"id": fatherId}], 'mimeType' : 'application/vnd.google-apps.folder'})
                                folder.Upload()    
                                if f not in eximed:
                                    eximed.append(f)                            
                                fatherId = folder['id']
                                break
                else:
                    folder = credenciales.CreateFile({'title' : f, "parents":  [{"id": fatherId}], 'mimeType' : 'application/vnd.google-apps.folder'})
                    folder.Upload()                        
                    fatherId = folder['id']
        return fatherId

    def get_childrens (self, credenciales, name, id_path ):
        idFather = id_path.split('/')[-1]
        query = " '%%%s%%' in parents and trashed=false and title = '%%%s%%' "%( idFather, name )
        query = query.replace('%','')
        try:
            files_good_children_ls = credenciales.ListFile({'q':query}).GetList()
        except Exception:
            files_good_children_ls = []
            print('try warning listing children')
        return files_good_children_ls

    def delete_goo_fi( self, credenciales, file ):
        file.delete()

    def upload_custom_files (self, tuplaPaths, projRootName, local_root_fol):
        projName = projRootName.split('/')[-1]
        uploadMessLs = []
        credenciales = self.login()
        for file in tuplaPaths:
            fi_local = file
            fi = file.replace( local_root_fol+'/', projRootName+'/')
            name =str(fi.split('/')[-1])
            doneLlist = []
            name=fi.split('/')[-1]
            #pathAlone= self.pathOnlyBuilt(fi)
            #onlyPath = self.strip_bar( pathAlone )
            tuplas = self.builtPathSinceRoot ( fi, projName, credenciales)

            if tuplas != False:
                if  tuplas[2][-1]['mimeType'] == 'application/vnd.google-apps.folder':
                    file_id = tuplas[1].split('/')[-1] 
                    father_id_path = tuplas[1].split( '/'+file_id )[0] 
                    files_good_children_ls = self.get_childrens (credenciales, name, father_id_path )
                else:
                    files_good_children_ls = [ tuplas[2][-1] ]
            else:
                files_good_children_ls = []
            if files_good_children_ls != [] :
                print ('Updating Created file on cloud...')
                keyFind = False
                keyFind, doneLlist, uploadMessLs = self.loop_upload( fi, fi_local ,files_good_children_ls, 
                                                doneLlist, uploadMessLs , keyFind ,credenciales, projRootName)
            else:
                print ('Creating file...')
                if fi not in uploadMessLs:
                    fatherID = self.createPathGooD( credenciales, fi, projRootName)
                    self.upload_file( credenciales, fi_local, fatherID)
                    print ('  --  --  --  --  --  --  ')
                    print (' Uploading:   ' + str (fi_local))
                    print ("  ")
                    uploadMessLs.append(fi)
                else:
                    if fi not in uploadMessLs:
                        uploadMessLs.append(fi)


    def loop_upload(self, fi ,fi_local ,filesGoo_ls, doneLlist, uploadMessLs, keyFind ,credenciales, projRootName):
        for gooObj in filesGoo_ls:
            if gooObj not in doneLlist:
                if fi not in uploadMessLs:
                    keyFind = True
                    fechaModGoogFi = gooObj['modifiedDate'].split(".")[0]
                    fecha =time.strftime('%Y-%m-%d', time.gmtime(os.path.getmtime(fi_local)))
                    hora = time.ctime(os.path.getmtime(fi_local))
                    hora = hora.split(" ")[-2]
                    fechaLocalFi = fecha + "T" + hora
                    gooObj.SetContentFile( fi_local )
                    gooObj.Upload()
                    doneLlist.append(fi)
                    print (fechaLocalFi)
                    print ('Local Date')
                    print (fechaModGoogFi)
                    print ('GoogleD Date')
                    print (' Uploading:   ' + str (fi_local))
                    uploadMessLs.append(fi)
                    break
                else:
                    if fi not in uploadMessLs:
                        uploadMessLs.append(fi)
            else:
                if fi not in uploadMessLs:
                    uploadMessLs.append(fi)
        if keyFind == False:
            if fi not in uploadMessLs:
                fatherID = self.createPathGooD( fi, projRootName)
                self.upload_file( credenciales, fi_local, fatherID)
                print ('  --  --  --  --  --  --  ')
                print (' Uploading:   ' + str (fi_local))
                print ("  ")
                uploadMessLs.append(fi)
            else:
                if fi not in uploadMessLs:
                    uploadMessLs.append(fi)
        else:
            if fi not in uploadMessLs:
                uploadMessLs.append(fi)
        return keyFind, doneLlist, uploadMessLs

    def timeFixer( self, fechaModGoogFi, timeOffset):
        partes = fechaModGoogFi.split("T")
        hora = partes[-1]
        fecha = partes[0]
        partesHora =  hora.split(':')
        partesFecha = fecha.split('-')
        fixH = int(partesHora[0]) - timeOffset
        if fixH < 0:
            partesHora[0] = str (24 + fixH)
            fixD = int(partesFecha[2]) - 1
            if fixD == 0:
                mesAnterior = str(int(partesFecha[1]) - 1)
                if len(mesAnterior) == 1:
                    mesAnterior = '0' + mesAnterior
                    if mesAnterior == '00':
                        mesAnterior = '12'
                if mesAnterior in ['04', '06', '09' , '11']:
                    finDeMesAnt = 30
                elif mesAnterior in ['01', '03', '05', '07', '08', '10' , '12']:
                    finDeMesAnt = 31
                elif mesAnterior == '02':
                    bisiestos = ['2024', '2028', '2032', '2036', '2040', '2044', '2048','2052', '2056', '2060']
                    if partesFecha[0] not in bisiestos:
                        finDeMesAnt = 28
                    else:
                        finDeMesAnt = 29
                partesFecha[2] = str(finDeMesAnt)
                if partesFecha[2] == str(finDeMesAnt):
                    partesFecha[1] = int(partesFecha[1]) - 1
                    if partesFecha[1] == 0:
                        partesFecha[1] = '12'
                        partesFecha[0] = int(partesFecha[0]) - 1
            else:
                partesFecha[2] = int(partesFecha[2]) - 1
            if partesFecha[1] == 0:
                partesFecha[0] == int(partesFecha[0]) - 1
        else:
            partesHora[0] = str (fixH)

        if len (str(partesHora[0])) == 1:
            partesHora[0] = '0'+ str(partesHora[0])
        if len (str(partesFecha[1])) == 1:
            partesFecha[1] = '0'+ str(partesFecha[1])
        if len (str(partesFecha[0])) == 1:
            partesFecha[0] = '0'+ str(partesFecha[0])
        return str(partesFecha[0]) + '-' + str(partesFecha[1]) + '-' + str(partesFecha[2]) + 'T'+ str(partesHora[0]) + ':' + str(partesHora[1]) + ':' + str(partesHora[2])

    def check_local_cloud_date( self, local_file_path , projName , stulib_local_root_fol):
        credenciales = self.login()
        local_path, local_name = hlp.separate_path_and_na( local_file_path )
        local_path = local_path.replace( stulib_local_root_fol+'/' , projName+'/' )
        onlyPath = self.strip_bar( local_path )
        tuplas = self.builtPathSinceRoot ( onlyPath, projName, credenciales)
        if tuplas != False:
            files_good_children_ls = self.get_childrens ( credenciales, local_name, tuplas[1] )
            if files_good_children_ls != []:
                for gooObj in files_good_children_ls:
                    fechaModGoogFi = gooObj['modifiedDate'].split(".")[0]
                    fechaModGoogFi = self.timeFixer( fechaModGoogFi, 5 )
                    fecha =time.strftime('%Y-%m-%d', time.gmtime(os.path.getmtime(local_file_path)))
                    hora = time.ctime(os.path.getmtime(local_file_path))
                    hora = hora.split(" ")[-2]
                    fechaLocalFi = fecha + "T" + hora
                    return hlp_goo.is_local_fi_mod( fechaLocalFi , fechaModGoogFi )
            else:
                return False
        else:
            return 'goog_fi_unexistence'

    def list_content_folder( self, folder, stulib_local_root_fol , pose_json, anim_root ):
        credenciales = self.login()
        top_folders = credenciales.ListFile({'q': "'root' in parents and trashed=false and title='%s'" %folder}).GetList()
        for goog_fol in top_folders:
                tool_fi_ls = self.listContentFold( credenciales, goog_fol['id'])
                pose_json_ls = []
                for goo_fi in tool_fi_ls:
                    if goo_fi['title'] == pose_json:
                        pose_json_ls.append( goo_fi )
                        full_path_name = self.buildPathGooD( credenciales, [ goo_fi ] )
                        print( goo_fi['title'] )
                        print( anim_root )
                        cloud_date =  goo_fi['modifiedDate'] 
                        local_path = full_path_name[0].replace( folder+'/', stulib_local_root_fol+'/' )
                        pre_roo = anim_root.split(stulib_local_root_fol)[0]
                        full_local_path = pre_roo + local_path
                        print( full_local_path )
