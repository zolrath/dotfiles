###################################
# Interactive mode configurations #
###################################
status is-interactive || exit

fzf_configure_bindings --directory=\cf --variables=\ev --git_log=\eo --git_status=\eg --processes=\ep

set -x fish_color_command B7D847

# suppress the default login message
set -g fish_greeting

# set -x SHELL /bin/bash

# direnv hook fish | source
#
bind --mode default \cb _cd_git_root
bind --mode insert \cb _cd_git_root

set ZELLIJ_AUTO_ATTACH false
set ZELLIJ_AUTO_EXIT true

atuin init fish | source

#eval (zellij setup --generate-auto-start fish | string collect)
rtx activate fish | source
