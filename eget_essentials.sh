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
    mv eget $HOME/opt/bin/eget/
    rm eget.sh
fi
