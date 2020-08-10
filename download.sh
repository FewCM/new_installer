#!/bin/sh
curl -L https://github.com/FewCM/new_installer/archive/master.zip --output scripts.zip
pacman -Sy --noconfirm unzip
unzip scripts.zip
cd new_installer-master
chmod +x *.sh
./install.sh
