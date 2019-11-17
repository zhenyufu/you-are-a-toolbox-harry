#!/bin/bash


function harry-info() {
    echo '######## RAM'
    free
    echo '######## DISK'
    lsblk
}


function harry-word-count() {
    cat $1 | tr '[:space:]' '[\n*]' | grep -v "^/s*$" | sort | uniq -c | sort -bnr    
}





