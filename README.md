https://mega.nz/linux/MEGAsync/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.zst

- alacritty, autorandr, dunst, i3, polybar, rofi and wget belong in ~/.config

- https://github.com/i3-gnome/i3-gnome

# Manjaro-Architect Install

- pacman-mirrors --country Germany

## Prepare Installation

- change virtual console (de-latin1-nodeadkeys)

- Partition Disk
  - Automatic Partitioning
  
- LUKS Encryption (optional)
  - Automatic LUKS Encryption
  - Do not choose the boot partition, only the root partition
  - Name it
  - Set password

- Mount Partitions
  - root, ext4, noatime, discard (for ssd)
  - SWAP file
Select done, as the UEFI mountpoint will be asked afterwards, if not redo and mount the boot partition to /boot

For mounting the boot partition on UEFI, read the text. 
  - boot, /boot/efi
  - When using LUKS encryption mount to `/boot` (?)
    
- Configure Installer Mirrorlist
  - Edit Pacman Conf
    - Enable Color (uncomment)
      
- Rank Mirrorlist by speed, but before that, rank by country. How?
  - pacman-mirrors --country Germany
  - pacman-mirrors --fasttrack

- Choose Pacman Cache
  - Yes
  
- Enable fsck hook
  - Yes
  

## Install Custom System

### Install Base Packages

- yay + base-devel
- Select kernel (linux-lts)
- Install Hardware Drivers
  - Install Display Drivers
    - Auto-install
  - Install Network Drivers
    - Auto-install

### Install Bootloader
- grub
- make default

> Some UEFI firmware may not detect the bootloader unless it is set as default by copying its efi stub to /boot/efi/EFI/boot and renaming it to bootx64.efi.
>
> It is recommended to do so unless already using a default bootloader, or where intending to use multiple bootloaders.
  
  - Yes

> [Install Grub][1] cp: cannot stat '/boot/EFI/manjaro/grubx64.efi': No such file or directory

Because of renaming the boot entry/id (`manjaro-sway` instead of default `manjaro`) 

> Grub has been set as default bootloader

- Do it manually: chroot into system
`cp /boot/efi/EFI/manjaro-sway/grubx64.efi /boot/efi/EFI/boot/bootx64.efi`
or
`cp /boot/EFI/manjaro-sway/grubx64.efi /boot/EFI/boot/bootx64.efi`

Depending on where the boot partition is mounted.

Still on closing the installer:

> Bootloader is not installed

Because of non-default boot entry name/id ...


### Install Unconfigured Desktop Environments

- Install Display Server
  - Defaults (xorg-server, xorg-xinit, xf86-input-keyboard, xf86-input-libinput, xf86-input-mouse)
or
  - wayland (and xorg-server-xwayland)
- Install Desktop environment
  - skip
- Install Display Manager
  - lightdm
  or
  - skip for sway
- Install Networking Capabilities
  - Install Wireless Device Packages (if necessary)
    - Defaul (dialog, iw, rp-pppoe, wireless_tools, wpa-actiond)
    - bluez-firmware (if bluetooth available)
  - Install Network Connection Manager
    - NetworkManager
- Install Multimedia Support
  - Install Sound Driver(s)
    - Default (alsa-plugins, alsa-utils)
    - pulseaudio-alsa, pulseaudio-bluetooth (if bluetooth available), pulseaudio-jack, pavucontrol
### Install Bootloader
  - grub
  


  - Set bootloader as default -> Yes

### Configure Base

- Generate FSTAB
  - fstabgen -U -p (Device UUID)
- Set Hostname
- Set System Locale
  - System Language: en_US.UTF-8
  - System Locale: de_DE.UTF-8
- Set Desktop Keyboard Layout
  - de
- Set Timezone and Clock
  - Europe > Berlin
  - utc (unless dualbooting with Windows)
- Set Root Password
- Add New User(s)

### Install Custom Packages
- alacritty gvim bash-completion
- i3-gaps
or
- sway swaybg waybar swayidle swaylock-effects 

Interesting:
- autotiling

For sway:

## Chroot into system

- Add to `~/.bash_profile`
```
# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
```

- Edit the config file
```
mkdir -p ~/.config/sway
cd ~/.config/sway
wget https://raw.githubusercontent.com/Nesaijn/myfiles/master/sway/config
# or
cp /etc/sway/config ~/.config/sway/
```
- Add the keyboard settings
```
input "type:keyboard" {
        xkb_layout de
        xkb_variant nodeadkeys

}
```




# Packages
## All
* polybar feh lxappearance (kvantum) thunar brave dunst pulseaudio file-roller pamac-gtk polkit-gnome maim xclip light-locker zathura onlyoffice-desktopeditors xss-lock keychain
* ttf-font-awesome ttf-dejavu ttf-hack noto-fonts-emoji
* network-manager-applet pamac-tray-appindicator pa-applet
* rofi or ulauncher ?

* megasync (website) or AUR
  * "megasync: error while loading shared libraries: libraw.so.20: cannot open shared object file: No such file or directory"
  * find /usr -name "libraw.*" 2>
  * Needs libraw.so.20 but only have libraw.so.19
  * sudo pacman -U https://www.mirrorservice.org/sites/repo.manjaro.org/repos/unstable/extra/x86_64/libraw-0.20.0-1-x86_64.pkg.tar.zst

* https://github.com/svenstaro/rofi-calc
* https://github.com/stunkymonkey/nautilus-open-any-terminal

### AUR
* megasync
* nautilus-megasync

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

## Sway

- qt5-wayland

# Touchpad Settings
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

# Display Power Management Signaling
* https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling

# Theme
* Flat Remix Icons and GTK Theme: https://github.com/daniruiz/flat-remix
  * `yay -S flat-remix flat-remix-gtk`
* Arc Black GTK Theme: https://www.gnome-look.org/p/1329022/
* Capitaine Cursor theme
`pacman -S capitaine-cursors`
