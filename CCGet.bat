echo Usage: CCGet.bat PATH_CONTAINING_FOLDER FOLDER BRANCH
echo Pulls code from Clearcase onto your local disk

SET CURRENT_DIR=%CD%
SET PATH_CONTAINING_FOLDER=%1
SET FOLDER=%2
SET CONFIG_SPEC=Latest
if NOT "%3"=="" SET CONFIG_SPEC=%3
SET VIEW_NAME=%USERNAME%_CCGet_Temp

call "%~dp0\CreateView" M: %VIEW_NAME% vpd_ches %CONFIG_SPEC% 
cd /d %CURRENT_DIR%
robocopy M:\%VIEW_NAME%\%PATH_CONTAINING_FOLDER%\%FOLDER% %CURRENT_DIR%\%FOLDER% /MIR
call cmd /K "%~dp0\DeleteView" %VIEW_NAME%
cd /d %CURRENT_DIR%\%FOLDER%