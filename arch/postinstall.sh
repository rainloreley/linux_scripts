#!/usr/bin/bash
sudo echo $'\n[multilib]' >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/

sudo pacman -S --noconfirm firefox discord
yay -S --noconfirm 1password

if [ "$DESKTOP_SESSION" = "gnome" ]; then

yay -S --noconfirm extension-manager

fi
