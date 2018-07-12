To install Arch Linux from another distribution, a root server rescue system or 
a live system, follow the instructions at
https://wiki.archlinux.org/index.php/Install_from_Existing_Linux. A short version
is provided below:

* Make sure your system is running Linux 2.6.32 or later.
* Extract this tarball. If you have enough memory, you can extract it into a 
  tmpfs file system. In the example below, we'll assume that you extracted it in
  /tmp.
* Enter the chroot:
  + If you have bash 4 or later installed, run
    # /tmp/root.x86_64/bin/arch-chroot /tmp/root.x86_64/
  + If you don't have bash 4, run the following commands:
    # cp /etc/resolv.conf /tmp/root.x86_64/etc
    # mount --rbind /proc /tmp/root.x86_64/proc
    # mount --rbind /sys /tmp/root.x86_64/sys
    # mount --rbind /dev /tmp/root.x86_64/dev
    (if /run exists on your system:
      # mount --rbind /run /tmp/root.x86_64/run
    )
    # chroot /tmp/root.x86_64/
* In the chroot
  + Initialize the pacman keyring:
    # pacman-key --init
    # pacman-key --populate archlinux
  + Mount the destination partition under /mnt
* Follow the Arch Linux installation guide
   https://wiki.archlinux.org/index.php/Installation_Guide#Install_the_base_system
    Pre-Installation
    1. connect to the Internet 
    2. partition the disk:
	fdisk 
    3. format the partitions:
	mkfs.ext4 /dev/sda1
	mkswap /dev/sda3
    4. mount the fs: 
	mount /dev/sda1 /mnt
    Installation
    5. select the mirrors:
	vi /etc/pacman.d/mirrorlist
    6. install the base packages
	pacstrap /mnt base	    # base group
	pacstrap /mnt base-devel    # base-devel group
    Configure the system
    7. fstab (filesystem table)
	genfstab -U /mnt >> /mnt/etc/fstab
    8. chroot
	arch-chroot /mnt
    9. time zone
	ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
	hwclock --systohc --utc
       Locale
	locale-gen
	vi /etc/locale.conf
	    LANG=en_US.UTF-8
       Keyboard layout
	vi /etc/vconsole.conf
	    KEYMAP=us
    10. network
       hostname
	vi /etc/hostname
	    [hostname]
	vi /etc/hosts
	    127.0.0.1	localhost
	    ::1		localhost
	    127.0.1.1	[hostname].localdomain	[hostname]
       initramfs
	mkinitcpio -p linux
    11. root password
	passwd
    12. boot loader
	A Linux-capable boot loader must be installed in order to boot Arch Linux
	    pacman -S grub os-prober
	Install the grub boot loader to the hard disk:
	    grub-install /dev/sda
	configure it:
	    grub-mkconfig -o /boot/grub/grub.cfg
    13.	reboot
	exit
	reboot
	
