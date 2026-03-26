# config.nu
#
# Nushell configuration
# See https://www.nushell.sh/book/configuration.html

use std/util "path add"
path add "~/.local/bin"
path add "~/.cargo/bin"

# settings
$env.config.buffer_editor = 'nvim'
$env.config.plugins.highlight.theme = 'gruvbox-dark'
$env.config.table.mode = 'rounded'
$env.config.table.index_mode = 'always'
$env.config.table.show_empty = true
$env.config.table.trim.methodology = 'wrapping'
$env.config.table.trim.wrapping_try_keep_words = true
$env.config.table.trim.truncating_suffix = '...'

# aliases
def ll [] { ls -a | sort-by type name }
def whatsmyip [] { http get http://ipecho.net/plain }

alias clc = claude --allow-dangerously-skip-permissions --chrome
alias vi = nvim
alias vim = nvim
alias view = nvim -R
alias tree = eza --tree --level=2 --long --icons --git
