echo Usage: CreateView.bat CLEARCASE_ROOT(e.g. M:) VIEW_NAME REGION [CONFIG_SPEC(Latest)] [ENABLE_WINKIN(true)]
SET CLEARCASE_ROOT=%1
SET VIEW_NAME=%2
SET REGION=%3
SET CONFIG_SPEC=Latest
if NOT "%4"=="" SET CONFIG_SPEC=%4
SET WINKIN=n
if /I "%5"=="true" SET WINKIN=
 
echo Creating new view at %CLEARCASE_ROOT%\%VIEW_NAME% on %COMPUTERNAME% with Config Spec %CONFIG_SPEC% in Region %REGION%
if "%WINKIN%"=="n" (echo WINKIN IS DISABLED ON THIS VIEW) else (echo WINKIN IS ENABLED ON THIS VIEW)

cleartool mkview -tag %VIEW_NAME% -region %REGION% -%WINKIN%shareable_dos \\%COMPUTERNAME%\views\%VIEW_NAME%.vws
cd /d %CLEARCASE_ROOT%\%VIEW_NAME%
if /I NOT "%CONFIG_SPEC%"=="latest" cleartool setcs %CONFIG_SPEC%
cleartool catcs
