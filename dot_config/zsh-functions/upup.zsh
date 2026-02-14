# Update brew, mise, and vim packages.
function upup() {
  echo "Updating all the things!"

  if (( ${+commands[brew]} )); then
    echo "Updating homebrew..."
    brew upgrade
  fi

  echo "Updating mise..."
  mise self-update -y
  mise upgrade

  echo "Updating vim packages..."
  nvim --headless "+Lazy! sync" +qa

  if (( ${+commands[code]} )); then
    echo "Updating vscode extensions..."
    code --update-extensions
  fi

  echo "Updating complete"
}
