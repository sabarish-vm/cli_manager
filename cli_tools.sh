#!/usr/bin/env bash

####### Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

printf "Make sure to source fzf at the end of the .rc files\n"

####### Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
echo 'eval "$(zoxide init zsh)"' >>$HOME/.zshrc

####### Install starship prompt
curl -sS https://starship.rs/install.sh | sh

####### Install cargo and rust
if command cargo 1>/dev/null 2>/dev/null; then
  :
else
  curl https://sh.rustup.rs -sSf | sh
fi

####### Install rust command line tools
cargo install eza # TODO Can be changed to downloading release file rather than compiling from rust
cargo install --locked bat
cargo install ripgrep
cargo install tealdeer
cargo install du-dust
cargo install diskus
cargo install git-delta
cargo install rnr
cargo install pipe-rename
# Add this if needed
# eval "$(starship init zsh)"
#
## Install zellij
wget https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar xf zellij-x86_64-unknown-linux-musl.tar.gz
mv zellij "$HOME/opt/bin/"
rm zellij-x86_64-unknown-linux-musl.tar.gz
