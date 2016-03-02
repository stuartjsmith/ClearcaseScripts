echo Mounting VOBS

cleartool mount -a
cleartool lsvob -long | grep "Active: NO"
IF %ERRORLEVEL% EQU 0 (exit 1) ELSE (exit 0)