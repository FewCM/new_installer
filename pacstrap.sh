#!/bin/bash
set -x
figlet "FILESYSTEM PREP"

TARGET=$1
LUKS=$2
# umount -R /mnt &>/dev/null
#echo ".. mount /"
#echo "..TARGET: $TARGET"
#if [ "$LUKS" == "yes" ]; then
#  mount /dev/mapper/cryptroot /mnt;
#else
#  mount ${TARGET}2 /mnt;
#i
#STANDARD
#mkdir /mnt/boot  
#mount ${TARGET}1 /mnt/boot;
figlet "Packages"
echo "..refreshing repositories"
pacman -Syy &>/dev/null
echo "..Installing base packages"
# pacstrap /mnt base base-devel pacman-contrib 
pacstrap /mnt base pacman-contrib lvm2 mkinitcpio git &>/dev/null
echo "..Installing extra utilities"
pacstrap /mnt zip unzip vim nano mc htop syslog-ng lsb-release neofetcharch-install-scripts b43-fwcutter broadcom-wl btrfs-progs clonezilla crda darkhttpd ddrescue dhclient dhcpcd dialog diffutils dnsmasq dnsutils dosfstools ethtool exfat-utils f2fs-tools fsarchiver gnu-netcat gpm gptfdisk hdparm ipw2100-fw ipw2200-fw irssi iwd jfsutils lftp linux-atm linux-firmware lsscsi lvm2 man-db man-pages mc mdadm mtools nano ndisc6 netctl nfs-utils nilfs-utils nmap ntfs-3g ntp openconnect openssh openvpn partclone parted partimage ppp pptpclient refind-efi reiserfsprogs rsync sdparm sg3_utils smartmontools sudo tcpdump testdisk usb_modeswitch usbutils vi vpnc wget wireless-regdb wireless_tools wpa_supplicant wvdial xfsprogs xl2tpd xorg-server xorg-xbacklight xorg-fonts-misc xorg-xfd xorg-xkill xorg-xrandr xorg-xrdb networkmanager nm-connection-editor obconf openbox adapta-gtk-theme alsa-plugins alsa-tools alsa-utils atril binutils bmon calc dunst fakeroot feh ffmpeg ffmpegthumbnailer gcc geany gparted gtk-engine-murrine gvfs gvfs-mtp htop imagemagick inetutils jq leafpad lxappearance lxdm-gtk3 make mpc mpd mplayer ncdu ncmpcpp neofetch nitrogen p7zip patch pkg-config plank polkit pulseaudio pulseaudio-alsa pv ranger scrot termite terminus-font-otb thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ttf-dejavu tumbler udisks2 unrar unzip viewnior vim xarchiver xclip xdg-user-dirs xfce4-power-manager xfce4-settings xmlstarlet yad zip &>/dev/null
echo "..Installing custom fonts"
pacstrap /mnt terminus-font &>/dev/null
echo "..Installing SSH and sudo"
pacstrap /mnt openssh sudo &>/dev/null
figlet "CHROOT"
mkdir /mnt/scripts
cp *.sh /mnt/scripts &>/dev/null
cp font.txt /mnt/scripts &>/dev/null
cp /tmp/*.txt /mnt/scripts &>/dev/null
arch-chroot /mnt /scripts/post-chroot.sh
