# env.nu
#
# Loaded before config.nu and login.nu
# See https://www.nushell.sh/book/configuration.html

$env.EDITOR = 'nvim'

use std/util "path add"
path add /opt/homebrew/bin
path add "~/.local/bin"
path add "~/.cargo/bin"
path add "~/.orbstack/bin"  # OrbStack docker/orb CLIs (installer doesn't wire up nushell)
path add "~/.config/xata/bin"
# Add the nvm-managed Node to PATH. nushell can't call nvm (it's a bash
# function), so resolve the version directory ourselves. `~/.nvm/alias/default`
# holds either a concrete version ("24.19.0") or a floating alias ("lts/*"),
# and only the former maps onto a directory name -- so trust it just when it
# resolves to a real directory, otherwise take the highest installed version.
let nvm_versions = ("~/.nvm/versions/node" | path expand)
if ($nvm_versions | path exists) {
    let alias = (try { open ~/.nvm/alias/default | str trim } catch { "" })
    let pinned = if ($alias | str starts-with "v") { $alias } else { $"v($alias)" }
    let pinned_dir = ($nvm_versions | path join $pinned)
    let installed = (
        ls $nvm_versions
        | where type == dir
        | get name
        | sort --natural
    )
    let node_dir = if ($alias != "" and ($pinned_dir | path exists)) {
        $pinned_dir
    } else if ($installed | is-not-empty) {
        $installed | last
    } else {
        ""
    }
    if ($node_dir != "") {
        path add ($node_dir | path join "bin")
    }
}

zoxide init nushell | save -f ~/.zoxide.nu
