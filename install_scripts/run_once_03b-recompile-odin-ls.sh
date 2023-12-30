#!/bin/sh
#
# Little script to recompile Odin Language Server

. "$(chezmoi source-path)/helpers"

odin_ls_dir=/tmp/odin_ls

set -e

echo ''

info 'Recompiling Odin Language Server'

git clone --depth 1 https://github.com/DanielGavin/ols.git $odin_ls_dir

cd $odin_ls_dir

./build.sh

mv ols ~/bin/

rm -rf $odin_ls_dir

success "odin language server"

echo ''
