function editfish
    cd (chezmoi source-path)/dot_config/private_fish/
    vim config.fish
    chezmoi apply
    source ~/.config/fish/config.fish
    prevd
end
