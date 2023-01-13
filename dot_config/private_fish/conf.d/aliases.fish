# General Aliases
alias editcz "cd (chezmoi source-path); and vim .; and chezmoi apply; and prevd"
alias editfish "cd (chezmoi source-path)/dot_config/private_fish/; and chezmoi edit ~/.config/fish/config.fish; and chezmoi apply; and source ~/.config/fish/config.fish; and prevd"
# alias editvim "cd (chezmoi source-path)/dot_config/nvim/; and chezmoi edit ~/.config/nvim/init.lua; and chezmoi apply; and prevd"
#
function editvim 
  cd (chezmoi source-path)/dot_config/nvim/
  chezmoi edit ~/.config/nvim/init.lua
  chezmoi add ~/.config/nvim/lazy-lock.json
  chezmoi apply
  prevd
end

alias j "z"
alias cat "bat"
alias mkt "cd (mktemp -d)"
abbr cz "chezmoi"

# Git
abbr    gst  "git status"
abbr    gd   "git diff"
abbr    gdh  "git diff HEAD"
abbr    gc   "git clone $1 $2"
abbr    gcl  "git clean -fdx"
abbr    gcm  "git commit"
abbr    ga   "git add -u ."
abbr    gaa  "git add -A ."
abbr    gpo  "git push origin $1"
abbr    glo  "git log --color --graph --abbrev-commit --oneline"
abbr    grhh "git reset --hard HEAD"
abbr    gcp  "git cherry-pick $1"

alias vim "nvim"
alias ex "explorer.exe ."
alias rm "rm -i"
alias cp "cp -i"
alias mv "mv -i"
alias mkdir "mkdir -p"
alias ccd "clear && cd"
alias cg "cd (git rev-parse --show-toplevel)"
abbr lg "lazygit"

abbr c "code ."

# Aliases that overwrite other, existing commands
if command --search hub > /dev/null do
  alias git "hub"
end

if command --search fdfind > /dev/null do
  alias fd "fdfind"
end

if command --search batcat > /dev/null do
  alias bat "batcat"
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
