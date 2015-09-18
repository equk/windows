#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Misc Personal Tweaks for Windows 10
.DESCRIPTION
    Misc Personal Tweaks for Windows 10
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : misc-tweaks.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

# Use Old Style Volume Mixer

Write-Host ">> Enabling Old Style Volume Mixer"
If (-Not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC"))
{
    New-Item -ErrorAction SilentlyContinue -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name MTCUVC
    New-ItemProperty -ErrorAction SilentlyContinue -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" -Name EnableMtcUvc -Type DWord -Value 0
}

# Set Windows Explorer Default view to This PC

Write-Host ">> Setting Windows Explorer Default view to This PC"
sp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "LaunchTo" 0

# Disable Hiding of Known File Extensions

Write-Host ">> Disable Hiding of Known File Extensions"
sp "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0
