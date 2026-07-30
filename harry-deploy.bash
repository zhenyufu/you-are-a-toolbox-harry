#!/bin/bash

backup_and_copy() {
    local src="$1"
    local dst="$2"
    local label="$3"

    if [ -e "$dst" ]; then
        read -p "$label already exists at $dst. Overwrite? [y/N] " choice
        case "$choice" in
            y|Y)
                local backup="${dst}.bak.$(date +%Y%m%d%H%M%S)"
                mv "$dst" "$backup"
                echo "Backed up to $backup"
                cp -r "$src" "$dst"
                ;;
            *)
                echo "Skipping $label"
                ;;
        esac
    else
        cp -r "$src" "$dst"
    fi
}

echo "#### setting up vim"

echo "#### copying vimrc"
backup_and_copy dot_config/vimrc "$HOME/.vimrc" "vimrc"

echo "#### copying tmux.conf"
backup_and_copy dot_config/tmux.conf "$HOME/.tmux.conf" "tmux.conf"

echo "#### setting up nvim/lazyvim"
backup_and_copy dot_config/nvim "$HOME/.config/nvim" "nvim config"

echo "#### copying .harry.bash"
case "$(uname -s)" in
    Linux*)  backup_and_copy bash_script/harry-linux.bash "$HOME/.harry.bash" ".harry.bash" ;;
    Darwin*) backup_and_copy bash_script/harry-mac.bash "$HOME/.harry.bash" ".harry.bash" ;;
esac

echo "#### copying herdr config"
backup_and_copy dot_config/herdr/config.toml "$HOME/.config/herdr/config.toml" "herdr config"

echo "#### including .harry.bash to shellrc"
case "$(uname -s)" in
    Linux*)  SHELL_RC="$HOME/.bashrc" ;;
    Darwin*) SHELL_RC="$HOME/.zshrc" ;;
esac
sed -i '$a #### harry.bash' $SHELL_RC
sed -i '$a if [ -f $HOME/.harry.bash ]; then' $SHELL_RC
sed -i '$a \\tsource $HOME/.harry.bash' $SHELL_RC
sed -i '$a fi' $SHELL_RC
