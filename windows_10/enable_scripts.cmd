@echo off
echo allowing users to run powershell scripts
echo.
echo for more information see: about_Execution_Policies
echo.
pause
echo setting execution policy
powershell "Set-ExecutionPolicy Unrestricted"
echo unblocking scripts included in these folders
powershell "ls -Recurse *.ps1 | Unblock-File"
powershell "ls -Recurse *.psm1 | Unblock-File"
echo all scripts within this folder should now run without security prompt
pause
