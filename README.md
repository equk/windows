#Windows

This repo holds tweaks for Windows

The main activity is in the windows_10 folder

##Windows_10

Lots of scripts to tweak Microsoft Windows 10

Scripts feature ability to disable various Microsoft technologies / services which can be considered to spy or report on users of the Operating System. eg: Telemetry, Problem Steps Recorder, Application Impact Telemetry, Customer Experience Improvement Program, Geolocation, Biometric Information, Browser History ...

Also 'cleanup' folder features scripts to remove Microsoft OneDrive & move components relating to indexing of information within files (Cortana), reporting & information gathering.

Some other Useful scripts in the windows 10 folder: 

    fw-blocklist        Windows Firewall Extension scripts - allows use of IP Blocklists
    hosts-blocklist     HOSTS script to block hosts from blocklists.
    misc-tweaks         Tweak appearance of lockscreen & various other personal usability tweaks

##powershell

This folder has a few basic scripts, the most useful is **check-startup** which checks registry locations known to be used by malware & viruses to initiate on windows startup.

##tweaks

This folder has some old tweaks I made for Windows 7 which can still be used in Windows 8.1 / 10.

    net_tweaks              sets TcpAckFrequency & TCPNoDelay to 1 on all network interfaces within the system
    rem_spy_updates         removes Windows 7 & 8 updates which relate to install of telemetry

Most of the scripts here are documented on [my personal blog website](https://equk.co.uk/)
