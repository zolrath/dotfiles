#!/bin/sh

. "$(chezmoi source-path)/helpers"

version=1.7.2

echo ''

info '🔥🐣 Installing Phoenix'

mix archive.install --force hex phx_new $version

success "Phoenix"

info '🔥🐣 Installing Livebook'

mix escript.install --force hex livebook

success "Livebook"

echo ''
