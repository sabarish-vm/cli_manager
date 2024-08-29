#!/usr/bin/env bash

### Download nvim from github releases
echo "Do you want to download and install nvim ? (y/n)"
read -r choice

if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    rm -rf "$HOME/opt/nvim"
    tar -C "$HOME/opt" -xzf nvim-linux64.tar.gz
    ln -s "$HOME/opt/nvim-linux64/bin/nvim" "$HOME/opt/bin/"
fi

#### Lazy Vim configuration
# Backup existing neovim config
mv ~/.config/nvim{,.bak}
# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

### Download personlized lazyvim extension
git clone -b lazyvim https://github.com/sabarish-vm/neovim-config.git ~/.config/nvim
