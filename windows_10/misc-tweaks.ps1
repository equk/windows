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
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name MTCUVC
}
sp "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" "EnableMtcUvc" 0

# Set Windows Explorer Default view to This PC

Write-Host ">> Setting Windows Explorer Default view to This PC"
sp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "LaunchTo" 1

# Disable Hiding of Known File Extensions

Write-Host ">> Disabling Hiding of Known File Extensions"
sp "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

# Disable Tablet Lockscreen

Write-Host ">> Disabling Tablet Lockscreen Anniversary"
If (-Not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData"))
{
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI" -Name "SessionData"
}
sp "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData" "AllowLockScreen" 0

Write-Host ">> Disabling Tablet Lockscreen"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Personalization"
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" "NoLockScreen" 1

# Disable Background On Logon Screen (Uses Accent Color set in Personalization instead)

Write-Host ">> Disabling Background On Logon / Lock Screen"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "System"
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "DisableLogonBackgroundImage" 1

# Set Windows Time to UTC (fixes issues with ntp)

Write-Host ">> Setting Windows Time To UTC"
sp "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" "RealTimeIsUniversal" 1
