#!/bin/bash

## set editor 
export VISUAL=vim
export EDITOR=vim


## set terminal color 

red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
purple='\[\e[0;35m\]'
nc='\[\e[0m\]'

if [ "$UID" = 0 ]; then
    PS1="$RED\u$nc@$GREEN\H$nc:\$$nc "
else
    PS1="$BLUE\u$nc@$GREEN\H$nc:\$$nc "
fi

## scrolling and keyboard 
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)       
        # natural scrolling in both directions: get the current value with synclient 
        synclient VertScrollDelta=-26
        synclient HorizScrollDelta=-26

        # switch left ctrl and alt
        xmodmap -e "clear control"
        xmodmap -e "clear mod1"
        xmodmap -e "keycode 37 = Alt_L Meta_L"
        xmodmap -e "keycode 64 = Control_L"
        xmodmap -e "add control = Control_L Control_R"
        xmodmap -e "add mod1 = Alt_L Meta_L"

        # to enable terminal ctrl copy paste: this needs a restart  
        # uncomment `~/.config/xfce4/terminal/accels.scm`:
        # (gtk_accel_path "<Actions>/terminal-window/paste" "<Primary>v")
        # (gtk_accel_path "<Actions>/terminal-window/copy" "<Primary>c")
        
        # map super key to ctrl: also disable any system key maps to super
        # xmodmap -e "remove mod4 = Super_L"
        # xmodmap -e "add control = Super_L"
    ;;
    Darwin*)    
       # stuff 
    ;;
esac


#### Functions 

## system info
function harry-info() {
    echo '######## RAM'
    free
    echo '######## DISK'
    lsblk
}

## pass in a file and counts occurance of every word 
function harry-word-count() {
    cat $1 | tr '[:space:]' '[\n*]' | grep -v "^/s*$" | sort | uniq -c | sort -bnr    
}





