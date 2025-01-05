#!/bin/sh

. "$(chezmoi target-path)/.czhelpers"

echo ''

if ! [ -x "$(command -v nvim)" ]; then
	info '💻 Installing mise neovim'
	mise install neovim
	success 'mise neovim'
else
	skip 'mise neovim'
fi

# Formatting for bash
uv_tool_install "beautysh" # bash formatting
uv_tool_install "black"    # python formatting
cargo_binstall "stylua"    # lua formatting
brew_install "shellcheck"  # shell linting
cargo_binstall "rustywind" # tailwind class reordering

# Needed for danielfalk/smart-open.nvim
{{ if eq .chezmoi.os "darwin" -}}
package_install "sqlite"
{{ else if eq .chezmoi.os "linux" -}}
package_install "sqlite3 libsqlite3-dev"
{{ end -}}

info '💻 Installing neovim packages'
nvim --headless "+Lazy! sync" +qa >/dev/null 2>&1
success 'neovim packages'

echo ''
