set compile_command=import os,compileall;compileall.compile_dir(os.getcwd(),force=True,quiet=True)

"%ProgramFiles%/Autodesk/Maya2023/bin/mayapy" -c "%compile_command%"
"C:/Users/gasco/AppData/Local/Programs/Python/Python312/python.exe" -c "%compile_command%"
"%ProgramFiles%/Autodesk/Maya2023/bin/mayapy" "rename_cache.py"
pause