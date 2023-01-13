# Setting up the Path

set -e fish_user_paths

# Convenience function for only setting PATH if the specified directory exists
function setpath
  test -e $argv[1]; and fish_add_path $argv[1]
end

function setmanpath
  test -e $argv[1]; and set MANPATH $argv[1] $MANPATH 
end

function setinfopath
  test -e $argv[1]; and set INFOPATH $argv[1] $INFOPATH 
end

if test -z "$XDG_RUNTIME_DIR"
  set -x XDG_RUNTIME_DIR "/tmp/$USER-runtime-dir"
  if test ! -e "$XDG_RUNTIME_DIR"
    mkdir "$XDG_RUNTIME_DIR"
    chmod 0700 "$XDG_RUNTIME_DIR"
  end
end

# Set Nix include path if it exists
if test -e ~/.nix-profile/etc/profile.d/nix.sh
  fenv source ~/.nix-profile/etc/profile.d/nix.sh
end

# Homebrew paths
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
setpath /opt/homebrew/bin
setmanpath /opt/homebrew/share/man
setinfopath /opt/homebrew/share/info

#set -U fish_user_paths "/usr/local/sbin" $fish_user_paths # homebrew - Intel
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths # homebrew ARM


# My paths
setpath ~/.local/scripts
setpath ~/.local/bin
setpath ~/bin
