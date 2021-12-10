sudo mount -t exfat /dev/sdc3 /mnt/ext
sudo hdparm -B 127 /dev/sdc3
sudo hdparm -S 64 /dev/sdc3