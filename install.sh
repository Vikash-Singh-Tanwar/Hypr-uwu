#!/bin/bash

echo "Beginning the automated setup for your system."

# Check if paru is installed; if not, install paru-bin and chaotic-aur (optional)
if ! command -v paru &> /dev/null; then
    echo "Installing paru-bin and configuring chaotic-aur repository."
    git clone https://aur.archlinux.org/paru-bin.git /tmp/paru-bin
    cd /tmp/paru-bin
    makepkg -si --noconfirm
    cd -
fi

# Configure chaotic-aur repository
echo "Configuring chaotic-aur repository for your enjoyment."
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | tee -a /etc/pacman.conf

# Install powerpill
echo "Installing powerpill to enhance the update experience."
paru -S --needed --noconfirm powerpill

# Install the packages you desire
echo "Now, let me fetch and install the packages that will make your system truly yours."
paru -S --needed --noconfirm \
  hyprland eww-wayland ttf-ubuntu-nerd socat jq acpi inotify-tools \
  bluez pavucontrol brightnessctl playerctl nm-connection-editor imagemagick \
  gjs gnome-bluetooth-3.0 upower networkmanager gtk3 \
  wl-gammactl wlsunset wl-clipboard hyprpicker hyprshot blueberry \
  polkit-gnome sassc wezterm-git nemo brave-bin rofi-lbonn-wayland-git cups file-roller upower mpv imv neovim gedit gotop-bin htop neofetch flatpak stacer qogir-gtk-theme orchis-theme tela-icon-theme swww

# Add kvantum and activate it
echo "Now, let's add Kvantum and bask in its beauty together."
paru -S --needed --noconfirm kvantum-qt5
echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile

# Clone your GitHub repository and move configs to the right place
echo "Fetching your precious configurations from GitHub and placing them in their rightful homes."
git clone https://github.com/vs66388/Hypr-uwu.git /tmp/Hypr-uwu
cp -r /tmp/Hypr-uwu/config/* ~/.config/

# Run swww init and set your desired wallpaper
echo "Initiating the magic spell known as 'swww init'."
swww init
swww img ~/.config/wallpapers/sunset.jpg

# Check and install/enable display manager (sddm or gdm)
if ! command -v sddm &> /dev/null; then
    echo "Installing sddm-git to make your system truly enchanting."
    paru -S --needed --noconfirm sddm-git
fi

# Enable sddm
systemctl enable sddm.service

# Provide a parting message
echo "Your system is now configured as per your wishes. Enjoy your new setup!"
