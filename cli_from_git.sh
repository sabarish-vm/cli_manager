#!/usr/bin/env bash

bindir="$HOME/opt/bin/"
reldir="$HOME/opt/.temp-cli-release"

findlatestversion() {

    tempname=$(curl -Ls -o /dev/null -w "%{url_effective}" "$1")
    echo "$tempname" | rev | cut -f 1 -d '/' | rev

}

getgitrelease() {

    mkdir -p "${reldir}"
    cd "${reldir}"
    mkdir contents
    wget "$1" -q
    tar_name=$(echo "$1" | rev | cut -f 1 -d '/' | rev)
    tar xf "$tar_name" -C ./contents

    exec_path=$(find ./contents -type f -name "$2")

    mv "$exec_path" "$bindir"
    rm "./contents" -rf
    rm -rf "${reldir}"

}

check_and_download() {

    if command -v "$1"; then
        :
    else
        exec_name="$1"
        download_link="$3"
        version=$(findlatestversion "$2")
        download_link=$(echo "$download_link" | sed -E "s#VERSION#${version}#g")
        getgitrelease "$download_link" "$exec_name"
    fi

}

check_and_download_no_v() {

    if command -v "$1"; then
        :
    else
        exec_name="$1"
        download_link="$3"
        version=$(findlatestversion "$2")
        version="${version/v/}"
        download_link=$(echo "$download_link" | sed -E "s#VERSION#${version}#g")
        getgitrelease "$download_link" "$exec_name"
    fi

}

just_download() {

    if command -v "$1"; then
        :
    else
        exec_name="$1"
        download_link="$2"
        getgitrelease "$download_link" "$exec_name"
    fi

}

printf '\n##### fd #####\n'
check_and_download 'fd' 'https://github.com/sharkdp/fd/releases/latest/' 'https://github.com/sharkdp/fd/releases/latest/download/fd-VERSION-x86_64-unknown-linux-gnu.tar.gz'

printf '\n##### zellij #####\n'
just_download 'zellij' 'https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz'

printf '\n##### eza #####\n'
just_download 'eza' "https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz"

printf '\n##### ripgrep #####\n'
check_and_download 'rg' 'https://github.com/BurntSushi/ripgrep/releases/latest/' 'https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep-VERSION-x86_64-unknown-linux-musl.tar.gz'

printf '\n##### lazygit #####\n'
check_and_download_no_v 'lazygit' 'https://github.com/jesseduffield/lazygit/releases/latest/' 'https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_VERSION_Linux_x86_64.tar.gz'

printg '\n##### numbat #####\n'
check_and_download 'numbat' 'https://github.com/sharkdp/numbat/releases/latest' 'https://github.com/sharkdp/numbat/releases/latest/download/numbat-VERSION-x86_64-unknown-linux-gnu.tar.gz'
