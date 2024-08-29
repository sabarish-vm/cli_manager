#!/usr/bin/env sh

filedir="$(realpath $(dirname $0))"
source "${filedir}/eget_from_git.sh"

install_missing "junegunn/fzf"
install_missing "ajeetdsouza/zoxide"
install_missing "BurntSushi/ripgrep"
install_missing "ismaelgv/rnr"
install_missing "sharkdp/fd"
install_missing "starship/starship"
