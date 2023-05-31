#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "This script requires root privileges to run." >&2
  exit 1
fi

# Update system
sudo pacman -Syu

# Install Git
if command -v git &>/dev/null; then
  echo "Git v$(git -v | awk '{print $3}') is already installed in your system"
else
  sudo pacman -S git -y
fi

# Clone and install Paru
if command -v paru &>/dev/null; then
  echo "Paru $(paru -V | awk '{print $2}') is already installed in your system"
else
  if command -v yay &>/dev/null; then
    echo "Yay $(yay -V | awk '{print $2}') is installed in your system"
  else
    echo "Neither Paru nor Yay is present in your system."
    echo "Installing Paru..."
    git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin && makepkg -si --noconfirm && cd ..
  fi
fi

# Set username and build directory
username="your_username"
builddir="your_build_directory"

# Making .config and Moving config files and background to Pictures
mkdir -p /home/"$username"/.config
mkdir -p /usr/share/sddm/themes
cp -R dotconfig/* /home/"$username"/.config/
cp wallpaper.jpg /home/"$username"/.config/bspwm/
mv user-dirs.dirs /home/"$username"/.config
chown -R "$username":"$username" /home/"$username"

# Installing Essential Programs
paru -S -y
paru -S ttf-ms-win11-auto adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts ttf-jetbrains-mono-nerd ttf-jetbrains-mono otf-font-awesome nerd-fonts-sf-mono otf-nerd-fonts-monacob-mono -y  ##fonts

# Installing fonts
cd "$builddir"
# Add the necessary pacman command here to install fonts

chown "$username":"$username" /home/"$username"/.fonts/*

# Reloading Font
fc-cache -vf

# Enable graphical login and change target from CLI to GUI
systemctl enable sddm
