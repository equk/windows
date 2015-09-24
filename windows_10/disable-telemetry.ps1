#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Disable Telemetry & Related Processes in Windows 10
.DESCRIPTION
    Disable Telemetry & Related Processes in Windows 10
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : disable-telemetry.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

# Disable Telemetry
Write-Host ">> Disabling Telemetry in SOFTWARE Policies"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name DataCollection
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0
sp "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0
# Disable Problem Steps Recorder (see README.md for more info)
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name AppCompat
}
Write-Host ">> Disabling Problem Steps Recorder in SOFTWARE Policies"
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableUAR" 1
# Disable Application Impact Telemetry
Write-Host ">> Disabling Application Impact Telemetry in SOFTWARE Policies"
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "AITEnable" 0
# Disable Customer Experience Improvement Program
Write-Host ">> Disabling Customer Experience Improvement Program in SOFTWARE Policies"
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft" -Name SQMClient
}
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows"))
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient" -Name Windows
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" "CEIPEnable" 0
Write-Host ">> SOFTWARE Policies Applied"
Write-Host "++ Make sure you run disable-services.ps1 & disable-tasks.ps1"
Write-Host "++ to disable all telemetry & ceip related services & tasks"