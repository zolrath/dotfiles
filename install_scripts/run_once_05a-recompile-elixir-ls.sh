#!/bin/sh
#
# Little script to recompile ElixirLS with the current elixir version.

. $HOME/.local/share/chezmoi/helpers

version=0.13.0
elixir_ls_dir=/tmp/elixir_ls

set -e

echo ''

info 'Recompiling ElixirLS'

git clone --depth 1 --branch v$version https://github.com/elixir-lsp/elixir-ls.git $elixir_ls_dir

cd $elixir_ls_dir

mix local.rebar --force
mix local.hex --force
mix deps.get
mix elixir_ls.release -o ~/.vscode/extensions/jakebecker.elixir-ls-$version/elixir-ls-release/
mix elixir_ls.release -o ~/tools/elixir-ls/

rm -rf $elixir_ls_dir

success "elixir-ls"

echo ''
