# Tools and Configuration about PI




*****************Pi As Hot-Spot***************
1:Software
    hostapd (host access point daemon)
    udhcpd(assign IP for connected devices, other soft with same 
function also ok)

2: Configureation
* udhcpd    /etc/udhcpd.conf
* wlan0 interface
* hostapd
* NAT
* If all the above are configrured correctly, then you can the service
to startup items
    sudo service hostapd start
    sudo service udhcpd start
    sudo update-rc.d hostapd enable
    sudo update-rc.d udhcpd enable

**Display**
configure file: /boot/config.txt
    hdmi_group=2
    hdmi_mode=82

^Q^
1: If there are two Wifi-Hotspot with same IP-range, is there any way 
to different them ???
2: unable to connect to google through wifi: IPv6 ??? or MTU ???
    


