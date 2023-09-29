#!/usr/bin/env bash



# A simple script to control volume in window managers

#ctl=/home/spider/.nix-profile/bin/pulseaudio-ctl
ctl=pamixer
#alias doom="~/.emacs.d/bin/doom"
lockfile=$HOME/.local/bin/volume-lockfile
#iconDir="$HOME/.icons/tmp"

while [ -f "$lockfile" ]; do
    sleep 0.1;
done

#getIcon() {
#    status=$("$ctl" --get-volume-human)
#    vol=$(echo "$status" cut -d % -f1)
#    mute=$(echo "$status" )
#    #echo $vol
#
#    if [ "$mute" == "muted" ]; then
#        echo "$iconDir/volume-level-muted.svg"
#    else
#        if [ "$vol" -eq 0 ]; then
#            echo "$iconDir/volume-level-none.svg"
#        elif [ "$vol" -lt 33 ]; then
#            echo "$iconDir/volume-level-low.svg"
#        elif [ "$vol" -lt 66 ]; then
#            echo "$iconDir/volume-level-medium.svg"
#        else
#            echo "$iconDir/volume-level-high.svg"
#        fi
#    fi
#}



val="5"
orig=$("$ctl" --get-volume)

case $1 in
    "inc")
        opt="-i"
        ;;
    "dec")
        opt="-d"
        ;;

    "mute")
        opt="-t"
        ;;
    *)
        echo "Please insert an argument, inc,dec,mute."
        exit
        ;;
esac


    "$ctl" "$opt" "$val"

    # Fake the animated volume
    for quantity in $(seq "$val"); do
        operation="+"
        inverse="-"
        if [ "$1" == "dec" ]; then
            operation="-"
            inverse="+"
        fi
        curry=$(("$orig""$operation""$quantity"))
        current=$(("$curry""$inverse""1"))
        if [ "$current" -lt 0 ]; then
            current=0
            rm "$lockfile"
            exit 1
        fi

        dunstify -u low -h string:x-dunst-stack-tag:volume -a "Volume" "Volume at ${current}%" -h "int:value:${current}"
    done


current=$("$ctl" --get-volume)
dunstify -u low -h string:x-dunst-stack-tag:volume -a "Volume" "Volume at $current%" -h "int:value:${current}"


<<<<<<< HEAD
#TODO add icons to the scripts using the line below
=======
#Future upgrade add icons to the scripts using the line below
>>>>>>> 66a714507e4ba8d2f46234490822a592564a6e4a
# dunstify -i "$(getIcon)" -u low -h string:x-dunst-stack-tag:volume -a "Volume" "Volume at ${current}%" -h "int:value:${current}"
