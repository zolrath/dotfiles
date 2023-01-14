###################################
# Interactive mode configurations #
###################################
status is-interactive || exit

fzf_configure_bindings --directory=\cf --variables=\ev --git_log=\eo --git_status=\eg --processes=\ep

set -x fish_color_command B7D847

# suppress the default login message
set -g fish_greeting

set ZELLIJ_AUTO_ATTACH false
set ZELLIJ_AUTO_EXIT true
eval (zellij setup --generate-auto-start fish | string collect)
