@@echo on
SETLOCAL ENABLEDELAYEDEXPANSION
rem 删除注册表内容无限试用
 
reg query HKEY_CURRENT_USER\Software\Classes | findstr ZQBK >./zqbk.txt
 
for /f %%i in (zqbk.txt) do set var=%%i
reg delete %var% /va /f

del /f /q zqbk.txt