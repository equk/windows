#Windows

This repo will hopefully hold various scripts for windows administration and tweaking.
Should include cmd files, config files, reg files and powershell scripts.

##Folders
    
    Tweaks          - scripts to tweak windows
        net_tweaks  - changes attributes in registry for tweaking network
        rem_spy_updates - removes windows updates relating to telemetry

    Powershell
        enable_scripts.cmd  - allows execution of ps1 powershell scripts
        clean_metro.cmd - clean metro apps by execuriting powershell
        clean_metro.ps1 - powershell script for cleaning metro apps

    win10_conn.md       - Windows 10 System Connections
                          (telemetry / keylogging / cortana / mic & cam stream upload)

Some of these scripts are now documented on my website on the [Windows 8.1 Tweaks](https://equk.co.uk/windows-8-1-tweaks/) page

01-08-2015 - I have tested clean_metro.ps1 on windows 10 & it removes a lot of the bloat successfully.