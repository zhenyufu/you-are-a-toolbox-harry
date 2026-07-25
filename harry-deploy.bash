#!/bin/bash

echo "#### setting up vim"
sudo apt-get install vim

echo "#### copying vimrc"
if [ -f $HOME/.vimrc ]; then
    mv $HOME/.vimrc $HOME/vimrc_old
fi
cp config/vimrc $HOME/.vimrc

echo "#### copying tmux.conf"
cp config/tmux.conf $HOME/.tmux.conf

echo "#### setting up nvim/lazyvim"
mkdir -p $HOME/.config/nvim
cp -r config/nvim/ $HOME/.config/nvim/

echo "#### copying .harry.bash"
if [ -f $HOME/.harry.bash ]; then
    mv $HOME/.harry.bash $HOME/harry_old.bash
fi
case "$(uname -s)" in
    Linux*)  cp config/harry-linux.bash $HOME/.harry.bash ;;
    Darwin*) cp config/harry-mac.bash $HOME/.harry.bash ;;
esac

echo "#### including .harry.bash to shellrc"
case "$(uname -s)" in
    Linux*)  SHELL_RC="$HOME/.bashrc" ;;
    Darwin*) SHELL_RC="$HOME/.zshrc" ;;
esac
sed -i '$a #### harry.bash' $SHELL_RC
sed -i '$a if [ -f $HOME/.harry.bash ]; then' $SHELL_RC
sed -i '$a \\tsource $HOME/.harry.bash' $SHELL_RC
sed -i '$a fi' $SHELL_RC
