#requires -version 4.0
#requires -runasadministrator

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
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$services = @(
    # Services Considered To Have Spying Capabilities
    "DcpSvc"                                   # Data Collection and Publishing Service
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "SensrSvc"                                 # Monitors Various Sensors
    "dmwappushservice"                         # WAP Push Message Routing Service
    "lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Downloaded Maps Manager
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "TrkWks"                                   # Distributed Link Tracking Client
    "WbioSrvc"                                 # Windows Biometric Service
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    "WSearch"                                  # Windows Search
    # Gaming Based Services
    "XblAuthManager"                           # Xbox Live Auth Manager
    "XblGameSave"                              # Xbox Live Game Save Service
    "XboxNetApiSvc"                            # Xbox Live Networking Service
    # Windows HomeGroup Services
    "HomeGroupListener"                        # HomeGroup Listener
    "HomeGroupProvider"                        # HomeGroup Provider
    # Other Optional
    #"bthserv"                                 # Bluetooth Support Service
    #"wscsvc"                                  # Security Center Service
    #"WlanSvc"                                 # WLAN AutoConfig
    "OneSyncSvc"                               # Sync Host Service
    "AeLookupSvc"                              # Application Experience Service
    "PcaSvc"                                   # Program Compatibility Assistant
    #"WinHttpAutoProxySvc"                     # WinHTTP Web Proxy Auto-Discovery
    "UPNPHOST"                                 # Universal Plug & Play Host
    "ERSVC"                                    # Error Reporting Service
    "WERSVC"                                   # Windows Error Reporting Service
    "SSDPSRV"                                  # SSDP Discovery Service
    "CDPSvc"                                   # Connected Devices Platform Service
    "DsSvc"                                    # Data Sharing Service
    "DcpSvc"                                   # Data Collection and Publishing Service
    "lfsvc"                                    # Geolocation service
)

foreach ($service in $services) {
    if ( Get-Service "$service*" -Include $service ) {
        Write-Host " Disabling Service $service ..."
        Get-Service -Name $service | Stop-Service -Force
        Get-Service -Name $service | Set-Service -StartupType Disabled
    }
}
