###################################
# Interactive mode configurations #
###################################
status is-interactive || exit

source ~/.config/fish/conf.d/exports.fish
source ~/.config/fish/conf.d/paths.fish
source ~/.config/fish/conf.d/aliases.fish

fzf_configure_bindings --directory=\cf --variables=\ev --git_log=\eo --git_status=\eg --processes=\ep

set -x fish_color_command B7D847
# suppress the default login message
set -g fish_greeting

eval (zellij setup --generate-auto-start fish | string collect)
