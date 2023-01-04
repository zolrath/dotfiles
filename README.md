# zolrath's Dotfiles

These dotfiles rely on [Chezmoi](https://www.chezmoi.io) to manage their installation.

## Chezmoi installation
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply zolrath -b $HOME/.local/bin
```

Here we use [asdf](https://asdf-vm.com), which I also use for [Elixir](https://github.com/asdf-vm/asdf-elixir), [Erlang](https://github.com/asdf-vm/asdf-erlang) and [nodejs](https://github.com/asdf-vm/asdf-nodejs)

1. Install `asdf`
Follow the [installation instructions](https://asdf-vm.com/guide/getting-started.html)

2. Install the chezmoi plugin and chezmoi
```
asdf plugin add chezmoi && asdf install chezmoi latest && asdf global chezmoi latest
```

3. Apply the dotfiles
```
chezmoi init --apply --verbose https://github.com/zolrath/dotfiles.git
```

## Font
Install [JetBrainsMono modified with NerdFont](https://github.com/jtbx/jetbrainsmono-nerdfont)
