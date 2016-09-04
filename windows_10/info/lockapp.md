# Windows LockApp

Microsoft seem to be forcing LockApp persistence, making it non-optional as
a login screen since the anniversary update.

Windows spawns LockAppHost.exe for persistence.

There have been reports of Microsoft adding advertising on the lockscreen based
on apps you buy or use on the windows store. (I have never used windows store
so haven't experienced this)

Files are protected & backups are available to windows via WinSxS.

For now moving folder C:\Windows\SystemApps\Microsoft.LockApp_cw5n1h2txyewy
works for lockscreen

(Adding a startup script to set registry key on each user also works)


## Movable Files

        Directory: C:\Windows\SystemApps\Microsoft.LockApp_cw5n1h2txyewy


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       16/07/2016     12:47                Assets
    d-----       16/07/2016     15:14                pris
    -a----       16/07/2016     12:42            319 AppxBlockMap.xml
    -a----       16/07/2016     12:42           2180 AppxManifest.xml
    -a----       16/07/2016     12:42           8687 AppxSignature.p7x
    -a----       16/07/2016     12:42        2587488 LockApp.exe
    -a----       16/07/2016     12:42          51904 resources.pri

## Persistent Files

    Directory: C:\Windows\system32


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    -a----       16/07/2016     12:42         579072 LockAppBroker.dll
    -a----       06/08/2016     05:13         381760 LockAppHost.exe
    -a----       16/07/2016     12:43         161792 LockScreenContent.dll
    -a----       16/07/2016     12:43          41472 LockScreenContentHost.dll
    -a----       16/07/2016     12:43          47000 LockScreenContentServer.exe

-

    Directory: C:\Windows\SysWOW64


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    -a----       16/07/2016     12:42         465920 LockAppBroker.dll
    -a----       06/08/2016     05:02         321280 LockAppHost.exe

-

    Directory: C:\Windows\WinSxS


    Mode                LastWriteTime         Length Name
    ----                -------------         ------ ----
    d-----       16/07/2016     15:28                amd64_microsoft-windows-a..esslockapp.appxmain_31bf3856ad364e35_10.0.14393.0_none_6562df2a3b832643
    d-----       16/07/2016     15:28                amd64_microsoft-windows-a..sslockapp.appxsetup_31bf3856ad364e35_10.0.14393.0_none_28b1374a3e074f17
    d-----       16/07/2016     12:42                amd64_microsoft-windows-l..st-abovelockapphost_31bf3856ad364e35_10.0.14393.0_none_a1bf6fe9309a73e5
    d-----       16/07/2016     12:42                amd64_microsoft-windows-lockapp.appxmain_31bf3856ad364e35_10.0.14393.0_none_14e47e03eaa47fc9
    d-----       16/07/2016     12:42                amd64_microsoft-windows-lockapp.appxsetup_31bf3856ad364e35_10.0.14393.0_none_2c5a90b723894a11
    d-----       16/07/2016     12:42                amd64_microsoft-windows-lockappbroker-winrt_31bf3856ad364e35_10.0.14393.0_none_baf32222b51c2229
    d-----       16/07/2016     12:42                amd64_microsoft-windows-lockapphost_31bf3856ad364e35_10.0.14393.0_none_291af6ba79e14715
    d-----       02/09/2016     18:04                amd64_microsoft-windows-lockapphost_31bf3856ad364e35_10.0.14393.82_none_4e2ee08d9e17c567
    d-----       16/07/2016     12:42                wow64_microsoft-windows-l..st-abovelockapphost_31bf3856ad364e35_10.0.14393.0_none_ac141a3b64fb35e0
    d-----       16/07/2016     12:42                wow64_microsoft-windows-lockappbroker-winrt_31bf3856ad364e35_10.0.14393.0_none_c547cc74e97ce424
    d-----       16/07/2016     12:42                wow64_microsoft-windows-lockapphost_31bf3856ad364e35_10.0.14393.0_none_336fa10cae420910
    d-----       02/09/2016     18:04                wow64_microsoft-windows-lockapphost_31bf3856ad364e35_10.0.14393.82_none_58838adfd2788762
