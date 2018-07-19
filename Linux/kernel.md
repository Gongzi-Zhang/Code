# compile a kernel
## systemd
to enable systemd in your kernel, enable these options:
* CONFIG_DEVTMPFS=y
* CONFIG_CGROUPS=y
* CONFIG_AUTOFS4_FS=[y|m]
* CONFIG-IPV6=[y|m], optional, but highly recommended
* CONFIG_FANOTIFY=y, optional, required for systemd readahead. available in Linux kernel >= 2.6.37
