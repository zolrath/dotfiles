# Vim - :q to quit

This [Neovim](https://neovim.io/) configuration is built using [LazyVim](https://www.lazyvim.org/) as a base with numerous customizations.

## Rebinds
- `J` still joins lines but no longer moves your cursor.
- `cg*` changes the word your cursor is currently on, . to repeat, n to skip
- `<C-d>` triggers emmet expansion, use in insert mode at end of emmet string.
- `<C-i>` toggle showing diagnostic lines on multiple lines, useful for long diagnostics or multiple on one line.

## LazyVim Plugins
### Core
- test.core - add test runner support via [neotest](https://github.com/nvim-neotest/neotest)
- dap.core - add [DAP](https://microsoft.github.io/debug-adapter-protocol/) (Debug Adapter Protocol) support
- lsp.none-ls - simplify [LSP](https://microsoft.github.io/language-server-protocol/) (Language Server Protocol) configuration

### Languages
- lang.typescript - add typescript support
- lang.rust - add rust support
- lang.elixir - add elixir support
- lang.json - add JSON support
- lang.python - add python support
- lang.php - add php support
- lang.tailwind - add tailwind autocomplete and color preview support

### UI
- util.mini-hipatterns - highlight hex and tailwind colors in text
- ui.treesitter-context - show context of function or loop you're in if top is off screen

### New Commands
- [flash.nvim](https://github.com/folke/flash.nvim) - ⭐️ - `s` followed by letters of a word to quickly jump to it. `S` for quickly selecting code via treesitter.
- [editor.harpoon](https://github.com/ThePrimeagen/harpoon) - ⭐️ - quickly jump between files by adding them to your harpoon list. (`<leader-H>` to add to list, `<leader-1,2,3,4,5>` to jump. `<leader-h>` to manage quick list.)
- editor.mini-files - allow you to edit your file system in vim, move files etc
- coding.mini-surround - `gsa`, `gsd` `gsr` to add/delete/replace surrounds.
- editor.dial - allow <C-a> and <C-x> to increment/decrement more things such as true/false or days
- editor.inc-rename - `leader-cr` to do a visual rename of the current word
- coding.yanky - `<leader-p>` for a yank ring of previous items copied

### Utilities
- util.project - adds project folder selector
- util.dot - support for dotfiles
- util.chezmoi - support for autoreloading chezmoi files when edited
- ai.copilot - add github copilot support

### Excessive Style
- ui.smear-cursor - Makes the cursor smear when jumping around to make tracking its location easier
- ui.mini-animate - Animates page scrolls for easier tracking

## Additional Plugins
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - intelligent autopairs: { }, " ", do end, etc.
- [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy) - ⭐️ - quickly move between symbols in the current file like a directory structure
- [lsp_lines](https://git.sr.ht/~whynothugo/lsp_lines.nvim) - enable multiple line diagnostics (`<C-i>`)
- [lsp_signature](https://github.com/ray-x/lsp_signature.nvim) - show function args as you type.
- [suda.vim](https://github.com/lambdalisue/vim-suda) - Allows `:SudaWrite` to attempt to write the current file with sudo even if originally opened without sudo.
