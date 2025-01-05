#!/bin/sh

. "$(chezmoi target-path)/.czhelpers"

echo ''

if ! [ -x "$(command -v tailwindcss)" ]; then
	info '🍃 Installing tailwindcss cli'

	{{ if eq .chezmoi.os "darwin" -}}
	os="linux"
	{{ else if eq .chezmoi.os "linux" -}}
	os="macos"
	{{ end -}}

	architecture=""
	case $(uname -m) in
	x86_64) architecture="x64" ;;
	arm64) architecture="arm64" ;;
	esac

	echo "Detected architecture: ${architecture}"

	curl -sLo ~/.local/bin/tailwindcss "https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-${os}-${architecture}"
	chmod +x ~/.local/bin/tailwindcss
	success 'tailwindcss cli'
else
	skip 'tailwindcss cli'
fi

echo ''
