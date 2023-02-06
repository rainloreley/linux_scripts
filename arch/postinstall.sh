#!/usr/bin/bash

GREEN='\e[1;32m'
NC='\033[0m' # No Color

# Enable multilib repository
sudo echo $'\n[multilib]' >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
sudo pacman -Syu --noconfirm

# Setup tools required for building yay
sudo pacman -S --noconfirm --needed git base-devel

# Install yay (for AUR)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/

# Install Vulkan drivers for NVIDIA
sudo pacman -S --noconfirm lib32-nvidia-utils

# Install programs
sudo pacman -S --noconfirm firefox discord steam
yay -S --noconfirm 1password

if [ "$DESKTOP_SESSION" = "gnome" ]; then
# Install GNOME Extension Manager if on GNOME
yay -S --noconfirm extension-manager

fi

echo -e "${GREEN}========================${NC}"
echo -e "${GREEN}Installation finished!${NC}"
