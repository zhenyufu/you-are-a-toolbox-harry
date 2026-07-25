#!/bin/bash
cp ~/.vimrc config/vimrc
cp ~/.harry.bash config/harry.bash
cp ~/.tmux.conf config/tmux.conf

# saving nvim/lazyvim config:
cp -r ~/.config/nvim/ config/nvim/

# saving app configs:
cp ~/.config/libinput-gestures.conf config/apps/libinput-gestures.conf
cp ~/.config/redshift/redshift.conf config/apps/redshift.conf
