#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Block IP Addresses From A Blocklist In Windows Firewall
.DESCRIPTION
    Script to Block IP Addresses From A Blocklist In Windows Firewall
    Made as a simple way to block IP addresses in powershell
    Requires Admin Access
    Twitter: @equilibriumuk 
.PARAMETER Action
    Valid Actions are Add or Remove
.PARAMETER BlockList
    Input a Blocklist of IP addresses you would like to block in Windows Firewall
    You can also remove a firewall rule based on a Blocklist
.PARAMETER BlockGroup
    Set a custom name for the Blocklist Rules Group
.NOTES
    File Name      : fw-blocklist.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$True,Position=1)]
    [ValidateSet("Add","Remove")]
    [string] $Action,
    [Parameter(Mandatory=$True)]
    [string] $BlockList,
    [Parameter(Mandatory=$False)]
    [string] $BlockGroup
    )

$IpAddList = Get-Content (Join-Path $PSScriptRoot $BlockList)

if (!$BlockGroup) {
    $BlockGroup = "CLI Added IP BlockList"
}

switch ($Action) {
    "Add" {
        Write-Host "Adding blocklist of IP addresses in firewall"
        foreach ($IpAddress in $IpAddList) {
            New-NetFirewallRule -DisplayName "BlockList $IpAddress" -Group $BlockGroup -Action block -Direction out -Profile Any -Protocol Any -RemoteAddress $IpAddress
        }
    }
    "Remove" {
        Write-Host "Removing IP addresses in firewall based on blocklist provided"
        foreach ($IpAddress in $IpAddList) {
            Remove-NetFirewallRule -DisplayName "BlockList $IpAddress"
        }
    }
}