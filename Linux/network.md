# network in Linux

## IPTables Chains order (netfilter)
ip package ==> mangle   ==> nat        ==> mangle  ==> Routing  ============================================> mangle     ==> nat 
              PREROUTING    PREROUTING  |  FORWARD     Decision                                            |  POSTROUTING    POSTROUTING
                                        |                                                                  |
					|=> mangle ==> filter ==> Local   ==> mangle ==> filter ==> nat   =|
                                            INPUT      INPUT      Process     OUTPUT     OUTPUT     OUTPUT

Chains: PREROUTING, INPUT, FORWARD, OUTPUT, POSTROUTING

PREROUTING:
    |-- mangle: add marks
    |-- nat:	nat and transfer


# personal firewall rules
1. add all related **ips** into a **ipset**
    ipset create vpn iphash -exist
    ipset add vpn IP
2. add **marks** to **ipset** using **set**
    iptables -t mangle -I PREROUTING -m set --match-set vpn dst -j MARK --set-mark 1
>    add a rule in chain PREROUTING in table mangle that for ip package whose destination match ip in the ipset vpn, then 
>    set mark for it.
3. create a **table** in /etc/iproute2/rt\_tables
4. specify a net interface for the **table**: 
5. add all ip packages with specified **mark** to **table**
    ip rule add fwmark 1 priority 1984 table vpn
    ip route add default dev pptp-VPN table vpn
5. add 


# hostname resolution
The hostname resolution is currently supported by the NSS (Name Service Switch) mechanism. The flow of the resolution is the following:
1. the "/etc/nsswitch.conf" file with stanza like "hosts: files dns" dictates the hostname resolution order. (This replaces the old functionality of the "order" stanza in "/etc/host.conf")
2. The **files** method is invoked first. If the hostname is found in the "/etc/hosts" file, it returns all valid addresses for it and exits. (The "/etc/host.conf" file contains "multi on")
3. the **dns** method is invoked. If the hostname is found by the query to the Internet Domain Name System (DNS) identified by the "/etc/resolv.conf" file, it returns all valid addresses for it and exits

# Acronym (Terminology)
WLAN		wireless LAN
APs		Wireless Acees Points
(E)SSID		(Extended) Service Set IDentifier: network name of the APs
WEP(2)		Wired Equivalent Privacy: 1st generation 64-bit (128-bit) wireless encryption standard with 40-bit key (deprecated)
WPA		Wi-Fi Protected Access: 2nd generation wireless encryption standard (most of 802.11i), compatible with WEP
WPA2		Wi-Fi Protected Access 2: 3rd generation wireless encryption standard (full 802.11i), non-compatible with WEP

# Vritual interface
A single physical Ethernet interface can be configured as multiple virtual interfaces with different IP addresses.
# interface
ssid="wifi-name"
psk="password"
key_mgmt=WPA-PSK    # key
proto=WPA2	    # protocol
id_str="identification"
priority=4
group=WEP104

