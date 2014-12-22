@echo off
echo removing metro apps
powershell "Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online 2>&1 | Out-Null"
powershell "Get-AppxPackage -AllUsers | Remove-AppxPackage 2>&1 | Out-Null"