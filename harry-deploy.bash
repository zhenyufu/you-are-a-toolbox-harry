#!/bin/bash

echo "#### setting up vim"
sudo apt-get install vim 

echo "#### copying vimrc"
if [ -f $HOME/.vimrc ]; then
    mv ~/.vimrc ~/vimrc_old
fi
cp config/vimrc ~/.vimrc

echo "#### copying .harry.hash"
if [ -f $HOME/.harr.bash ]; then
    mv $HOME/.harry.bash $HOME/harry_old.bash
fi
cp config/harry.bash ~/.harry.bash


echo "#### including .harry.bash to bashrc"
sed -i '$a #### harry.bash' $HOME/.bashrc
sed -i '$a if [ -f $HOME/.harry.bash ]; then' $HOME/.bashrc
sed -i '$a \\tsource $HOME/.harry.bash' $HOME/.bashrc
sed -i '$a fi' $HOME/.bashrc



