#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Remove OneDrive From Windows 10
.DESCRIPTION
    Script to Remove OneDrive From Windows 10
    Please note closing explorer.exe is required
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : disable-tasks.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

Import-Module -DisableNameChecking $PSScriptRoot\shared_func.psm1

$OneDrivex86 = "$env:SystemRoot\System32\OneDriveSetup.exe"
$OneDrivex64 = "$env:SystemRoot\SysWOW64\OneDriveSetup.exe"
Write-Host ">>>> Starting OneDrive Removal Process"
Get-Process *OneDrive* | Stop-Process -Force
Start-Sleep 3
Write-Host ">> Starting OneDrive Uninstaller"
if (Test-Path $OneDrivex86)
{
        & $OneDrivex86 "/uninstall"
        Start-Sleep 15
}

if (Test-Path $OneDrivex64)
{
        & $OneDrivex64 "/uninstall"
        Start-Sleep 20
}
Write-Host ">> Killing explorer.exe"
taskkill /F /IM explorer.exe
Write-Host ">> Cleaning up OneDrive files"
if (Test-Path "$env:USERPROFILE\OneDrive") { rd "$env:USERPROFILE\OneDrive" -Recurse -Force }
if (Test-Path "C:\OneDriveTemp") { rd "C:\OneDriveTemp" -Recurse -Force }
if (Test-Path "$env:LOCALAPPDATA\Microsoft\OneDrive")
{
        cmd.exe "/c takeown /f `"$env:LOCALAPPDATA\Microsoft\OneDrive`" /r /d y && icacls `"$env:LOCALAPPDATA\Microsoft\OneDrive`" /grant administrators:F /t"
        Start-Sleep 1
        rd "$env:LOCALAPPDATA\Microsoft\OneDrive" -Recurse -Force
}
if (Test-Path "$env:PROGRAMDATA\Microsoft OneDrive") { rd "$env:PROGRAMDATA\Microsoft OneDrive" -Recurse -Force }

if (Test-Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}")
{
        TakeOwnership-RegKey "ClassesRoot" "CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
        Remove-Item -ErrorAction SilentlyContinue -Force -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse
}
if (Test-Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}")
{
        TakeOwnership-RegKey "ClassesRoot" "Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
        Remove-Item -ErrorAction SilentlyContinue -Force -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse
}
Start-Sleep 1
Write-Host ">> Cleanup Finished"
Write-Host ">> Starting explorer.exe"
Start-Process explorer.exe
Write-Host ">>>> Script Finished - May Require 2nd run after reboot to cleanup files"
