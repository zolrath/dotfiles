function vimup --description="Update vim plugins and add lazy-lock.json to chezmoi"
  nvim --headless "+Lazy! sync" +qa &>/dev/null
  chezmoi add ~/.config/nvim/lazy-lock.json
end
