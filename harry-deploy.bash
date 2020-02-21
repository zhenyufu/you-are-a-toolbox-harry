#!/bin/bash

echo "#### setting up vim"
sudo apt-get install vim 
if [ -f $HOME/.vimrc ]; then
    mv ~/.vimrc ~/vimrc_old
fi
cp config/vimrc ~/.vimrc


#mv $HOME/.harry.bash $HOME/harry_old.bash
cp config/harry.bash ~/.harry.bash


## Add this to .bashrc to  include harry functions 
#if [ -f $HOME/.harry.bash ]; then
#    source $HOME/.harry.bash
#fi




