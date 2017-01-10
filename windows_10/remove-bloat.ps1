#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Remove Specific Apps & Games in Windows 10
.DESCRIPTION
    Script to Remove Specific Apps & Games in Windows 10
    These were added in the anniversary update & seem to
    relate to Windows Consumer Features
    Note: remove-apps.ps1 does not remove them (check start menu)
    Requires Admin Access
    Twitter: @equilibriumuk
.NOTES
    File Name      : remove-bloat.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$packages = @(
    # Apps & Games added with anniversary update
    "9E2F88E3.Twitter"
    "king.com.CandyCrushSodaSaga"
    "4DF9E0F8.Netflix"
    "D52A8D61.FarmVille2CountryEscape"
    "GAMELOFTSA.Asphalt8Airborne"
    "TuneIn.TuneInRadio"
    "Microsoft.Advertising.Xaml"
    "Microsoft.MinecraftUWP"
    "2FE3CB00.PicsArt-PhotoStudio"
)

foreach ($package in $packages) {
    Write-Host "Removing Package $package"
    Get-AppxPackage -Name $package | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | where DisplayName $package | Remove-AppxProvisionedPackage -Online
}
