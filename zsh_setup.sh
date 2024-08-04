#!/usr/bin/env bash

if command -v zsh &>/dev/null; then zsh_exists=1; fi

if [[ -z "$zsh_exists" ]]; then
	ZSH_OPT_DIR='$HOME/opt/zsh'
	ZSH_INSTALL_DIR=$(realpath "./zsh")
	mkdir -p "$ZSH_INSTALL_DIR"
	ZSH_LINK="https://sourceforge.net/projects/zsh/files/latest/download"
	wget "$ZSH_LINK" -O zsh.tar.xz
	tar xf zsh.tar.xz -C "$ZSH_INSTALL_DIR" --strip-components 1
	cd "$ZSH_INSTALL_DIR"
	./configure --prefix="$HOME/opt/"
	make
	make install
	rm -rf "$ZSH_INSTALL_DIR"
fi

Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
