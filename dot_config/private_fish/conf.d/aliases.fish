# General Aliases
alias editconfig "chezmoi edit ~/.config/fish/config.fish; and chezmoi apply; and source ~/.config/fish/config.fish"
alias j "z"
alias cat "bat"
alias mkt "cd (mktemp -d)"
abbr cz "chezmoi"
# Git Aliases
alias g "git"
alias gs "g status --short"
alias gl "g log --color --graph --abbrev-commit --oneline"
alias gqp "g add --all; and g commit; and g push"
alias gqc "g add --all; and g commit"
alias gpl "g pull"
alias gps "g push"
alias gc "g commit"
alias gaa "g add --all"
alias gco "g checkout"
alias gse "g send-email"
alias wip "g add --all; and g commit -m WIP"
alias squish "gs; and g commit -a --amend -C HEAD"

alias vim "nvim"
alias ex "explorer.exe ."
alias rm "rm -i"
alias cp "cp -i"
alias mv "mv -i"
alias mkdir "mkdir -p"
alias ccd "clear && cd"
alias cg "cd (git rev-parse --show-toplevel)"
abbr lg "lazygit"

alias fd "fdfind"
alias bat "batcat"

abbr c "code ."

# Aliases that overwrite other, existing commands
if command --search hub > /dev/null do
  alias git "hub"
end

if command --search exa > /dev/null do
  alias l "exa -Flagh --sort name --git --icons --group-directories-first"
  alias ll "exa -Flagh --git --icons --group-directories-first --sort modified"
  alias la "exa -Fla --icons"
  alias tree "exa --tree --icons"
  alias ls "exa"
  alias cll "clear; and exa -Flah --icons --sort modified"
end

# Some neat GPG shorthands
function secret
  set output ~/$argv[1].(date +%s).enc
  gpg --encrypt --armor --output $output $argv[1]; and echo "$argv[1] -> $output"
end

function reveal
  set output (echo $argv[1] | rev | cut -c16- | rev)
  gpg --decrypt --output $output $argv[1]; and echo "$argv[1] -> $output"
end

function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
