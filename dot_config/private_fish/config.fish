###################################
# Interactive mode configurations #
###################################
status is-interactive || exit

#fzf_configure_bindings --directory=\cf --variables=\ev --git_log=\eo --git_status=\eg --processes=\ep
set --export fzf_dir_opts --bind "ctrl-v:execute(nvim {} &> /dev/tty)"
#set v (ls | fzf --bind "ctrl-v:execute(nvim {} &> /dev/tty)")

set -Ux fifc_editor nvim

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
direnv hook fish | source

#eval (zellij setup --generate-auto-start fish | string collect)
# ~/.local/bin/mise activate fish | source
if status is-interactive
    mise activate fish | source
else
    mise activate fish --shims | source
end

function storePathForWindowsTerminal --on-variable PWD
    if test -n "$WT_SESSION"
        printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
    end
end
