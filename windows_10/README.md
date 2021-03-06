# 🍭 Windows_10

A small collection of scripts for Tweaking / Fixing Windows 10

## :white_check_mark: Features

- [x] Disable Telemetry
- [x] Disable Problem Steps Recorder
- [x] Disable Application Impact Telemetry
- [x] Disable Customer Experience Improvement Program
- [x] Disable Unwanted Scheduled Tasks
- [x] Disable Unwanted Services
- [x] Disable SMB1 Protocol
- [x] Disable Cortana
- [x] Disable Windows Store Restrictions
- [x] Set Windows Update Settings Using Group Policy
- [x] Remove Unwanted Apps
- [x] Remove Cortana
- [x] Remove Microsoft OneDrive
- [x] Remove Microsoft Edge Browser
- [x] Download & Install Firefox Using Powershell

*More detail can be found in comments within scripts*

##  :page_with_curl: Blocklists

- [x] Automate Firewall Rules Using IP Blocklists
- [x] Automate Hosts Blocking Using DNS Blocklists

Updated Lists:

- [FilterLists](https://github.com/collinbarrett/FilterLists)
- [Pi-hole Blocklist Collection](https://firebog.net/)

## :page_facing_up: Scripts

#### General Disable Scripts

- disable-cortana.ps1
- disable-optional.ps1
- disable-services.ps1
- disable-tasks.ps1
- disable-telemetry.ps1

#### Firewall Rule Automation Scripts

- fw-blocklist.ps1
- fw-block.ps1
- hosts-blocklist.ps1

#### Personal Optional Settings

- misc-tweaks.ps1
- remove-apps.ps1
- set-windowsupdate.ps1

#### Download & Install Apps From Powershell

- firefox-inst.ps1

#### Remove Unwanted Components

- cleanup/rem-cortana.ps1
- cleanup/rem-msedge.ps1
- cleanup/rem-onedrive.ps1
- cleanup/rem-people.ps1
- cleanup/rem-sysapps.ps1

#### Set Power Options

- power/set_power.cmd

### :bulb: Example Run Order

:loudspeaker: install windows with no network connected

:warning: *scripts must be run as administrator*

- [ ] ⚙️ enable_scripts.cmd
- [ ] ⚙️ disable-tasks.ps1
- [ ] ⚙️ disable-services.ps1
- [ ] ⚙️ disable-cortana.ps1
- [ ] ⚙️ disable-telemetry.ps1
- [ ] ⚙️ remove-apps.ps1
- [ ] ⚙️ hosts-blocklist.ps1 telemetry_hosts.txt
- [ ] ⚙️ misc-tweaks.ps1
- [ ] ⚙️ set-windowsupdate.ps1
- [ ] ⚙️ cleanup/rem-onedrive.ps1
- [ ] :bulb: reboot
- [ ] ⚙️ firefox-inst.ps1
- [ ] ⚙️ cleanup/rem-msedge.ps1
- [ ] ⚙️ cleanup/rem-sysapps.ps1
- [ ] ⚙️ power/set_power.cmd

### 🖧 net_tweaks

Run `../tweaks/net_tweaks.cmd` to set `TcpAckFrequency` & `TCPNoDelay` on all network adapters

## :memo: Notes

#### 2004

- Windows Defender Detects Changes to HOSTS File
- Windows Defender Potentially Unwanted App (PUA) App Blocking Protection
- cortana renamed from `Microsoft.Windows.Cortana` to `Microsoft.Windows.Search`

HOSTS file changes are detected as this is a known vector for malware.

If you make changes yourself you can simply click Allow.

PUA protection has been known to remove some apps people find useful & it can be disabled if it causes problems.

```
Set-MpPreference -PUAProtection 0
```

PUA protection may be useful so it's really down to personal preference.

#### 1909

- 1909 features new app package `Microsoft.Windows.StartMenuExperienceHost`
- 1909 new service `autotimesvc        Cellular Time`

#### 1809

Microsoft Edge browser background process re-spawns the cortana searchui process if it gets killed.

*It is possible to remove cortana after removing msedge*

#### 1803

Added new script to remove Microsoft Edge browser as it now seems to run in the background.

*Microsoft seem to have removed the GPO for disabling cortana in Software Policies.*

#### :warning: Cleanup

*Cleanup folder contains scripts which could cause problems with Windows Components as it removes unwanted applications / components.*

*Some updates will re-install Microsoft Edge Browser & Cortana (can be removed again running the scripts after update)*

# Contact

Website: https://equk.co.uk

Twitter: [@equilibriumuk](https://twitter.com/equilibriumuk)
