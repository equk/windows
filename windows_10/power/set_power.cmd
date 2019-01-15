@echo off
echo.
echo disabling hibernate
echo.
powercfg.exe /hibernate off
echo hibernate disabled
echo.
echo disabling timeouts for monitors, disks, standby and hibernate
powercfg.exe -x -monitor-timeout-ac 0
powercfg.exe -x -monitor-timeout-dc 0
powercfg.exe -x -disk-timeout-ac 0
powercfg.exe -x -disk-timeout-dc 0
powercfg.exe -x -standby-timeout-ac 0
powercfg.exe -x -standby-timeout-dc 0
powercfg.exe -x -hibernate-timeout-ac 0
powercfg.exe -x -hibernate-timeout-dc 0
echo.
echo finished.
echo.
echo checking current powerschemes
echo.
powercfg.exe -L
pause