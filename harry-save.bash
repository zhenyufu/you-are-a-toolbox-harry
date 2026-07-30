#!/bin/bash
[ -f ~/.vimrc ] && cp ~/.vimrc config/vimrc
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf config/tmux.conf

# save platform-specific harry bash
case "$(uname -s)" in
    Linux*)  [ -f ~/.harry.bash ] && cp ~/.harry.bash config/harry-linux.bash ;;
    Darwin*) [ -f ~/.harry.bash ] && cp ~/.harry.bash config/harry-mac.bash ;;
esac

# saving nvim/lazyvim config:
[ -d ~/.config/nvim ] && cp -r ~/.config/nvim/ config/nvim/
