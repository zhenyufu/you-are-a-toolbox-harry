#!/bin/bash


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
function harry-info() {
    echo '######## RAM'
    free
    echo '######## DISK'
    lsblk
}


function harry-word-count() {
    cat $1 | tr '[:space:]' '[\n*]' | grep -v "^/s*$" | sort | uniq -c | sort -bnr    
}





