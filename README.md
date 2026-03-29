# Dotfiles

My shell and tool configs, managed via symlinks.

## What's included

- **nushell** — shell config (`config.nu`, `env.nu`)
- **neovim** — Lua-based config with lazy.nvim, native LSP, treesitter, telescope
- **aerospace** — tiling window manager for macOS
- **ghostty** — terminal emulator config
- **tmux** — terminal multiplexer config
- **git** — `.gitconfig`

## Setup

Each tool has its own subdirectory. Configs are symlinked to their expected locations:

```
dotfiles/nushell/    → ~/Library/Application Support/nushell/
dotfiles/nvim/       → ~/.config/nvim/
dotfiles/aerospace/  → ~/.aerospace.toml
dotfiles/ghostty/    → ~/.config/ghostty/
```
