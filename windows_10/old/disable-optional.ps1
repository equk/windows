#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Disable Optional Features in Windows 10
.DESCRIPTION
    Script to Disable Optional Features in Windows 10
    Requires Admin Access
    I have left "Printing-PrintToPDFServices-Features"
    Twitter: @equilibriumuk
.NOTES
    File Name      : disable-optional.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$features = @(
    "MediaPlayback"
    "SMB1Protocol"
    "Xps-Foundation-Xps-Viewer"
    "WorkFolders-Client"
    "WCF-Services45"
    "NetFx4-AdvSrvs"
    "Printing-Foundation-Features"
    "Printing-XPSServices-Features"
    "MSRDC-Infrastructure"
    "MicrosoftWindowsPowerShellV2Root"
    "Internet-Explorer-Optional-amd64"
)
foreach ($feature in $features) {
    Write-Host " Disabling Optional Feature $service ..."
    Disable-WindowsOptionalFeature -Online -FeatureName $feature -NoRestart
}