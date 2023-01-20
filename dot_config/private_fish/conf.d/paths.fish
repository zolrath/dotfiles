# Convenience function for only setting PATH if the specified directory exists
set -q MANPATH || set MANPATH ''
function add_man_path
  test -e $argv[1]; and set -gx MANPATH $MANPATH $argv[1]
end

set -q INFOPATH || set INFOPATH ''
function add_info_path
  test -e $argv[1]; and set -gx INFOPATH $INFOPATH $argv[1]
end

# Homebrew paths
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
fish_add_path /opt/homebrew/bin
add_man_path /opt/homebrew/share/man
add_info_path /opt/homebrew/share/info

# Add CUDA to path
fish_add_path /usr/local/cuda/bin

# Fly.io cli path
fish_add_path "$FLYCTL_INSTALL/bin"

# My paths
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/scripts
fish_add_path ~/.local/bin
fish_add_path ~/bin
