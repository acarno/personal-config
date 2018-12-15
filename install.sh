#!/bin/bash

# Update .bashrc
patch -b $HOME/.bashrc ./bashrc.diff

# Copy .vimrc
cp -b ./vimrc $HOME/.vimrc

# Copy .tmux.conf
cp -b ./tmux.conf $HOME/.tmux.conf

# Create packages folder and populate
VIMDIR="$HOME/.vim/pack/acarno/start"
mkdir -p ${VIMDIR}
cp -r ./solarized/vim-colors-solarized ${VIMDIR}
cp -r ./vim-sensible ${VIMDIR}
cp -r ./vim-better-whitespace ${VIMDIR}

# Install dircolors (requires dconf-cli)
if hash dconf 2>/dev/null ; then
  ./gnome-terminal-colors-solarized/install.sh -s dark --install-dircolors
else
  echo "Can't install dircolors; need dconf-cli installed."
fi

