function vim; command nvim $argv; end

alias l="exa -Flagh --sort name --git --icons --group-directories-first"
alias ll="exa -Flagh --git --icons --group-directories-first --sort modified"
alias la="exa -Fla --icons"
alias tree="exa --tree --icons"
alias ls="exa"
alias cll="clear; and exa -Flah --icons --sort modified"

alias ex="explorer.exe ."
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias ccd="clear && cd"
alias cg="cd (git rev-parse --show-toplevel)"
alias lg="lazygit"

alias fd="fdfind"
alias bat="batcat"

alias c="code ."

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
