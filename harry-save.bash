#!/bin/bash
cp ~/.vimrc config/vimrc
cp ~/.tmux.conf config/tmux.conf

# save platform-specific harry bash
case "$(uname -s)" in
    Linux*)  cp ~/.harry.bash config/harry-linux.bash ;;
    Darwin*) cp ~/.harry.bash config/harry-mac.bash ;;
esac

# saving nvim/lazyvim config:
cp -r ~/.config/nvim/ config/nvim/
