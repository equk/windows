#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Set Options for Windows Update
.DESCRIPTION
    Script to Set Options for Windows Update
    Requires Admin Access
    Settings: Notify Before Downloading Available Updates
    Twitter: @equilibriumuk 
.NOTES
    File Name      : set-windowsupdate.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
    AUOptions      : 0 - Default (Uses Settings UI Which Is Limited In WIN10)
                     1 - Never Check
                     2 - Notify
                     3 - Download & Notify
                     4 - Auto Download & Schedule Install
.LINK
    Script posted on github:
    https://github.com/equk
#>

# WindowsUpdate Settings
Write-Host ">> Setting Windows Update to Notify Before Downloading Available Updates"
If (-Not (Test-Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU"))
{
    mkdir -Force "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU"
}
sp "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "NoAutoUpdate" 0
sp "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "AUOptions" 2
sp "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "ScheduledInstallDay" 0
sp "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "ScheduledInstallTime" 3
# DeliveryOptimization Settings
# Reference: http://windows.microsoft.com/en-us/windows-10/windows-update-delivery-optimization-faq
Write-Host ">> Disabling Microsoft DeliveryOptimization Using Group Policy Settings"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"))
{
    mkdir -Force "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" "DODownloadMode" 0
# Done
Write-Host ">> Finished Setting Windows Update Settings"
Write-Host ">> You should now see 'Some settings are managed by your organization'" 
Write-Host ">> in the advanced options of windows update"