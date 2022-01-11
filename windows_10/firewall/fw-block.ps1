#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Block a IP Address In Windows Firewall
.DESCRIPTION
    Script to Block a IP Address In Windows Firewall
    Made as a simple way to block IP addresses in powershell
    Only really created as I use linux and like to use cli for admin tasks
    Requires Admin Access
    Twitter: @equilibriumuk 
.PARAMETER Action
    Valid Actions are Add or Remove
.PARAMETER IpAddress
    Input the IP address you would like to block in Windows Firewall
    You can also remove a firewall rule based on this string
.NOTES
    File Name      : fw-block.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true,Position=1)]
    [ValidateSet("Add","Remove")]
    [string] $Action,
    [Parameter(Mandatory=$True,Position=2)]
    [string] $IpAddress
    )

switch ($Action) {
    "Add" {
        Write-Host "Adding block to IP addresses in firewall"
        New-NetFirewallRule -DisplayName "Block '$IpAddress'" -Group "CLI Added IP Block" -Action block -Direction out -Profile Any -Protocol Any -RemoteAddress $IpAddress
    }
    "Remove" {
        Write-Host "Removing block to IP addresses in firewall"
        Remove-NetFirewallRule -DisplayName "Block '$IpAddress'"
    }
}