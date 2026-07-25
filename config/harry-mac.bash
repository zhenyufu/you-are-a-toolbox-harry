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


#### Functions

## pass in a file and counts occurance of every word
function harry-word-count() {
    cat $1 | tr '[:space:]' '[\n*]' | grep -v "^/s*$" | sort | uniq -c | sort -bnr
}

## system info
function harry-info() {
    echo '######## RAM'
    vm_stat
    echo '######## DISK'
    df -h /
}
