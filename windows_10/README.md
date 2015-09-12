#Windows_10

This is a small collection of scripts for Tweaking / Fixing Windows 10

    disable-services.ps1
    disable-tasks.ps1
    fw-blocklist.ps1
    fw-block.ps1
    README.md
    remove-apps.ps1
    set-windowsupdate.ps1

##Specific Information

###disable-services

Disables a lot of built-in Windows Services which could be considered privacy 
or security risks due to the information they collect.

***examples:** geolocation, sensors, remote access, remote registry, biomatrics, file & email content indexing*

###disable-tasks

Disables some data collecting scheduled tasks built-in to windows 10.


      Disabling Scheduled Tasks


    TaskPath                                       TaskName                          State
    --------                                       --------                          -----
    \Microsoft\Windows\AppID\                      SmartScreenSpecific               Disabled
    \Microsoft\Windows\Application Experience\     Microsoft Compatibility Appraiser Disabled
    \Microsoft\Windows\Application Experience\     ProgramDataUpdater                Disabled
    \Microsoft\Windows\Autochk\                    Proxy                             Disabled
    \Microsoft\Windows\Customer Experience Impr... Consolidator                      Disabled
    \Microsoft\Windows\Customer Experience Impr... KernelCeipTask                    Disabled
    \Microsoft\Windows\Customer Experience Impr... UsbCeip                           Disabled
    \Microsoft\Windows\DiskDiagnostic\             Microsoft-Windows-DiskDiagnost... Disabled
    \Microsoft\Windows\DiskDiagnostic\             Microsoft-Windows-DiskDiagnost... Disabled
    \Microsoft\Windows\PI\                         Sqm-Tasks                         Disabled

      All Tasks Successfully Disabled


###set-windowsupdate

Sets Windows Update to Notify Before Downloading Available Updates.

The default settings for Windows 10 is to automatically download & install updates.

###remove-apps

Cleans up all possible appstore applications from windows.

Some apps however cannot be removed using this script as they are considered system applications.

    Non-Removable Applications : 
                    Microsoft.BioEnrollment
                    Microsoft.MicrosoftEdge
                    Microsoft.Windows.Cortana
                    Microsoft.WindowsFeedback
                    Microsoft.XboxGameCallableUI
                    Microsoft.XboxIdentityProvider
                    Windows.ContactSupport

I am still adding new scripts and updates to this repo as I have not yet deployed 
Windows 10 as I am still testing in VMs.

If you find the scripts useful or have any tweaks or improvements please contact me on github or on twitter @equilibriumuk