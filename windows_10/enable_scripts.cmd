@echo off
echo allowing users to run powershell scripts
echo.
echo for more information see: http://go.microsoft.com/fwlink/?LinkID-135170
echo.
pause
echo setting execution policy
powershell "Set-ExecutionPolicy Unrestricted"
echo unblocking scripts included in this folder & subfolders
powershell "ls -Recurse *.ps1 | Unblock-File"
powershell "ls -Recurse *.psm1 | Unblock-File"
echo all scripts within this folder should now run without security prompt
pause
