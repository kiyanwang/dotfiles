# env.nu
#
# Loaded before config.nu and login.nu
# See https://www.nushell.sh/book/configuration.html

$env.EDITOR = 'nvim'

use std/util "path add"
path add /opt/homebrew/bin
path add "~/.local/bin"
path add "~/.cargo/bin"
# Add nvm default Node version bin to PATH
let nvm_default = (open ~/.nvm/alias/default | str trim)
path add $"~/.nvm/versions/node/v($nvm_default)/bin"

zoxide init nushell | save -f ~/.zoxide.nu
