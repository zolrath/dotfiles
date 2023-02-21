#!/bin/sh

. "$(chezmoi source-path)/helpers"

version=1.7.0-rc.3

echo ''

info '🔥🐣 Installing Phoenix'

mix archive.install --force hex phx_new $version

success "Phoenix"

echo ''
