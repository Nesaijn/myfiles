# myfiles

## Install i3
* i3-gaps i3lock-color gvim polybar rofi
* network-manager-applet
* maim

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

## Theme Settings
* https://wiki.archlinux.org/index.php/GTK
* https://wiki.archlinux.org/index.php/Qt
* https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications

* `pacman -S lxappearance qt5-base`
* lxappearance for GTK3 and GTK2 and qt5-base for Qt
