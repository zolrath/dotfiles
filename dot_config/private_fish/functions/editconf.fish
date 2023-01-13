function editvim 
  cd (chezmoi source-path)/dot_config/nvim/
  chezmoi edit ~/.config/nvim/init.lua
  chezmoi add ~/.config/nvim/lazy-lock.json
  chezmoi apply
  prevd
end

function editcz 
  cd (chezmoi source-path)
  vim .
  chezmoi apply
  prevd
end

function editfish 
  cd (chezmoi source-path)/dot_config/private_fish/
  chezmoi edit ~/.config/fish/config.fish
  chezmoi apply
  source ~/.config/fish/config.fish
  prevd
end
