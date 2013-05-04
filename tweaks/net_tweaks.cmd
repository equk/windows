@echo off
echo network tweaks as shown on wp.equk.co.uk
echo ========================================
echo.
echo make sure you run this as admin
echo.
echo B.Walden - see more info on equk.co.uk
echo.
FOR /F "tokens=3*" %%I IN ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" /F "ServiceName" /S^|FINDSTR /I /L "ServiceName"') DO (
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%I" /F /v TcpAckFrequency /T REG_DWORD /D 1 2>NUL
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\%%I" /F /v TCPNoDelay /T REG_DWORD /D 1 2>NUL
)