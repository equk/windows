#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Check Common Used Registry StartUp Locations
.DESCRIPTION
    Check Common Used Registry StartUp Locations
    These Locations Are Often Used By Malware & Viruses But Are Also Used By
    Software (eg: OneDrive)
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : check-startup.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

Write-Host ">> Check Common Used Registry StartUp Locations"

$startupregs = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunServices"
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunServices"
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"
    "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows"
    "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run"
    "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"
    "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows NT\CurrentVersion\Windows\load"
    "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows NT\CurrentVersion\Windows\run"
    )

foreach ($startupreg in $startupregs) {
    If ((Test-Path "$startupreg"))
    {
        Write-Host "++ Key $startupreg"
        Get-ItemProperty $startupreg
    }
}
