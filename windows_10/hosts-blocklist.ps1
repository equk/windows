#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Block Hostnames From A Blocklist Using HOSTS
.DESCRIPTION
    Script to Block Hostnames From A Blocklist Using HOSTS
    Made as a simple way to block hostnames addresses in HOSTS
    Requires Admin Access
    Twitter: @equilibriumuk 
.PARAMETER BlockList
    Input a Blocklist of hostnames you would like to block in using HOSTS
.NOTES
    File Name      : hosts-blocklist.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$True,Position=1)]
    [string] $BlockList
    )

$hostnames = Get-Content (Join-Path $PSScriptRoot $BlockList)
$hosts_file = "$env:systemroot\System32\drivers\etc\hosts"

foreach ($hostname in $hostnames) {
    if (-Not (Select-String -Path $hosts_file -Pattern $hostname)) {
        echo "0.0.0.0 $hostname" | Out-File -Encoding ASCII -Append $hosts_file
    }
}