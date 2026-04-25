#!/bin/bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing Homebrew (if needed)"
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing CLI tools"
brew install nushell neovim zoxide atuin eza git tmux ripgrep fd

echo "==> Installing GUI apps"
brew install --cask ghostty karabiner-elements nikitabobko/tap/aerospace

echo "==> Installing nvm"
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

echo "==> Installing Rust toolchain"
if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

echo "==> Creating symlinks"

# Nushell
mkdir -p "$HOME/Library/Application Support/nushell"
ln -sf "$DOTFILES/nushell/config.nu" "$HOME/Library/Application Support/nushell/config.nu"
ln -sf "$DOTFILES/nushell/env.nu" "$HOME/Library/Application Support/nushell/env.nu"

# Neovim
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES/nvim" "$HOME/.config/nvim"

# Ghostty
ln -sfn "$DOTFILES/ghostty" "$HOME/.config/ghostty"

# AeroSpace
ln -sf "$DOTFILES/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"

# Karabiner
mkdir -p "$HOME/.config/karabiner"
ln -sf "$DOTFILES/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

echo "==> Generating zoxide init script"
zoxide init nushell | tee "$HOME/.zoxide.nu" >/dev/null

echo "==> Done! Open Ghostty and run 'nu' to get started."
echo "    Note: Karabiner-Elements and AeroSpace need permissions in"
echo "    System Settings > Privacy & Security before they'll work."
