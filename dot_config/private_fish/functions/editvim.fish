function editvim
    cd (chezmoi source-path)/dot_config/nvim/
    vim init.lua
    chezmoi add ~/.config/nvim/lazy-lock.json
    chezmoi apply
    prevd
end
