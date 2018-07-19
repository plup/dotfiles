# README

Activate with:
```
$ systemctl --user enable checkmail.service
$ systemctl --user enable checkmail.timer
```

Start with:
```
$ systemctl --user start checkmail.service
$ systemctl --user start checkmail.timer
```

Control with:
```
$ systemctl --user status checkmail.service
● checkmail.service - check mail
   Loaded: loaded (/home/plup/.config/systemd/user/checkmail.service)
   Active: inactive (dead) since Thu 2018-07-19 22:07:11 CEST; 5s ago

$ systemctl --user list-timers --all
NEXT                          LEFT          LAST                          PASSED      UNIT            ACTIVATES
Thu 2018-07-19 22:13:46 CEST  2min 53s left Thu 2018-07-19 22:08:46 CEST  2min 6s ago checkmail.timer checkmail.service
```

Allow user to see all journal logs:
```
# usermod -aG systemd-journal plup
```
