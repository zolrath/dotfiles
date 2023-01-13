function vim; command nvim $argv; end

function l; command exa -Flagh --sort name --git --icons --group-directories-first $argv; end
function ll; command exa -Flagh --git --icons --group-directories-first --sort modified $argv; end
function la; command exa -Fla --icons; end
function tree; command exa --tree --icons $argv; end
function ls; command exa $argv; end
function cll; command clear; and exa -Flah --icons --sort modified $argv; end

function ex; command explorer.exe .; end
function rm; command rm -i $argv; end
function cp; command cp -i $argv; end
function mv; command mv -i $argv; end
function mkdir; command mkdir -p $argv; end
function ccd; command clear && cd $argv; end
function cg; command cd (git rev-parse --show-toplevel); end
function lg; command lazygit; end

function c; code .; end

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
