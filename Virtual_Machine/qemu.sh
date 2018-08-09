dd if=/dev/zero of=disk.img count=204800 bs=512	# create a virtual image of size 100MB
fdisk disk.img	# make partition in the virtual disk
# only one partition is enough
sudo losetup -o 1048576 /dev/loop1 disk.img # virtualize it as a device file, the offset is 2048sectirs*512=1048576*Byte
sudo  mkfs.ext4 /dev/loop1  # mkfs
sudo mount /dev/loop1 /mnt
sudo grub-install --boot-directoy=/mnt --target=i386-pc --modules="part_msdos" disk.img
qemu-system-i386 -hda disk.img -m 1024 -s & # start qemu

