# zolrath's Dotfiles

These dotfiles rely on [Chezmoi](https://www.chezmoi.io/) to manage their installation.

## Chezmoi installation
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply zolrath
```

## Set Caps Lock to Esc/Ctrl
[Karabiner-Elements](https://karabiner-elements.pqrs.org/) combined with [e0da Caps Lock](https://ke-complex-modifications.pqrs.org/#e0da_caps_lock)

## Any handy scripts/aliases?
- [prj](https://github.com/zolrath/dotfiles/blob/main/dot_config/zsh-functions/prj.zsh) - allow quick `cd` to any `.git` repo in your `~/code/` directory. Uses `fzf` to allow fuzzy finding from the list. If you type `prj somthing` it will pre-filter on `something` and immediately `cd` into the directory if only one result is found.
- [cdf](https://github.com/zolrath/dotfiles/blob/main/dot_config/zsh-functions/cdf.zsh) - `cd` to the directory open in the frontmost MacOS Finder.

## What's it give me?
- [Ghostty](https://ghostty.org/): Terminal application, very fast with a nice quake mode terminal (shift+cmd+space)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) - zsh prompt theme.
- [homebrew](https://brew.sh/) - osx package manager.
- [mise](https://mise.jdx.dev/) - ⭐️ - nvm but for every programming language.
- [zoxide](https://github.com/ajeetdsouza/zoxide) - ⭐️ - quick jump to common folders with fuzzy matching. (j wf => takes you to ~/code/dmed-cm-media/wf-services/)
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder cli tool, pipe things into it and fuzzy find on them.
- [atuin](https://github.com/atuinsh/atuin) - ⭐️ - vastly improved terminal history.
- [lazygit](https://github.com/jesseduffield/lazygit) - ⭐️ - very nice TUI for git that makes reviewing and committing segments of code very nice.
- [difftastic](https://github.com/Wilfred/difftastic) - syntax aware git diffs, shows what actually changed conceptually much better.
- [eza](https://github.com/eza-community/eza) - git and mount aware ls replacement.
- [bat](https://github.com/sharkdp/bat) - it's cat but with syntax highlighting and much faster.

## If you're in a terminal and have to edit a text file, what editor do you use?
- [neovim](https://neovim.io/) - its vim but it knows kung-fu. See my [README.md](https://github.com/zolrath/dotfiles/tree/main/dot_config/nvim/README.md) for details.

## What languages does this set up?
More to come as more projects are worked on but this currently sets up:

### NodeJS

### Rust

### Elixir

### Python
- Uses [uv](https://docs.astral.sh/uv/) for package and project management

### PHP
- Installed with imagemagick extensions
- [Composer](https://getcomposer.org/) installed
- [Laravel](https://laravel.com/) installed
