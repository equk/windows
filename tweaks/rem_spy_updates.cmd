ECHO OFF
ECHO Removing Dubious Windows Updates
ECHO ================================
wusa /uninstall /KB:3021917 /quiet /norestart
wusa /uninstall /KB:3050265 /quiet /norestart
wusa /uninstall /KB:3035583 /quiet /norestart
wusa /uninstall /KB:2952664 /quiet /norestart
wusa /uninstall /KB:2976978 /quiet /norestart
wusa /uninstall /KB:2990214 /quiet /norestart
wusa /uninstall /KB:3068708 /quiet /norestart
wusa /uninstall /KB:3022345 /quiet /norestart
wusa /uninstall /KB:2952664 /quiet /norestart
wusa /uninstall /KB:3075851 /quiet /norestart
wusa /uninstall /KB:3045999 /quiet /norestart
wusa /uninstall /KB:2919355 /quiet /norestart
wusa /uninstall /KB:3065987 /quiet /norestart
wusa /uninstall /KB:3075851 /quiet /norestart
wusa /uninstall /KB:2977759 /quiet /norestart
wusa /uninstall /KB:3075249 /quiet /norestart
wusa /uninstall /KB:3080149 /quiet /norestart
ECHO All Updates Removed
PAUSE
EXIT
