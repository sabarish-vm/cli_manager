#!/usr/bin/env bash

######## Install cargo and rust
#echo '##### rust #####'
#if command cargo 1>/dev/null 2>/dev/null; then
#  :
#else
#  curl https://sh.rustup.rs -sSf | sh
#fi

###### Install eget
if command -v "eget"; then
    eget --upgrade-only zyedidia/eget
else
    curl -o eget.sh https://zyedidia.github.io/eget.sh
    shasum -a 256 eget.sh # verify with hash below
    bash eget.sh
    rm eget.sh
fi

####### Install fzf
echo '##### fzf ####'
if command -v fzf &>/dev/null; then
    echo 'Exists'
else
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/opt/fzf
    ~/opt/fzf/install
fi

####### Install zoxide
echo '##### zoxide #####'
if command -v zoxide &>/dev/null; then
    :
else
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

####### Install starship prompt

echo '##### starship #####'
if command -v starship &>/dev/null; then
    :
else
    curl -sS https://starship.rs/install.sh | sh
fi
