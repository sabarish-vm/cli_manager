#!/usr/bin/env bash

####### Install cargo and rust
echo '##### rust #####'
if command cargo 1>/dev/null 2>/dev/null; then
  :
else
  curl https://sh.rustup.rs -sSf | sh
fi

####### Install fzf
echo '##### fzf ####'
if command -v fzf &>/dev/null; then
  echo 'Exists'
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

####### Install zoxide
echo '##### zoxide #####'
if command -v zoxide &>/dev/null; then
  :
else
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
  echo 'eval "$(zoxide init zsh)"' >>$HOME/.zshrc
fi

####### Install starship prompt

echo '##### starship #####'
if command -v starship &>/dev/null; then
  :
else
  curl -sS https://starship.rs/install.sh | sh
fi
