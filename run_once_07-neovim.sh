#!/bin/sh

. $HOME/.local/share/chezmoi/helpers

echo ''

info '📄 Installing nvchad'
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

if ! [ -x "$(command -v bob)" ]; then
    info '💻 Installing bob'
    cargo install bob-nvim
    asdf reshim rust
    success 'bob'
else
    skip 'bob'
fi

bob install stable
bob use stable

echo ''
