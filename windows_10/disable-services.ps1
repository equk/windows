<#
.SYNOPSIS
    Script to Disable Specific Services in Windows
.DESCRIPTION
    Script to Disable Specific Services in Windows
    Made With Privacy In Mind But Can Be Adapted / Tweaked Accordingly
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : disable-services.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V2
    Copyright 2015 - B.Walden
.LINK
    Script posted on github:
    https://github.com/equk
#>

$services = @(
    # Services Considered To Have Spying Capabilities
    "DcpSvc"                                   # Data Collection and Publishing Service
)

foreach ($service in $services) {
    Get-Service -Name $service | Stop-Service -Force | Set-Service -StartupType Disabled
}
