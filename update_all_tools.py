import os
import subprocess
path = "C:/Users/gasco/Documents/company_tools/jira_manager"
done_ls = []
for pathhh, subdirs, files in os.walk( path  ):
    for name in files:
        if name == 'compile_py3.bat': 
            if pathhh.replace('/','\\\\') + '\\\\' + name not in done_ls:
                pathhh = pathhh.replace('/','\\\\')
                print (subdirs)

                #subprocess.Popen( [r'%s'%( pathhh.replace('/','\\\\') +  '\\\\' + name ) ] )
                #done_ls.append( pathhh.replace('/','\\\\') + '\\\\' + name )