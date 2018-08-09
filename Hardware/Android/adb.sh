# android debugger

when you use adb to push any files, note that the file owner will be root.

adb root    # root privilege
adb shell   # open adb shell
adb shell 'pm list packages -f'	    # list all installed packages
adb uninstall -k <package/application>	# uninstall apps
