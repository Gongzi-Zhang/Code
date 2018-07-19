# system launcher

## commands

### systemctl
$ sudo systemctl reboot
$ sudo systemctl poweroff
$ sudo systemctl halt
$ sudo systemctl suspend
$ sudo systemctl hibernate
$ sudo systemctl hybrid-sleep
$ sudo systemctl rescue	# enter rescue mode

### systemd-analyze
$ systemd-analyze   : time consumation of booting process
$ systemd-analyze blame
		    : time consumation of startup of each service
$ systemd-analyze critical-chain
		    : spring-like stream of startup 
$ systemd-analyze critical-chain atd service
		    : stream of specified service

### hostname
$ hostnamectl
$ sudo hostnamectl set-hostname name

### locale
$ localectl
$ sudo localectl set-locale LANG=en_US.utf8
$ sudo localectl set-keymap en_US

### date-time
$ timedatectl
$ timedatectl list-timezones
$ sudo timedatectl set-timezone America/New_York
$ sudo timedatectl set-time YYYY-MM-DD
$ sudo timedatectl set-time HH:MM:SS

### login
$ loginctl list-sessions
$ loginctl list-users
$ loginctl show-user yuan

## concepts
unit: systemd tasks are organized as **units**; any resource that the system knows hot to operate on and manage; there are **12** units
* Service Unit	    : system service
* Target Unit	    : group of multiple units
* Device Unit	    : device
* Mount Unit	    : mount point
* Automount Unit    : automount
* Path Unit	    : path
* Scope Unit	    : processes that are not invoked by Systemd
* Slice Unit	    : process
* Snapshot Unit	    : Systemd snapshot
* Socket Unit	    : socket
* Swap Unit	    : swap
* Timer Unit	    : timer

### list units
$ systemctl list-units
$ systemctl list-units --all
$ systemctl list-units --all --state=inactive
$ systemctl list-units --failed
$ systemctl list-units --type=service

### unit status 
$ systemctl status
$ systemctl status bluetooth.service
$ systemctl -H root@host.example.com status httpd.service   
    : show unit status in remote host
$ systemctl is-active application.service
$ systemctl is-failed application.service
$ systemctl is-enabled application.service

unit descriptor:
>   /lib/systemd/system	    default system unit files
>   /etc/systemd/system	    unit files of user-installed packages
>   /usr/lib/systemd/system user-defined unit files

### list-unit-files
$ systemctl list-unit-files   : search for all unit
$ systemctl list-unit-files --type service
$ systemctl list-unit-files --type timer

STATE of unit
> enabled:  launch link
> disabled: no launch link
> static:   no [Install] field, so it can only be used as dependency
> masked:   prohibit from creating laurch link

check the configuration
$ systemctl cat atd.service

Configure file:
```
[Section]
Key1=value
Key2=value

# the name of each Section (within the square braket) and Key are case-sensitive
# no space around '='
## [Unit] : metadata
[Unit]
Description="some description"
Documentation="address of documentation"
Requires="dependencies of this unit"
Wants="other units that cooperate with the current one, but not depends on them"
BindsTo="same as Requires"
Before="the unit specified here must start before the current one"
After="the unit specified here must start after the current one"
Conflicts="units conflict with the current one"
Condition="Some conditions must be satisfied in order to run the current unit, if not, it will not launch"
Assert="If not satisfied, the launch failed"

## [Service]	
[Service]
Type=simple	: default, execute ExecStart command
    =forking	: create child process and quit parent process
    =oneshot	: one-time process, Systemd will wait for it to finish to continue
    =dbus	: invoke through d-bus
    =notify	: when the invokation finish, the unit will notify Systemdto continue
    =idel	: idle until other service finish
ExecStart="command"
ExecStartPre="command"
ExecStartPost="command"
ExecReload="command to be executed when reloaded"
ExecStop="command"
ExecStopPost="command"
ReStart=always
       =on-success
       =on-failure
       =on-abnormal
       =on-abort
       =on-watchdog
ReStartSec=100	: time interval (s) between restart
TimeOutSec=100	: waiting time (s) before stop service
Environment=	: environment variable

## [Install]	: usually the last section, define how to start the unit
[Install]
WantedBy="one or more targets"
RequiredBy="one or more targets"
Alias="alias name"
Also="other units, which will be invoked when the current one is invoked"

```
### unit management
$ systemctl start [unitname]
$ systemctl stop [unitname]
$ systemctl restart [unitname]
$ systemctl kill [unitname]
$ systemctl reload [unitname]
$ systemctl daemon-reload	: reload all configuration
$ systemctl show [unitname]	: show parameters of a unit
$ systemctl show -P CPUShare [unitname]	
				: show specific parameter of a unit
