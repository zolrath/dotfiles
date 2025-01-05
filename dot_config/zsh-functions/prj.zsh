# Find all folders with .git directories inside the `~/code` folders and present them in a fzf list
# and cd to the selected directory.
# Anything typed after prj will pre-filter the list. If only one result is found, immediately cd.
function prj() {
  # Check if fzf is installed
  if ! command -v fzf >/dev/null; then
    echo "fzf command not found, cannot use prj without it." >&2
    return 1
  fi

  # Determine the project home
  : "${PRJ_DIR:=$HOME/code}"

  if ! [ -d "$PRJ_DIR" ]; then
    echo "Your PRJ_DIR environment variable is set to '$PRJ_DIR', path does not exist."
    return 1
  fi

  gitprj=$(find "$PRJ_DIR" -type d -name ".git" -maxdepth 4 -exec dirname {} \;)
  prjlist=$(echo "$gitprj" | sed "s|$PRJ_DIR/||g")
  selection=$(echo "$prjlist" | sort | fzf --layout=reverse-list --query="$1" --select-1)

  if [ -d "$PRJ_DIR/$selection" ]; then
    cd "$PRJ_DIR/$selection" || exit
  elif [ -d "$selection" ]; then
    cd "$selection" || exit
  else
    echo "Failed to cd to '$PRJ_DIR/$selection'"
  fi
}
