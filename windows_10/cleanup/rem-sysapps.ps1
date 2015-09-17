#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Disable Pre-Installed SystemApps in Windows 10
.DESCRIPTION
    Script to Disable Pre-Installed SystemApps in Windows 10
    Cortana SearchUI.exe accesses the internet even with cortana disabled
    I remove the other sysapps as they are reporting/feedback apps
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : disable-services.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$sysapppath = "$env:systemroot\SystemApps"
$sysapps = @(
    "ContactSupport_cw5n1h2txyewy"
    "ParentalControls_cw5n1h2txyewy"
    "WindowsFeedback_cw5n1h2txyewy"
    "Microsoft.Windows.Cortana_cw5n1h2txyewy"
    )

Write-Host ">> Killing Cortana Process"
Get-Process *SearchUI* | Stop-Process -Force
Write-Host ">> Moving Folders"
foreach ($sysapp in $sysapps) {
    mv $sysapppath\$sysapp $sysapppath\$sysapp"_disabled"
}