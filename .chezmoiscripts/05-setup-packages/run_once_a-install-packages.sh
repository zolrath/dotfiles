#!/bin/bash

. "$(chezmoi source-path)/helpers"

echo ''

info '📦 Installing media conversion tools'
{{ if eq .chezmoi.os "darwin" -}}
package_install "media-info"
{{ if eq .chezmoi.os "linux" -}}
package_install "mediainfo"
{{ end -}}
package_install "ffmpeg imagemagick"
success 'media conversion tools'

info '📦 Installing core personal packages'
package_install "fzf jq direnv"
cargo_binstall "atuin"
success 'core personal packages'

info '📦 Installing git packages'
package_install "lazygit gh"
cargo_binstall "difftastic"
success 'git packages'

info '📦 Installing convenience personal packages'
{{ if eq .chezmoi.os "darwin" -}}
package_install "trash"
{{ end -}}
package_install "zoxide ripgrep bat"
cargo_binstall "eza"
success 'convenience personal packages'

info '📦 Installing yazi'
{{ if eq .chezmoi.os "darwin" -}}
package_install "sevenzip poppler fd font-symbols-only-nerd-font"
{{ if eq .chezmoi.os "linux" -}}
package_install "7zip poppler-utils fd-find"
{{ end -}}
package_install "yazi"
success 'yazi'

echo ''
