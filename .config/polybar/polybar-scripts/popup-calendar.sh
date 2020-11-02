#!/bin/sh

# dialog and xdotool needed

WIDTH=270
HEIGHT=274
BOTTOM=false
DATE="$(date +" %a, %d.%m - %H:%M ")"
# DATE="$(date +"  %a, %d %b  %H:%M ")"

case "$1" in
    --popup)
        eval "$(xdotool getmouselocation --shell)"

        if [ $BOTTOM = true ]; then
            : $(( pos_y = Y - HEIGHT - 20 ))
            : $(( pos_x = X - (WIDTH / 2) ))
        else
            : $(( pos_y = Y + 20 ))
            : $(( pos_x = X - (WIDTH / 2) - 70 ))
        fi

        #urxvt -geometry 38x18+$pos_x+$pos_y --title calendar -e dialog --no-shadow --no-lines --no-cancel --week-start 1 --clear --calendar "" 1 40
        alacritty -d 38 18 --position $pos_x $pos_y -t calendar -e dialog --no-shadow --no-lines --no-cancel --week-start 1 --clear --calendar "" 1 40

        ;;
    *)
        echo "$DATE"
        ;;
esac
