#!/bin/sh
#
# Little script to recompile ElixirLS with the current elixir version.

default_version=0.12.0
version=$default_version
elixir_ls_dir=/tmp/elixir_ls

set -e

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

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

success "Done."
