- alacritty, autorandr, dunst, i3, polybar, rofi and wget belong in ~/.config

- https://github.com/i3-gnome/i3-gnome

# Manjaro-Architect Install
Prepare Installation
- Mount Partitions
  - root, ext4, noatime, discard (for ssd)
  - boot, ext4, /boot, noatime (default)
    
- Configure Installer Mirrorlist
  - Edit Pacman Conf
    - Enable Color (uncomment)
      
- Rank Mirrorlist by speed, but before that, rank by country. How?
  - pacman-mirrors --country Germany

- Choose Pacman Cache
  - Yes
  
- Enable fsck hook
  

## Install Custom System

### Install Base Packages  
- Install Hardware Drivers
  - Install Display Drivers
    - Auto-install
  - Install Network Drivers
    - Auto-install

### Install Unconfigured Desktop Environments

- Install Display Server
  - Defaults (xorg-server, xorg-xinit, xf86-input-keyboard, xf86-input-libinput, xf86-input-mouse)
- Install Desktop environment
  - skip
- Install Display Manager
  - lightdm
- Install Networking Capabilities
  - Install Network Connection Manager
    - NetworkManager
- Install Multimedia Support
  - Install Sound Driver(s)
    - Default (alsa-plugins, alsa-utils)
- Install Bootloader
  - grub

### Configure Base

- Generate FSTAB
  - fstabgen -U -p (Device UUID)

### Install Custom Packages
* i3-gaps alacritty gvim bash-completion

# Packages
## All
* polybar feh lxappearance (kvantum) pcmanfm-gtk3 brave dunst pulseaudio file-roller pamac-gtk polkit-gnome maim xclip light-locker zathura onlyoffice-desktopeditors xss-lock keychain
* ttf-font-awesome ttf-dejavu ttf-hack noto-fonts-emoji
* network-manager-applet pamac-tray-appindicator pa-applet
* rofi or ulauncher ?

* megasync (website)
  * "megasync: error while loading shared libraries: libraw.so.20: cannot open shared object file: No such file or directory"
  * find /usr -name "libraw.*" 2>
  * Needs libraw.so.20 but only have libraw.so.19
  * sudo pacman -U https://www.mirrorservice.org/sites/repo.manjaro.org/repos/unstable/extra/x86_64/libraw-0.20.0-1-x86_64.pkg.tar.zst

* https://github.com/svenstaro/rofi-calc

### AUR
* qtfm

## Laptop
* cbatticon xorg-xbacklight
* bluez bluez-utils pulseaudio-bluetooth
* autorandr

### AUR

# Other
* In ~/.ssh/conf `AddKeysToAgent yes`

## LightDM
* https://github.com/naueramant/lightdm-webkit-sequoia
* `pacman -S gtk-engine-murrine`
* `yay -S lightdm-webkit-theme-sequoia-git`

```
# /etc/lightdm/lightdm-webkit2-greeter.conf
[greeter]
...
webkit_theme = sequoia
...
```

```
# /etc/lightdm/lightdm.conf

[Seat:*]
...
greeter-session=lightdm-webkit2-greeter
...
``` 

- `systemctl start lightdm && systemctl enable lightdm`
- if necessary `systemctl stop gdm && systemctl disable gdm``

## Touchpad Settings
* https://wiki.archlinux.org/index.php/Libinput
* `pacman -S xf86-input-libinput`
* `cp /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf`
* To Section with `touchpad`in `Identifier` add:
```
Option "Tapping" "on"               # To use touchpad tapping to click
Option "ClickMethod" "clickfinger"  # To use double finger for right click and three finger for middle click
Option "NaturalScrolling" "true"
Option "AccelSpeed" "0.4"           # Touchpad speed. Number between -1 and 1. Default 0.
```

## Display Power Management Signaling
* https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling

## Theme
* Icons: https://github.com/daniruiz/flat-remix
  * `yay -S flat-remix`
* GTK Theme: https://www.gnome-look.org/p/1329022/
