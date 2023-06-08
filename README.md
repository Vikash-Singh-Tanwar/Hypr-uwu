
# DISCLAIMER

For stater this process is made keeping arch in mind and will work fine on fedora, Nix, Gentoo, Void and anyother rolling release distro but will may or may not work on Ubuntu any for sure wont Debian cause of too old packages and things might break if you still want it then, you might go ahead and use nix package manageror distrobox  on debain i prefer nix package manager due to it fast nature and seemless integation within system for a more stable experince.


    
## Screenshots

![Tiled layout](https://github.com/vs66388/Hypr-uwu/blob/main/Screenshots/Tiled%20Layout.png)
## AUTOMATIC INSTALLATION
This is an automatic installation script will only only install pacakges for you might not copy file if you have a system already set up so after running script please jump to the copy config section of page and follow steps thier and if anyone wants and knows a way please fix my script cause i dont know how to.
```bash
git clone https://github.com/vs66388/Hypr-uwu.git && cd Hypr-uwu
sudo bash ./install.sh
```

## MANUAL INSTALLATION

I AM WORKING ON A GUIDE FOR FEDORA (COMING SOON)

BASIC INSTALLTION

Install Wayland Compositor & Related dependencies

```bash
paru -S Hyprland hyprpaper hyprpaper kitty wezterm gtklock xdg-desktop-portal-hyptland qt5-wayland qt6-wayland wayland   
  ```

Bar and Bar Needed Utilities

```bash
paru -S eww-wayland ttf-ubuntu-mono-nerd gjs socat acpi jp inotify-tools bluez gnome-bluetooth-3.0 gtk3 wl-clipboard blueberry polkit-kde-agent
```
Media && Brightness Controls

```bash
paru -S playerctl brightnessctl alsa-utils pavucontrol upower
```

Browser && Other managing tools
```bash
paru -S nemo brave-bin rofi-lbonn-wayland-git cups file-roller upower mpv imv nvim gedit gotop-bin htop neofetch flatpak stacer
```


## INSTALLING THEMES 

Installing Theme Manager Gtk & Qt apps

```bash
paru -S gnome-tweak-tool qt5ct kvantum lxappearance
```

installing Themes
```bash
paru -S qogir-gtk-theme orchis-theme tela-icon-theme 
```

## SETTING UP NEOVIM
make neovim look better and more functional using NVChad for more info visit  - [NVChad's website](https://nvchad.com/)

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

most basic keybindings are same 
to change theme press (SPACE + T +H )

## Applying configs
You can manually copy files from hypr-uwu/config to you ~/.config folder for new people .config folder is hidden by default ho after opening file manager press CTRL+H to unhide it
```bash
git clone https://github.com/vs66388/Hypr-uwu.git && cd Hype-uwu && cp -R config/* ~/.config/
```
## FIXING SOME THEMES RELATED ISSUE

in  case Qt based apps  are not following kvantum or qt5ct themes follow themes steps

```bash
sudo nvim /etc/environment
```

press i to go into insert mode and type or paste the follwing 

```bash
QT_QPA_PLATFORMTHEME=qt5ct
```

Some people might use lxappearance instead of gnome-tweak. In that case might run into wierd or some apps not respecting themes and some wierd cursor themeing issue. So, please make sure that you use same setting in gnome-tweak-tool and lxappearance as well {You can launch gnome tweak tool from by typing gnome-tweaks in terminal as it wont be visible in run menu or alternatively you can use rofi-show run}

## FIXING ICONS NOT APPEARING IN EWW BAR 

```bash
nvim ~/.config/eww/scss/variables.scss 
```
FOR POWER MENU

```bash
nvim ~/.config/eww/scss/powermenu.scss
```

In both the file /home/user/..... change user to your username will fix the
issue  

Some Keybindings


```bash
SUPER + RETURN(ENTER)     -       wezterm
SUPER + D                         rofi =show drun
SUPER + S                         rofi -show run
SUPER + F                         nemo
SUPER + X                         wlogout
SUPER + SHIFT + X                 exit Hyprland
```
You can change these keybindings by editing ~/.config/hypr/hyprland.conf  file's kiybindings section 

laptop keys are all working (brightness and media keys)


## Acknowledgements

 - [AYLUR THE EWW GOD](https://github.com/Aylur)
 - [HYPRLAND CREATOR](https://github.com/vaxerski)
 - [REDDITORS](www.reddit.com/r/unixporn)
 - [YOURS TRUELY](https://github.com/vs66388)



##  CONFESSION

I dont know a hoot about css so i stole EWW Dotfiles rest i did own my own so thank me cause i created nothing but idea to change a window manager into a compelete desktop 


## License

[GNU GENERAL PUBLIC LICENSE 3.0](https://en.wikipedia.org/wiki/GNU_General_Public_License)


