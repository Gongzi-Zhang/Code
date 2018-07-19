# net traffic monitor
bmon
tcptrack
slurm

# http proxy
squid3
>   acl localnet src 192.168.1.0/24
>   http_access	allow localnet localhost
>
>   ## disable ads
>   acl ads dstdom_regex    "/etc/squid3/ad_block.txt"
>   deny_info TCP_RESET ads

>   acl urlads url_regex "/etc/squid3/adurl_block.txt"
>   http_access deny urlads
>   # deny_info TCP_RESET urlads
