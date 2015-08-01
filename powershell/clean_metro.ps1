#requires -version 4.0
#requires -runasadministrator
Write-Host "Removing All Metro/Market Apps"
Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online
Get-AppxPackage -AllUsers | Remove-AppxPackage
Clear-Host
Write-Host "Metro/Market Apps Removed"
