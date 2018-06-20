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
