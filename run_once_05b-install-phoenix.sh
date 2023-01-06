#!/bin/sh

. $HOME/.local/share/chezmoi/helpers

version=1.7.0-rc.1

echo ''

info '🔥🐣 Installing Phoenix'

mix archive.install --force hex phx_new $version

success "Phoenix"

echo ''
