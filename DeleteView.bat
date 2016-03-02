echo Usage: DeleteView.bat VIEW_NAME
SET VIEW_NAME=%1

echo Finding View...
cleartool lsview -host %COMPUTERNAME% -s | grep %VIEW_NAME%$
IF %ERRORLEVEL% EQU 1 (echo %VIEW_NAME% does not exist on %COMPUTERNAME% & exit 0)

echo Found View named %VIEW_NAME% on %COMPUTERNAME%, attempting to remove
cleartool endview -server %VIEW_NAME%

REM I'm going to wait for 10 seconds before deleting the actual view, as I think I may be running into a race condition
ping 127.0.0.1 -n 10 > nul

cleartool rmview -tag %VIEW_NAME%
echo ERRORLEVEL is %ERRORLEVEL%
exit %ERRORLEVEL%