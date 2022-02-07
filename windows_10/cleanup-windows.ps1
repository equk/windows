#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Cleanup Windows 10
.DESCRIPTION
    Script to Cleanup Windows 10
    Requires Admin Access

    Removes Unwanted Features, Apps & Sponsored Apps

    Twitter: @equilibriumuk

    Created for Windows 10 21H2
.NOTES
    File Name      : disable-optional.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$packages = @(
    "Microsoft.BingWeather"
    "Microsoft.Office.OneNote"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.People"
    "Microsoft.SkypeApp"
    "Microsoft.WindowsMaps"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
)

$sponsors = @(
    "BubbleWitch3Saga"
    "CandyCrush"
    "Dolby"
    "Duolingo-LearnLanguagesforFree"
    "EclipseManager"
    "Facebook"
    "Flipboard"
    "PandoraMediaInc"
    "Royal Revolt"
    "Spotify"
    "Sway"
    "Twitter"
    "Wunderlist"
)

$optionals = @(
    "App.StepsRecorder"
    "Hello.Face.18967"
    "MathRecognizer"
    "Media.WindowsMediaPlayer"
    "OneCoreUAP.OneSync"
    "Print.Fax.Scan"
)

Write-Host ">> Starting Windows 10 Cleanup Script"

Write-Host "    ++ Removing Windows App Packages"
foreach ($package in $packages) {
    Write-Host "      + Removing App $package ..."
    Get-AppxPackage -Name $package | Remove-AppxPackage -ErrorAction SilentlyContinue
}

Write-Host "    ++ Removing Windows Sponsored App Packages"
foreach ($sponsor in $sponsors) {
    Write-Host "      + Removing Sponsored App $sponsor ..."
    Get-AppxPackage | Where-Object Name -cmatch $sponsor | Remove-AppxPackage -ErrorAction SilentlyContinue
}

Write-Host "    ++ Removing Windows Optional Apps"
foreach ($optional in $optionals) {
    Write-Host "      + Removing App $optional ..."
    Get-WindowsCapability -Online -LimitAccess | Where-Object { $_.Name -like $optional } | Remove-WindowsCapability -Online -ErrorAction SilentlyContinue
}

Write-Host ">> Windows 10 Cleanup Script Finished"
Write-Host "+++ Some Changes May Require Restarting Windows +++"
