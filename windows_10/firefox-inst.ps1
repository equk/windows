#requires -version 4.0

<#
.SYNOPSIS
    Download Mozilla Firefox Latest
.DESCRIPTION
    Download Mozilla Firefox Latest
    Created for new install of windows 10
    Saves the need to open Edge Browser
    Twitter: @equilibriumuk
.NOTES
    File Name      : firefox-inst.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

# Download Mozilla Firefox Latest

if (Test-Path firefox-latest.exe -PathType leaf) {
    Write-Host "Mozilla Firefox Latest Exists In Folder: firefox-latest.exe"
}
else {
    Write-Host ">> Downloading Latest Version of Mozilla Firefox"
    Invoke-WebRequest 'https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US' -OutFile firefox-latest.exe
    Write-Host ">> Download Complete"
}

Write-Host "++ Executing Firefox Installer..."
& .\firefox-latest.exe
