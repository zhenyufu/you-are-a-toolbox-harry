#!/bin/bash

echo "#### setting up vim"
sudo apt-get install vim

echo "#### copying vimrc"
if [ -f $HOME/.vimrc ]; then
    mv $HOME/.vimrc $HOME/vimrc_old
fi
cp dot_config/vimrc $HOME/.vimrc

echo "#### copying tmux.conf"
cp dot_config/tmux.conf $HOME/.tmux.conf

echo "#### setting up nvim/lazyvim"
mkdir -p $HOME/.config/nvim
cp -r dot_config/nvim/ $HOME/.config/nvim/

echo "#### copying .harry.bash"
if [ -f $HOME/.harry.bash ]; then
    mv $HOME/.harry.bash $HOME/harry_old.bash
fi
case "$(uname -s)" in
    Linux*)  cp bash_script/harry-linux.bash $HOME/.harry.bash ;;
    Darwin*) cp bash_script/harry-mac.bash $HOME/.harry.bash ;;
esac

echo "#### copying herdr config"
mkdir -p $HOME/.config/herdr
cp dot_config/herdr/config.toml $HOME/.config/herdr/config.toml

echo "#### copying harry-xfce-workspace-switcher"
sudo cp scripts/harry-xfce-workspace-switcher /usr/local/bin/harry-xfce-workspace-switcher

echo "#### copying 20_harry-wake pm script"
sudo cp scripts/20_harry-wake /etc/pm/sleep.d/20_harry-wake

echo "#### including .harry.bash to shellrc"
case "$(uname -s)" in
    Linux*)  SHELL_RC="$HOME/.bashrc" ;;
    Darwin*) SHELL_RC="$HOME/.zshrc" ;;
esac
sed -i '$a #### harry.bash' $SHELL_RC
sed -i '$a if [ -f $HOME/.harry.bash ]; then' $SHELL_RC
sed -i '$a \\tsource $HOME/.harry.bash' $SHELL_RC
sed -i '$a fi' $SHELL_RC
