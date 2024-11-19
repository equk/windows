#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Disable Specific Scheduled Tasks in Windows
.DESCRIPTION
    Script to Disable Specific Scheduled Tasks in Windows
    Made With Privacy In Mind But Can Be Adapted / Tweaked Accordingly
    Requires Admin Access
    Mastodon: https://hachyderm.io/@equilibriumuk
.NOTES
    File Name      : disable-tasks.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$tasks = @(
    "SmartScreenSpecific"
    "Microsoft Compatibility Appraiser"
    "ProgramDataUpdater"
    "Proxy"
    "Consolidator"
    "KernelCeipTask"
    "UsbCeip"
    "Microsoft-Windows-DiskDiagnosticDataCollector"
    "Microsoft-Windows-DiskDiagnosticResolver"
    "Sqm-Tasks"
    "DmClient"                                  # User Feedback
    "DmClientOnScenarioDownload"                # User Feedback
    "QueueReporting"                            # User Application Experience
    "MareBackup"                                # User Application Experience
    "StartupAppTask"                            # User Application Experience
    "PcaPatchDbTask"                            # User Application Experience
    "MapsUpdateTast"                            # Bing Maps
)

Write-Host ""
Write-Host "  Disabling Scheduled Tasks"
Write-Host ""

foreach ($task in $tasks) {
    Get-ScheduledTask -TaskName "$task" -ErrorAction SilentlyContinue | % { Disable-ScheduledTask -TaskName $_.TaskName -TaskPath $_.TaskPath }
}

Write-Host ""
Write-Host "  All Tasks Successfully Disabled"
Write-Host ""