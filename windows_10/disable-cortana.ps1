#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Disable Cortana in Windows 10
.DESCRIPTION
    Disable Cortana in Windows 10
    Requires Admin Access
    Run cleanup/rem-sysapps.ps1 to remove cortana exe
    Twitter: @equilibriumuk
.NOTES
    File Name      : disable-cortana.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

# Disable Cortana
Write-Host ">>>> Disabling Cortana"
If (-Not (Test-Path "HKCU:\Software\Microsoft\Personalization\Settings")) {
    Write-Host ">> Personalization Settings not found creating ..."
    New-Item -Path "HKCU:\Software\Microsoft\Personalization\Settings"
}
sp "HKCU:\Software\Microsoft\Personalization\Settings" "AcceptedPrivacyPolicy" 0
If (-Not (Test-Path "HKCU:\Software\Microsoft\InputPersonalization")) {
    Write-Host ">> InputPersonalization not found creating ..."
    New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization"
}
sp "HKCU:\Software\Microsoft\InputPersonalization" "RestrictImplicitTextCollection" 1
sp "HKCU:\Software\Microsoft\InputPersonalization" "RestrictImplicitInkCollection" 1
If (-Not (Test-Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore")) {
    Write-Host ">> Personalization TrainedDataStore not found creating ..."
    New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore"
}
sp "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" "HarvestContacts" 0
Write-Host ">> Disabling Cortana on Taskbar"
sp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "SearchboxTaskbarMode" 0
Write-Host ">>>> Cortana SOFTWARE Policies Applied"
Write-Host "++ Run cleanup/rem-sysapps.ps1 to remove cortana exe"
