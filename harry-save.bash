#!/bin/bash
[ -f ~/.vimrc ] && cp ~/.vimrc config/vimrc
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf config/tmux.conf

# save platform-specific harry bash
case "$(uname -s)" in
    Linux*)  [ -f ~/.harry.bash ] && cp ~/.harry.bash bash_script/harry-linux.bash ;;
    Darwin*) [ -f ~/.harry.bash ] && cp ~/.harry.bash bash_script/harry-mac.bash ;;
esac

# saving nvim/lazyvim config:
[ -d ~/.config/nvim ] && cp -r ~/.config/nvim/ config/nvim/

# saving herdr config:
[ -f ~/.config/herdr/config.toml ] && cp ~/.config/herdr/config.toml config/herdr/config.toml
