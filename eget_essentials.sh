#!/usr/bin/env sh

export EGET_BIN="${EGET_BIN:-$HOME/opt/bin/eget/}"
export PATH="$EGET_BIN:$PATH"
mkdir -p "${EGET_BIN}"
echo "Placing the binaries in ${EGET_BIN}"

if command -v "eget"; then
    eget --upgrade-only zyedidia/eget
else
    curl -o eget.sh https://zyedidia.github.io/eget.sh
    shasum -a 256 eget.sh # verify with hash below
    bash eget.sh
    rm eget.sh
fi

install_missing() {
    if command -v "${1}"; then
        :
    else
        eget --upgrade-only "$1"
    fi

}
install_missing "junegunn/fzf"
install_missing "ajeetdsouza/zoxide"
install_missing "BurntSushi/ripgrep"
install_missing "ismaelgv/rnr"
install_missing "sharkdp/fd"
install_missing "starship/starship"
