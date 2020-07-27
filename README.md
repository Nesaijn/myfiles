# myfiles

## Install i3
* i3-gaps i3lock-color gvim polybar
* network-manager-applet
* maim

## Natural Scrolling
* https://wiki.archlinux.org/index.php/Libinput
* `pacman -S xf86-input-libinput`
* `cp /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf`
* add: `Option "NaturalScrolling" "true"` to the Section where `touchpad` is in `Identifier`
