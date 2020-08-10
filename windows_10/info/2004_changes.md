# Windows 10 Changes (1909 - 2004)

## cortana

- now renamed from `Microsoft.Windows.Cortana` to `Microsoft.Windows.Search`
- location of files now `Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy`

## new services

MixedRealityOpe... Windows Mixed Reality OpenXR Service
UdkUserSvc_1adcfb  Udk User Service_1adcfb

## new tasks

```
\Microsoft\Windows\Application Experience\     PcaPatchDbTask                    Ready
\Microsoft\Windows\Data Integrity Scan\        Data Integrity Check And Scan     Ready
\Microsoft\Windows\Device Information\         Device User                       Ready
\Microsoft\Windows\Flighting\FeatureConfig\    UsageDataFlushing                 Ready
\Microsoft\Windows\Flighting\FeatureConfig\    UsageDataReporting                Ready
\Microsoft\Windows\Input\                      LocalUserSyncDataAvailable        Ready
\Microsoft\Windows\Input\                      MouseSyncDataAvailable            Ready
\Microsoft\Windows\Input\                      PenSyncDataAvailable              Ready
\Microsoft\Windows\Input\                      TouchpadSyncDataAvailable         Ready
\Microsoft\Windows\International\              Synchronize Language Settings     Ready
\Microsoft\Windows\Management\Provisioning\    Retry                             Disabled
\Microsoft\Windows\Management\Provisioning\    RunOnReboot                       Disabled
\Microsoft\Windows\Shell\                      UpdateUserPictureTask             Ready
\Microsoft\Windows\UpdateOrchestrator\         Report policies                   Ready
\Microsoft\Windows\WwanSvc\                    OobeDiscovery                     Ready
```

## removed tasks

```
\Microsoft\Windows\WindowsUpdate\              sihpostreboot                     Ready
\Microsoft\Windows\Speech\                     HeadsetButtonPress                Ready
```

## new apps

```
MicrosoftWindows.Client.CBS
MicrosoftWindows.UndockedDevKit
NcsiUwpApp
Microsoft.549981C3F5F10
Microsoft.Windows.Search
```

## removed apps

```
Microsoft.Windows.Cortana
Microsoft.Messaging
Microsoft.OneConnect
Microsoft.Print3D
```