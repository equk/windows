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
    Write-Host ">> Personalization Settings not found, creating ..."
    New-Item -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Force
}
sp "HKCU:\Software\Microsoft\Personalization\Settings" "AcceptedPrivacyPolicy" 0
sp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "CortanaEnabled" 0
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
    Write-Host ">> Windows Search not found, creating ..."
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force
    Write-Host ">>"
}
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "AllowCortana" 0
Write-Host ">> Disabling Web Search ( bing ) ..."
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "DisableWebSearch" 1
Write-Host ">> Disabling Connected Search ..."
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "ConnectedSearchPrivacy" 3
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "ConnectedSearchSafeSearch" 3
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "ConnectedSearchUseWeb" 0
sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "ConnectedSearchUseWebOverMeteredConnections" 0
If (-Not (Test-Path "HKCU:\Software\Microsoft\InputPersonalization")) {
    Write-Host ">> InputPersonalization not found, creating ..."
    New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force
    Write-Host ">>"
}
sp "HKCU:\Software\Microsoft\InputPersonalization" "RestrictImplicitTextCollection" 1
sp "HKCU:\Software\Microsoft\InputPersonalization" "RestrictImplicitInkCollection" 1
If (-Not (Test-Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore")) {
    Write-Host ">> Personalization TrainedDataStore not found, creating ..."
    New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Force
    Write-Host ">>"
}
sp "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" "HarvestContacts" 0
Write-Host ">> Disabling Cortana on Taskbar"
sp "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "SearchboxTaskbarMode" 0
Write-Host ">>>> Cortana SOFTWARE Policies Applied"
Write-Host "++ Run cleanup/rem-sysapps.ps1 to remove cortana exe"
