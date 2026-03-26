# config.nu
#
# Nushell configuration
# See https://www.nushell.sh/book/configuration.html

use std/util "path add"
path add "~/.local/bin"
path add "~/.cargo/bin"

# settings
$env.config.buffer_editor = 'nvim'
$env.config.plugins.highlight.custom_themes = '~/.nu/highlight/custom_themes'
$env.config.plugins.highlight.theme = "gruvbox-dark"

# aliases
def ll [] { ls -a | sort-by type name }
def whatsmyip [] { curl http://ipecho.net/plain; echo }

alias clc = claude --allow-dangerously-skip-permissions --chrome
alias vi = nvim
alias vim = nvim
alias view = nvim -R
alias tree = eza --tree --level=2 --long --icons --git
