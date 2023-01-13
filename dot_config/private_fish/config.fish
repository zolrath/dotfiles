source ~/.config/fish/conf.d/exports.fish
source ~/.config/fish/conf.d/paths.fish
source ~/.config/fish/conf.d/aliases.fish

# fzf_configure_bindings --directory=\cf --variables=\e\cv

###################################
# Interactive mode configurations #
###################################
status is-interactive || exit

fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs --processes=\cp

set -x fish_color_command B7D847
# suppress the default login message
set -g fish_greeting

eval (zellij setup --generate-auto-start fish | string collect)
