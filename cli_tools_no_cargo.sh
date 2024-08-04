#!/usr/bin/env bash

####### Install fzf
if command -v fzf &>/dev/null; then
  :
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

printf "Make sure to source fzf at the end of the .rc files\n"

####### Install zoxide
if command -v zoxide &>/dev/null; then
  :
else
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
  echo 'eval "$(zoxide init zsh)"' >>$HOME/.zshrc
fi

####### Install starship prompt

if command -v starship &>/dev/null; then
  :
else
  curl -sS https://starship.rs/install.sh | sh
fi

####### Install cargo and rust
if command cargo 1>/dev/null 2>/dev/null; then
  :
else
  curl https://sh.rustup.rs -sSf | sh
fi

####### Install rust command line tools
# cargo install eza # TODO Can be changed to downloading release file rather than compiling from rust
# cargo install --locked bat
# cargo install ripgrep
# cargo install tealdeer
# cargo install du-dust
# cargo install diskus
# cargo install git-delta
# cargo install rnr
# cargo install pipe-rename
# Add this if needed
# eval "$(starship init zsh)"
#
getgitrelease() {
  dirname=".gitreleasetempdir"
  mkdir "$dirname"
  cd "$dirname"
  wget "$1"
  name=$(echo "$1" | rev | cut -f 1 -d /)
  tar xf "$name"
  filename=$(find . -type f -not -name '*.tar.*' -exec basename {} \;)
  mv filename "$bindir"
  cd ..
  rm "$dirname" -rf
}
## Install zellij
if command -v zellij; then
  :
else
  wget https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
  tar xf zellij-x86_64-unknown-linux-musl.tar.gz
  mv zellij "$HOME/opt/bin/"
  rm zellij-x86_64-unknown-linux-musl.tar.gz
fi

if command -v eza; then
  :
else
  getgitrelease 'https://github.com/eza-community/eza/releases/download/v0.18.24/eza_x86_64-unknown-linux-gnu.tar.gz'
fi
