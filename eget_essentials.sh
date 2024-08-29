#!/usr/bin/env sh

export EGET_BIN="${EGET_BIN:-$HOME/opt/bin/eget/}"
export PATH="$EGET_BIN:$PATH"

filedir="$(realpath $(dirname $0))"
source "${filedir}/eget_from_git.sh"

install_missing "junegunn/fzf"
install_missing "ajeetdsouza/zoxide"
install_missing "BurntSushi/ripgrep"
install_missing "ismaelgv/rnr"
install_missing "sharkdp/fd"
install_missing "starship/starship"
