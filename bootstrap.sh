#!/bin/bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Symlink a directory into place, refusing to nest inside an existing real one.
# `ln -sfn src dir` silently creates dir/src when dir is a real directory, which
# is how you end up with ~/.config/nvim/nvim on a machine that already had one.
link_dir() {
    local src="$1" dest="$2"
    if [ -d "$dest" ] && [ ! -L "$dest" ]; then
        echo "    !! $dest is a real directory — moving it to $dest.bak"
        mv "$dest" "$dest.bak"
    fi
    ln -sfn "$src" "$dest"
}

echo "==> Installing Homebrew (if needed)"
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Unconditionally, so brew and everything it installs is on PATH for the rest
# of this script — not just on the branch where we installed it.
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "==> Checking Xcode command line tools"
# telescope-fzf-native builds with `make`; the Homebrew installer only pulls the
# CLT in when Homebrew itself is being installed fresh.
xcode-select -p &>/dev/null || xcode-select --install || true

echo "==> Tapping third-party formulae"
brew tap FelixKratz/formulae
brew tap nikitabobko/tap
# Recent Homebrew refuses to load formulae from untrusted taps in some paths.
brew trust --tap FelixKratz/formulae nikitabobko/tap 2>/dev/null || true

echo "==> Installing CLI tools"
brew install nushell starship neovim zoxide atuin eza git tmux ripgrep fd jq \
    FelixKratz/formulae/sketchybar \
    FelixKratz/formulae/borders

echo "==> Installing GUI apps"
brew install --cask ghostty wezterm karabiner-elements nikitabobko/tap/aerospace

echo "==> Installing fonts"
# SauceCodePro -> Ghostty + WezTerm; Hack -> SketchyBar icons/labels;
# sketchybar-app-font -> the front-app pill glyphs.
brew install --cask \
    font-sauce-code-pro-nerd-font \
    font-hack-nerd-font \
    font-sketchybar-app-font

echo "==> Installing nvm and a default Node"
export NVM_DIR="$HOME/.nvm"
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
# shellcheck disable=SC1091
. "$NVM_DIR/nvm.sh"
# env.nu reads ~/.nvm/alias/default at startup, so a default alias MUST exist or
# every Nushell launch errors. Mason's LSP servers need Node anyway.
nvm install --lts
nvm alias default 'lts/*'

echo "==> Installing Rust toolchain"
if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

echo "==> Creating symlinks"
mkdir -p "$HOME/.config"

# Nushell
NU_CONFIG="$HOME/Library/Application Support/nushell"
mkdir -p "$NU_CONFIG/autoload"
ln -sf "$DOTFILES/nushell/config.nu" "$NU_CONFIG/config.nu"
ln -sf "$DOTFILES/nushell/env.nu" "$NU_CONFIG/env.nu"
# linear.nu is a module `use`d by autoload/claude.nu; it must live in the config
# dir (not autoload) or Nushell double-loads it and errors with
# "Can't evaluate block in IR mode".
ln -sf "$DOTFILES/nushell/linear.nu" "$NU_CONFIG/linear.nu"
ln -sf "$DOTFILES/nushell/autoload/claude.nu" "$NU_CONFIG/autoload/claude.nu"

link_dir "$DOTFILES/nvim" "$HOME/.config/nvim"
link_dir "$DOTFILES/ghostty" "$HOME/.config/ghostty"
link_dir "$DOTFILES/wezterm" "$HOME/.config/wezterm"
link_dir "$DOTFILES/sketchybar" "$HOME/.config/sketchybar"
link_dir "$DOTFILES/borders" "$HOME/.config/borders"

# Starship — the prompt format and Catppuccin palette. The prompt icons are
# Nerd Font private-use glyphs (U+E711, U+F011B), so this needs the Nerd Font
# installed above to render.
ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

# AeroSpace
ln -sf "$DOTFILES/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"

# tmux
ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"

# Karabiner
mkdir -p "$HOME/.config/karabiner"
ln -sf "$DOTFILES/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# SketchyBar execs these directly; a lost exec bit is a silent empty bar.
chmod +x "$DOTFILES/sketchybar/sketchybarrc" "$DOTFILES/sketchybar/plugins/"*.sh

echo "==> Generating shell init scripts"
# config.nu `source`s both of these. Nushell resolves `source` at parse time, so
# a missing file is a hard error, not a warning — these must exist before nu runs.
zoxide init nushell | tee "$HOME/.zoxide.nu" >/dev/null
mkdir -p "$HOME/.local/share/atuin"
atuin init nushell | tee "$HOME/.local/share/atuin/init.nu" >/dev/null
# Homebrew's starship formula only ships fish completions, so the Nushell hook
# has to be generated. Nushell auto-sources everything in vendor/autoload.
mkdir -p "$NU_CONFIG/vendor/autoload"
starship init nu | tee "$NU_CONFIG/vendor/autoload/starship.nu" >/dev/null

echo
echo "==> Done! Open Ghostty and run 'nu' to get started."
echo
echo "    Manual steps still needed:"
echo "      - Grant Karabiner-Elements and AeroSpace accessibility permissions"
echo "        in System Settings > Privacy & Security."
echo "      - Set up ~/.gitconfig (the repo copy is a stale template)."
echo "      - Install the Claude Code CLI — the 'clc' alias and the 'cc'"
echo "        commands in nushell/autoload/claude.nu depend on it."
echo "      - Export LINEAR_API_KEY for 'cc issue' / 'cc deps' / 'cc linear todo'."
echo "      - Run 'atuin login' to sync shell history."
echo "      - Open nvim once to let lazy.nvim and Mason bootstrap."
