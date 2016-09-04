#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Disable Windows 10 LockApp
.DESCRIPTION
    Script to Disable Windows 10 LockApp
    Disables LockScreen but unfortunately logon does not change as windows
    has files in system32 & winSxS for persistence
    Just one of many annoying changes from the anniversary update
    Requires Admin Access
    Twitter: @equilibriumuk
.NOTES
    File Name      : disable-lockapp.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$sysapppath = "$env:systemroot\SystemApps"
$sysapps = @(
    "Microsoft.LockApp_cw5n1h2txyewy"
    )

Write-Host ">> Moving Folders"
foreach ($sysapp in $sysapps) {
    if (Test-Path $sysapppath\$sysapp) {
        mv $sysapppath\$sysapp $sysapppath\$sysapp"_disabled"
    }
}
