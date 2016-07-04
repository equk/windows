@echo off
echo allowing users to run powershell [.ps1] scripts
powershell "Set-ExecutionPolicy Unrestricted -force 2>&1 | Out-Null"
echo done.
pause