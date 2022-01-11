#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Disable Pre-Installed SystemApps in Windows 10
.DESCRIPTION
    Script to Disable Pre-Installed SystemApps in Windows 10
    Cortana SearchUI.exe accesses the internet even with cortana disabled
    I remove the other sysapps as they are reporting/feedback apps
    Note: Make sure Cortana is first in list if req'd as process respawns quickly
    Also if you get access denied, run the script twice
    Requires Admin Access
    Twitter: @equilibriumuk
.NOTES
    File Name      : rem-sysapps.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$sysapppath = "$env:systemroot\SystemApps"
$sysapps = @(
    "Microsoft.Windows.Cortana_cw5n1h2txyewy"
    "Microsoft.Windows.Search_cw5n1h2txyewy"
    "ContactSupport_cw5n1h2txyewy"
    "ParentalControls_cw5n1h2txyewy"
    "WindowsFeedback_cw5n1h2txyewy"
    )

Write-Host ">> Killing Cortana Process"
Get-Process *SearchUI* | Stop-Process -Force
Get-Process *SearchApp* | Stop-Process -Force
Get-Process *RemindersServer* | Stop-Process -Force
Get-Process *RuntimeBroker* | Stop-Process -Force
Write-Host ">> Moving Folders"
foreach ($sysapp in $sysapps) {
    [int]$i = "1"
    $dis = "_disabled"
    $moveto = "$sysapppath\$sysapp$dis"
    $movefrom = "$sysapppath\$sysapp"
    if (Test-Path $sysapppath\$sysapp) {
        if (Test-Path $moveto) {
            do {
                Write-Host ">> WARN: folder already exists"
                Write-Host ">> moving app $sysapp to $moveto$i"
                mv $sysapppath\$sysapp $moveto$i -EA SilentlyContinue
                $i++
                }
            until (!(Test-Path $sysapppath\$sysapp))
        }
        else {
            mv $sysapppath\$sysapp $moveto
            Write-Host ">> moving app $sysapp to $moveto"
        }
    }
}
