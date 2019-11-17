#!/bin/bash
mv ~/.vimrc ~/vimrc_old
cp config/vimrc ~/.vimrc


#mv $HOME/.harry.bash $HOME/harry_old.bash
cp config/harry.bash ~/.harry.bash


## Add this to .bashrc to  include harry functions 
#if [ -f $HOME/.harry.bash ]; then
#    source $HOME/.harry.bash
#fi




