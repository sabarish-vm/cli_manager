brew install fzf
brew install zoxide
####### Install starship prompt

echo '##### starship #####'
if command -v starship &>/dev/null; then
    :
else
    curl -sS https://starship.rs/install.sh | sh
fi

###### Install eget
if command -v "eget"; then
    eget --upgrade-only zyedidia/eget
else
    curl -o eget.sh https://zyedidia.github.io/eget.sh
    shasum -a 256 eget.sh # verify with hash below
    bash eget.sh
    rm eget.sh
fi
