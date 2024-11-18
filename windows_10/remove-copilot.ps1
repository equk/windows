#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Remove Copilot AI in Windows 10
.DESCRIPTION
    Script to Remove Copilot AI in Windows 10
    Requires Admin Access

    Removes Microsoft Copilot AI

    Mastodon: https://hachyderm.io/@equilibriumuk

    Created for Windows 10
.NOTES
    File Name      : remove-copilot.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

Write-Host ">> Starting Windows 10 Copilot Remove Script"

Write-Host "    ++ Removing Microsoft Copilot AI Packages"
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.Copilot*'} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

Write-Host ">> Windows 10 Copilot Remove Script Finished"
