#!/bin/bash

## set editor 
export VISUAL=vim
export EDITOR=vim


## scrolling 
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)       
        # natural scolling
        synclient VertScrollDelta=-75
        synclient HorizScrollDelta=-75

        # map super key to control as well 
        # also disable any system key maps on super: xfce opens the menu
        xmodmap -e "remove mod4 = Super_L"
        xmodmap -e "add control = Super_L"
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





