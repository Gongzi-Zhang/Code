# configuration about ubuntu system



# Chinese input
in system settings:
	Language support: Install / Remove Languages	==> add Chinese
	Text Entry	: Input source to use:		==> add Pinyin ( if no such option, then you
need to install it firstly: sudo apt-get install ibus-pinyin, assume you use ibus input system )	

For Japanese: choose Japanese (Mozc)
	
## problem shooting 
    if you still can't switch to Pinyin input after previous steps, then you are missing some packages:
	sudo apt install ibus-pinyin (ibus-sunpinyin)
    then restart ibus service:
	ibus restart

# log
# /etc
/etc/rsyslog.conf:/etc/rsyslog.d/50-default.conf
    turn on/off logging of some system services.
