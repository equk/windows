#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Remove Default Windows AppStore Apps
.DESCRIPTION
    Script to Remove Default Windows AppStore Apps
    Removes All Default Apps From System (excl some MS)
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : disable-services.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
    Non-Removable  : 
                    Microsoft.BioEnrollment
                    Microsoft.MicrosoftEdge
                    Microsoft.Windows.Cortana
                    Microsoft.WindowsFeedback
                    Microsoft.XboxGameCallableUI
                    Microsoft.XboxIdentityProvider
                    Windows.ContactSupport
.LINK
    Script posted on github:
    https://github.com/equk
#>

Write-Host "Removing All Market Apps"
Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online
Get-AppxPackage -AllUsers | Remove-AppxPackage
Clear-Host
Write-Host "Most Market Apps Removed"
Write-Host "Some Apps Are Not Removable - See Notes"