$ systemctl set-property [unitname] CPUShare=500    
$ systemctl status [unitname]
$ systemctl enable [unitname]	: auto-start this unit when booted
$ systemctl disable [unitname]	: auto-start this unit when shutdowned

### dependencies
$ systemctl list-dependencies [unitname]
$ systemctl list-dependencies --all [unitname]	
    : with --all option, if depend on target, then expand the target

type: 12 types of unit



## service: what to do
e.g. mytimer.service: 
```
[Unit]
Description=MyTimer

[Service]
ExecStart=/bin/bash /path/to/script.sh
# command need to written with absolute path

# ExecStart	: commands for systemctl start
# ExecStop	: commands for systemctl stop
# ExecReload	: commands for systemctl reload
# ExecStartPre	: commands executived before ExecStart
# ExecStartPost	: commands executived after ExecStart
# ExecStopPost	: commands executived after ExecStop
```
start our new defined service
$ sudo systemctl start mytimer.service

## target ~ similar to runlevel in init, but runlevels are mutually exclusive, while targets can run simultaneously
runlevel 0  --> runlevel0.target -> poweroff.target
runlevel 1  --> runlevel1.target -> ruscue.target
runlevel 2  --> runlevel2.target -> multi-user.target
runlevel 3  --> runlevel3.target -> multi-user.target
runlevel 4  --> runlevel4.target -> multi-user.target
runlevel 5  --> runlevel5.target -> graphical.target
runlevel 6  --> runlevel6.target -> reboot.target

$ systemctl list-unit-files --type=target
$ systemctl list-dependencies multi-user.target	
    : check all units within a target
$ systemctl get-default	    : check default target
$ systemctl set-default multi-user.target
    : set a target as default target
$ systemctl isolate multi-user.target
    : by dedault, when switching target, all process started by previous
    : target will not be closed; but "isolate" command change it, which
    : will close all process that does not belong to new target


## timer: when to do service
e.g.: mytimer.timer
```
[Unit]
Description=Runs mytimer every hour

[Timer]
OnUnitActiveSec=1h
Unit=mytimer.service

[Install]
WantedBy=multi-user.target


# OnActiveSec	: when to execute commands after being set to active
# OnBootSec	: when to execute commands after system booting
# OnStartupSec	: when to execute commands after systemd process
# OnUnitActiveSec:  time interval before two execution
# OnUnitInactiveSec:	time interval to last timer shutdown
# OnCalendar	: base on calendar, rather than relative time
# AccuracySec	: maximum allowed delay (default 60s)
# Unit		: actually service
# Persistent	: when set, the service will be executed even no timer 
# WakeSystem	: If system is in sleep mode, wake it up.
```
start timer
$ sudo systemctl start mytimer.timer
$ sudo systemctl stop mytimer.timer
$ sudo systemctl enable mytimer.timer	: run it when booted
$ sudo systemctl disable mytimer.timer	: disable auto-start
$ systemctl status mytimer.timer
$ systemctl list-timers

## Log|journal
### priority
> 0: emerg 
> 1: alert
> 2: crit
> 3: err
> 4: warning
> 5: notice
> 6: info
> 7: debug
$ journalctl	: all logs
$ journalctl -k	: kernal log (no application log)
$ journalctl -b [-0]: booting log
$ journalctl -b -1  : last booting log
$ journalctl --since="2012-10-30 18:17:16"
$ journalctl --since="20 min ago"
$ journalctl --since=yesterday
$ journalctl --since="2012-10-30" --until "2015-01-11 03:18:09"
$ journalctl --since 09:00 --until "1 hour ago"
$ journalctl -n 20  : the tail 20 lines
$ journalctl -u mytimer.timer    
		: log of mytimer.timer
$ journalctl -u mytimer
		: log of mytimer.timer and mytimer.service
$ journalctl -f
		: show newest log
$ journalctl -f -u mytimer.timer
$ journalctl \_UID=33 --since today
		: log of specified user
$ journalctl -u nginx.service -u php-fpm.service
		: concat log of multi-services   
$ journalctl -p err -b
		: only specified or higher priority
$ journalctl -b -u nginx.service -o json
		: json output in single line
$ journalctl -b -u nginx.service -o json-pretty
		: json output in multi-lines
$ journalctl --disk-usage
$ journalctl --vacuum-size=1G
		: maximum space for journal
$ journalctl --vacuum-time=1years
		: time for storege
