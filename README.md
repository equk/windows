# 💎 Windows

Tweaks, Fixes & Information for Windows

The main activity is in the `windows_10` folder

Almost all tweaks are in Powershell

## 🍭 Windows_10

A collection of scripts for Tweaking / Fixing Windows 10

- [x] Disable Telemetry
- [x] Disable Problem Steps Recorder
- [x] Disable Application Impact Telemetry
- [x] Disable Customer Experience Improvement Program
- [x] Disable Unwanted Scheduled Tasks
- [x] Disable Unwanted Services
- [x] Disable SMB1 Protocol
- [x] Disable Windows Store Restrictions
- [x] Disable Wifi Sense
- [x] Disable Windows Timeline
- [x] Disable User Application Experience Feedback
- [x] Set Windows Update Settings Using Group Policy
- [x] Remove Unwanted Apps
- [x] Remove Sponsored Apps (eg: spotify, facebook, disney+)
- [x] Remove Cortana
- [x] Remove Microsoft OneDrive
- [x] Remove Microsoft Edge Browser
- [x] Download & Install Firefox Using Powershell
- [x] Automate Firewall Rules Using IP Blocklists
- [x] Automate Hosts Blocking Using DNS Blocklists
- [x] Remove Copilot AI Packages

### 21H2

- System Apps now have uninstall options
- Includes stable Microsoft Edge
- Windows Hello Face
- Windows Meet Now

21H2 apps added to cleanup-windows script

### 2004

#### Microsoft Defender

- Detects Changes to HOSTS File
- Potentially Unwanted App (PUA) App Blocking Protection

HOSTS file changes are detected as this is a known vector for malware.

If you make changes yourself you can simply click Allow.

PUA protection has been known to remove some apps people find useful & it can be disabled if it causes problems.

```
Set-MpPreference -PUAProtection 0
```

PUA protection may be useful so it's really down to personal preference.

#### Cortana

- now renamed from `Microsoft.Windows.Cortana` to `Microsoft.Windows.Search`
- location of files now `Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy`
- `rem-cortana.ps1` & `rem-sysapps.ps1` updated to fix this

### 1909

Tweaked scripts to reduce errors with scheduled tasks & services.

#### 1909 new install changes

- 1909 features new app package `Microsoft.Windows.StartMenuExperienceHost`
- 1909 new service `autotimesvc        Cellular Time`

1909 New Scheduled Tasks

    \Microsoft\Windows\Work Folders\               Work Folders Logon Synchroniza... Ready
    \Microsoft\Windows\Work Folders\               Work Folders Maintenance Work     Ready
    \Microsoft\Windows\Workplace Join\             Automatic-Device-Join             Disabled
    \Microsoft\Windows\Workplace Join\             Device-Sync                       Disabled
    \Microsoft\Windows\Workplace Join\             Recovery-Check                    Disabled
    \Microsoft\Windows\WwanSvc\                    NotificationTask                  Ready
    \Microsoft\XblGameSave\                        XblGameSaveTask                   Ready

### 1803 / 1809

Scripts still relevant, added new script to remove Microsoft Edge browser as it now seems to run in the background for some reason.

Microsoft also seem to have removed the GPO for disabling cortana in Software Policies.

Scripts feature ability to disable various Microsoft technologies / services which can be considered to spy or report on users of the Operating System. eg: Telemetry, Problem Steps Recorder, Application Impact Telemetry, Customer Experience Improvement Program, Geolocation, Biometric Information, Browser History ...

Cleanup folder features scripts to remove Microsoft OneDrive & move components relating to indexing of information within files (Cortana), reporting & information gathering.

<details><summary>Microsoft References</summary>
<a href="https://technet.microsoft.com/en-us/itpro/windows/manage/configure-windows-telemetry-in-your-organization">Configure Windows telemetry in your organization</a>

<a href="https://technet.microsoft.com/en-us/itpro/windows/manage/manage-connections-from-windows-operating-system-components-to-microsoft-services#bkmk-priv-feedback">Manage connections from Windows operating system components to Microsoft services</a></details>

## 🐚 Powershell

This folder has a few basic scripts, the most useful is **check-startup** which checks registry locations known to be used by malware & viruses to initiate on windows startup.

## 👍 Tweaks

This folder has some old tweaks I made for Windows 7 which can still be used in Windows 8.1 / 10.

```
net_tweaks              sets TcpAckFrequency & TCPNoDelay to 1 on all network interfaces within the system
rem_spy_updates         removes Windows 7 & 8 updates which relate to install of telemetry
```

Most of the scripts here are documented on [my personal blog website](https://equk.co.uk/)

# Contact

Website: https://equk.co.uk

Twitter: [@equilibriumuk](https://twitter.com/equilibriumuk)
