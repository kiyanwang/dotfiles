# env.nu
#
# Loaded before config.nu and login.nu
# See https://www.nushell.sh/book/configuration.html

$env.EDITOR = 'nvim'

use std/util "path add"
path add /opt/homebrew/bin
path add "~/.local/bin"
path add "~/.cargo/bin"
path add "~/.nvm"

zoxide init nushell | save -f ~/.zoxide.nu
