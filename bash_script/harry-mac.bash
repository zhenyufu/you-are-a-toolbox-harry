#!/bin/bash

## set editor
export VISUAL=nvim
export EDITOR=nvim


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
