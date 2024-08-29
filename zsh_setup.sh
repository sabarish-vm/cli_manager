#!/usr/bin/env sh

if command -v zsh /dev/null 2>&1; then zsh_exists=1; fi

if [ -z "$zsh_exists" ]; then
    #ZSH_OPT_DIR="$HOME/opt/zsh"
    ZSH_INSTALL_DIR="$(realpath './zsh')"
    mkdir -p "$ZSH_INSTALL_DIR"
    ZSH_LINK="https://sourceforge.net/projects/zsh/files/latest/download"
    wget "$ZSH_LINK" -O zsh.tar.xz
    tar xf zsh.tar.xz -C "$ZSH_INSTALL_DIR" --strip-components 1
    cd "$ZSH_INSTALL_DIR" || exit
    ./configure --prefix="$HOME/opt/"
    make
    make install
    rm -rf "$ZSH_INSTALL_DIR"
fi
