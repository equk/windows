ECHO OFF
ECHO Removing Dubious Windows Updates
ECHO ================================
wusa /uninstall /KB:3021917
wusa /uninstall /KB:3050265
wusa /uninstall /KB:3035583
wusa /uninstall /KB:2952664
wusa /uninstall /KB:2976978
wusa /uninstall /KB:2990214
wusa /uninstall /KB:3068708
wusa /uninstall /KB:3022345
wusa /uninstall /KB:2952664
wusa /uninstall /KB:3075851
wusa /uninstall /KB:3045999 
wusa /uninstall /KB:2919355 
wusa /uninstall /KB:3065987 
wusa /uninstall /KB:3075851
wusa /uninstall /KB:2977759
ECHO All Updates Removed
PAUSE
EXIT
