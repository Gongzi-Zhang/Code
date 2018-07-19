# Headless installation
1. download & write image
    dd bs=4M if=/path/to/image of=/dev/*** conv=fsync
2. configure ssh and wifi
    mount /dev/***1 /media/boot
    cd /media/boot
* enable ssh
    touch ssh
	>> just an empty file with exactly the name
* connect wifi
    vim wpa_supplicant.conf
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
network{
    ssid="wifi_name"
    psk="password"
    key_mgmt=WPA-PSK
    id_str="identification"
}
```
3. first boot and connection
    ssh pi@raspberrypi.local
	>> the default password for the "pi" user on a clean Raspbian install in "raspberry"

*  configuration
    sudo raspi-config
