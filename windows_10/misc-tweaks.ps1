#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Misc Personal Tweaks for Windows 10
.DESCRIPTION
    Misc Personal Tweaks for Windows 10
    Requires Admin Access
    Notes:  Xbox Overlay DVR is known to force vsync
            is a general annoyance & is un-needed due to steam overlay
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

# Disable Windows 10 Xbox Overlay

Write-Host ">> Disabling Xbox Overlay Capture"
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR"))
{
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion" -Name "GameDVR"
}
sp "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" 0
sp "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" "GameDVR_Enabled" 0

# Disable Windows Consumer Features (Stop annoying game tiles appearing)
Write-Host ">> Disabling Windows Consumer Features"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Cloud Content"
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" "DisableWindowsConsumerFeatures" 1

# Disable Cortana Searchbar in System Tray
Write-Host ">> Disabling Cortana Searchbar in System Tray"
If (-Not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"))
{
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion" -Name "Search"
}
sp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" 0
sp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" 0

# Disable Automatic Sample Submission in Windows Defender
Write-Host ">> Disabling Automatic Sample Submission in Windows Defender"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "Spynet"
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" 0
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" 2

# Allow Install of Apps Outside of Windows Store
Write-Host ">> Allowing Install of Apps Outside of Windows Store"
If (-Not (Test-Path "HKLM:\Software\Policies\Microsoft\Windows Defender\SmartScreen"))
{
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "SmartScreen"
}
sp "HKLM:\Software\Policies\Microsoft\Windows Defender\SmartScreen" -Name "ConfigureAppInstallControl" 0

# Disable Windows SmartScreen in Windows Shell
Write-Host ">> Disabling Windows SmartScreen in Windows Shell"
If (-Not (Test-Path "HKLM:\Software\Policies\Microsoft\Windows\System"))
{
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows" -Name "System"
}
sp "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" 0

# Disable Microsoft Remote Assistance
Write-Host ">> Disabling Microsoft Remote Assistance"
sp "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" 0

# Disable Meet Now in Taskbar
Write-Host ">> Disabling Meet Now Feature"
sp "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "HideSCAMeetNow" 1
