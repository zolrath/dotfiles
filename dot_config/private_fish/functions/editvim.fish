function editvim 
  cd (chezmoi source-path)/dot_config/nvim/
  chezmoi edit ~/.config/nvim/init.lua
  chezmoi add ~/.config/nvim/lazy-lock.json
  chezmoi apply
  prevd
end
