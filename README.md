# Windows

This repo holds tweaks for Windows

The main activity is in the windows_10 folder

## Windows_10

Lots of scripts to tweak Microsoft Windows 10

Last 5 Commits:

- 11 Jan 2017 added loop to rem-sysapps to allow for removal of cortana after running windows update
- 10 Jan 2017 added disable cortana searchbar in systray to misc-tweaks
- 10 Jan 2017 added remove-bloat script for anniversary update consumer experience :rage:
- 10 Jan 2017 added remove windows consumer features to misc-tweaks
- 9 Sep 2016 added SearchboxTaskbarMode to disable-cortana script

Scripts feature ability to disable various Microsoft technologies / services which can be considered to spy or report on users of the Operating System. eg: Telemetry, Problem Steps Recorder, Application Impact Telemetry, Customer Experience Improvement Program, Geolocation, Biometric Information, Browser History ...

Cleanup folder features scripts to remove Microsoft OneDrive & move components relating to indexing of information within files (Cortana), reporting & information gathering.

rem-sysapps should now remove cortana etc multiple times meaning you can re-run the script to remove cortana when windows update re-installs cortana (which it seems to do frequently).


```
cleanup
    rem-lockapp.ps1     removes ugly lockscreen
    rem-onedrive.ps1    removes onedrive
    rem-sysapps.ps1     removes cortana, feedback & support
```

Info regarding lockapp can be found in info/lockapp.md

Some other Useful scripts in the windows 10 folder:

```
fw-blocklist        Windows Firewall Extension scripts - allows use of IP Blocklists
hosts-blocklist     HOSTS script to block hosts from blocklists.
misc-tweaks         Tweak appearance of lockscreen & various other personal usability tweaks
```

<details><summary>Microsoft References</summary>
<a href="https://technet.microsoft.com/en-us/itpro/windows/manage/configure-windows-telemetry-in-your-organization">Configure Windows telemetry in your organization</a>

<a href="https://technet.microsoft.com/en-us/itpro/windows/manage/manage-connections-from-windows-operating-system-components-to-microsoft-services#bkmk-priv-feedback">Manage connections from Windows operating system components to Microsoft services</a></details>

## Powershell

This folder has a few basic scripts, the most useful is **check-startup** which checks registry locations known to be used by malware & viruses to initiate on windows startup.

## Tweaks

This folder has some old tweaks I made for Windows 7 which can still be used in Windows 8.1 / 10.

```
net_tweaks              sets TcpAckFrequency & TCPNoDelay to 1 on all network interfaces within the system
rem_spy_updates         removes Windows 7 & 8 updates which relate to install of telemetry
```

Most of the scripts here are documented on [my personal blog website](https://equk.co.uk/)
