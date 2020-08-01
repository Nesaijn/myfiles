# Manjaro-Architect Install
Prepare Installation

- Set Virtual Console
  
  - de-latin1-nodeadkeys
- Partition Disk
  
  - Automatic
- Mount Partitions
  
  - root, ext4, noatime, discard (for ssd)
    
  - boot, ext4, /boot, noatime (default)
    
- Configure Installer Mirrorlist
  
  - Edit Pacman Conf
    
    - Enable Color (uncomment)
      
    - multilib enabled by default (aur)
      
- Rank Mirrorlist by speed, but before that, rank by country. How?
  - pacman-mirrors --country Germany
  
- Choose Pacman Cache
  
  - Yes
- Enable fsck hook
  

## Install Custom System

### Install Base Packages

- yay + base-devel
  
- linux-lts
  
- linux-latest
  
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
- Set Hostname
  
  - [Hostname]
- Set System Locale
  
  - System Language: en_US.UTF-8
    
  - Locales: de_DE.UTF-8
    
- Set Desktop Keyboard Layout
  
  - de
- Set Timezone and Clock
  
  - Europe/Berlin
    
  - utc
    
- Set Root Password
  
  - [password]
- Add New User(s)
  
  - [user]
    
  - bash
    
  - [password]
    

### Install Custom Packages
* i3-gaps i3lock-color gvim polybar rofi feh lxappearance
* network-manager-applet
* maim

## LightDM
* https://github.com/naueramant/lightdm-webkit-sequoia
* `yay -S lightdm-webkit-theme-sequoia-git`

```
# /etc/lightdm/lightdm.conf

[Seat:*]
...
greeter-session=lightdm-webkit2-greeter
...
``` 

## Touchpad Settings
* https://wiki.archlinux.org/index.php/Libinput
* `pacman -S xf86-input-libinput`
* `cp /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf`
* To Section with `touchpad`in `Identifier` add:
```
Option "Tapping" "on"               # To use touchpad tapping to click
Option "ClickMethod" "clickfinger"  # To use double finger for right click and three finger for middle click
Option "NaturalScrolling" "true"
```

## Theme
* Icons: https://github.com/daniruiz/flat-remix
* GTK Theme: https://www.gnome-look.org/p/1329022/
