#requires -version 4.0

<#
.SYNOPSIS
    Mouse Settings for Windows 10
.DESCRIPTION
    Mouse Settings for Windows 10
    Based on 1600dpi @ 500hz
    Writes Settings to Current User
    (No Admin Access Required)
    Twitter: @equilibriumuk
.NOTES
    File Name      : mouse-settings.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

Write-Host ">> Setting Mouse Settings"
If (-Not (Test-Path "HKCU:\Control Panel\Mouse"))
{
    New-Item -Path "HKCU:\Control Panel" -Name Mouse
}

# Set Mouse Sensitivity
Write-Host ">> Setting Mouse Sensitivity"
sp "HKCU:\Control Panel\Mouse" "MouseSensitivity" 6

# Disable Mouse Acceleration
Write-Host ">> Disabling Mouse Acceleration"
sp "HKCU:\Control Panel\Mouse" "MouseThreshold1" 0
sp "HKCU:\Control Panel\Mouse" "MouseThreshold2" 0

Write-Host ">> Mouse Settings Set"