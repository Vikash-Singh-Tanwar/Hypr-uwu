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

# Making .config and Moving config files and background to Pictures
mkdir -p ~/.config
cp -R config/* ~/.config/

# Installing Essential Programs
paru -S wayland qt5-wayland qt6-wayland hyprpaper hyprpicker hyprshot hyprland kitty wezterm gnome-tweak-tool xorg-xwayland alsa-utils brightnessctl playerctl /
imv mpv rofi-lbonn-wayland-git brave-bin gnome-tweak-tool qt5ct kvantum gedit neovim pavucontrol stacer eww-wayland socat jq acpi inotify-tools /
bluez nm-connection-editor gjs gnome-bluetooth-3.0 upower gtk3 networkmanager wl-clipboard polkit-kde-agent flatpak
paru -S ttf-ms-win11-auto adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts ttf-jetbrains-mono-nerd ttf-jetbrains-mono otf-font-awesome nerd-fonts-sf-mono otf-nerd-fonts-monacob-mono -y  ##fonts

# Reloading Font
fc-cache -vf

# Enable graphical login and change target from CLI to GUI
systemctl enable sddm
