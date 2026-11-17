#!/usr/bin/env sh

export EGET_BIN="${EGET_BIN:-$HOME/opt/eget/bin}"
export PATH="$EGET_BIN:$PATH"
mkdir -p "${EGET_BIN}"
echo "Placing the binaries in ${EGET_BIN}"

if command -v "eget"; then
    eget --upgrade-only zyedidia/eget
else
    curl -o eget.sh https://zyedidia.github.io/eget.sh
    shasum -a 256 eget.sh # verify with hash below
    bash eget.sh
    mv eget "$EGET_BIN"
    rm eget.sh
fi

eget --upgrade-only "eza-community/eza"
eget --upgrade-only "zellij-org/zellij"
eget --upgrade-only "junegunn/fzf"
eget --upgrade-only "ajeetdsouza/zoxide"
eget --upgrade-only "BurntSushi/ripgrep"
eget --upgrade-only "ismaelgv/rnr"
eget --upgrade-only "sharkdp/fd"
eget --upgrade-only "sharkdp/bat"
eget --upgrade-only "starship/starship"
