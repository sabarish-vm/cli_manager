#!/usr/bin/env sh
export NVM_DIR="$DOT_OPT/nvm"
mkdir -p "$NVM_DIR"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install node
