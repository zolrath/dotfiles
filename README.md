# zolrath's Dotfiles

These dotfiles rely on [Chezmoi](https://www.chezmoi.io) to manage their installation.

## Chezmoi installation
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply zolrath
```

## OS X
### iTerm 2
#### Change font to JetBrainsMono NF
In order to allow fancy status bar lines and whatnot we're using JetBrainsMono with NerdFont characters.
Swap to JetBrainsMono NF by going to "iTerm → Preferences → Profiles → Text → Font".

#### Enable word jumps and word deletion, aka natural text selection
By default, word jumps (option + → or ←) and word deletions (option + backspace) do not work. To enable these, go to "iTerm → Preferences → Profiles → Keys → Key mappings → Presets... → Natural Text Editing → Boom! Head explodes"
