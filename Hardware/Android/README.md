# anbox -- ANdroid in Linux
Though share the same Linux kernel, Android is actually a totally 
different system than PC Linux., which deployes the GNU user environment,
while Android has its own one that heavily relies on Java.

Anbox aims to bridge the gap by providing a compatibility layer between
Android apps and Linux. It uses the host system's Linux kernle bur creates
its own Android userspace.

**NOTE** when you install apps for Anbox, keep in mind that Anbox run as 
an x86 computer, not ARM. So not all apps that runs in your phone may 
also run successfully in Anbox. Also, currently, there's no way to get
the Google Play Services working in Anbox, so any apps that relies on
Play Service will not work either.


# root android
root means to get root privilege in your android, which is usually 
prohibited by OEM factories. Specifically, you need to add the **su** 
executable into some dir. included in $PATH, (e.g. /system/xbin/), so you
can run program as root through su. The problem is that we don't have 
root privilege, so we don't have permission to write in these $PATH dir.
To break the close loop problem, one usually need to find some bugs in 
the system, using some system services who has root privilege to write
su executable into one of $PATH dir. These is what most "one key root" 
apps do.    

a walk around is to install a new ROM which include **su**. which means
to install a new system.
