for /f %%i in ('cleartool lsview -s -host %computername%') do cleartool startview %%i
exit %ERRORLEVEL%