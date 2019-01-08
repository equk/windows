# Windows

This repo holds tweaks for Windows

The main activity is in the windows_10 folder

## Windows_10

Lots of scripts to tweak Microsoft Windows 10

### 1803 / 1809

Scripts still relevant, added new script to remove Microsoft Edge browser as it now seems to run in the background for some reason.

The remove cortana cleanup script sometimes errors as the process doesn't seem to close but works if you run multiple times.

Microsoft also seem to have removed the GPO for disabling cortana in Software Policies.

- 13 May 2018 added script to remove unwanted optional features from windows 10
- 13 May 2018 added a script for removing cortana searchui.exe (alternative to rem-sysapps)
- 12 May 2018 added Disable Automatic Sample Submission W Defender to misc-tweaks
- 12 May 2018 Added rem-people script to remove Microsoft People Experience
- 05 May 2018 added script to remove Microsoft Edge
- 23 May 2017 added new telemetry hosts to blocklist
- 23 May 2017 added more registry keys to disable-cortana.ps1
- 23 May 2017 added more windows services to disable list
- 23 May 2017 added if statement to only disable known services in disable-services
- 22 May 2017 updated enable_scripts.cmd to unblock powershell scripts in win10
- 17 May 2017 added info re: windows creators update
- 11 Jan 2017 added loop to rem-sysapps to allow for removal of cortana after running windows update
- 10 Jan 2017 added disable cortana searchbar in systray to misc-tweaks

Scripts feature ability to disable various Microsoft technologies / services which can be considered to spy or report on users of the Operating System. eg: Telemetry, Problem Steps Recorder, Application Impact Telemetry, Customer Experience Improvement Program, Geolocation, Biometric Information, Browser History ...

Cleanup folder features scripts to remove Microsoft OneDrive & move components relating to indexing of information within files (Cortana), reporting & information gathering.

rem-sysapps should now remove cortana etc multiple times meaning you can re-run the script to remove cortana when windows update re-installs cortana (which it seems to do frequently).


Some other useful scripts in the windows 10 folder:

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
