# config.nu
#
# Nushell configuration
# See https://www.nushell.sh/book/configuration.html

# settings
$env.config.buffer_editor = 'nvim'
$env.config.plugins.highlight.theme = 'gruvbox-dark'
$env.config.table.mode = 'rounded'
$env.config.table.index_mode = 'always'
$env.config.table.show_empty = true
$env.config.table.trim.methodology = 'wrapping'
$env.config.table.trim.wrapping_try_keep_words = true
$env.config.table.trim.truncating_suffix = '...'

# explore
$env.config.explore.help_banner = true
$env.config.explore.exit_esc = true
$env.config.explore.command_bar_text = '#C4C9C6'
$env.config.explore.status_bar_background = {fg: '#1D1F21' bg: '#C4C9C6'}
$env.config.explore.highlight = {bg: 'yellow' fg: 'black'}
$env.config.explore.table.split_line = '#404040'
$env.config.explore.table.cursor = true
$env.config.explore.table.line_index = true
$env.config.explore.table.line_shift = true
$env.config.explore.table.line_head_top = true
$env.config.explore.table.line_head_bottom = true
$env.config.explore.table.show_head = true
$env.config.explore.table.show_index = true

# history
$env.config.history.max_size = 10000
$env.config.history.sync_on_enter = true
$env.config.history.file_format = 'plaintext'

# completions
$env.config.completions.case_sensitive = false
$env.config.completions.quick = true
$env.config.completions.partial = true
$env.config.completions.algorithm = 'prefix'
$env.config.completions.external.enable = true
$env.config.completions.external.max_results = 100
$env.config.completions.external.completer = null

# filesize
$env.config.filesize.unit = 'metric'
$env.config.filesize.precision = 1

# cursor shape
$env.config.cursor_shape.emacs = 'block'
$env.config.cursor_shape.vi_insert = 'block'
$env.config.cursor_shape.vi_normal = 'underscore'

# general
$env.config.footer_mode = 25
$env.config.float_precision = 2
$env.config.use_ansi_coloring = true
$env.config.edit_mode = 'emacs'
$env.config.show_banner = true
$env.config.render_right_prompt_on_last_line = false

# menus
$env.config.menus = [
  {
    name: completion_menu
    only_buffer_difference: false
    marker: "| "
    type: {
      layout: columnar
      columns: 4
      col_width: 20
      col_padding: 2
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
  }
  {
    name: history_menu
    only_buffer_difference: true
    marker: "? "
    type: {
      layout: list
      page_size: 10
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
  }
  {
    name: help_menu
    only_buffer_difference: true
    marker: "? "
    type: {
      layout: description
      columns: 4
      col_width: 20
      col_padding: 2
      selection_rows: 4
      description_rows: 10
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
  }
  {
    name: commands_menu
    only_buffer_difference: false
    marker: "# "
    type: {
      layout: columnar
      columns: 4
      col_width: 20
      col_padding: 2
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
    source: { |buffer, position|
      $nu.scope.commands
      | where name =~ $buffer
      | each { |it| {value: $it.name description: $it.usage} }
    }
  }
  {
    name: vars_menu
    only_buffer_difference: true
    marker: "# "
    type: {
      layout: list
      page_size: 10
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
    source: { |buffer, position|
      $nu.scope.vars
      | where name =~ $buffer
      | sort-by name
      | each { |it| {value: $it.name description: $it.type} }
    }
  }
  {
    name: commands_with_description
    only_buffer_difference: true
    marker: "# "
    type: {
      layout: description
      columns: 4
      col_width: 20
      col_padding: 2
      selection_rows: 4
      description_rows: 10
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
    source: { |buffer, position|
      $nu.scope.commands
      | where name =~ $buffer
      | each { |it| {value: $it.name description: $it.usage} }
    }
  }
]

source ~/.zoxide.nu
source ~/.local/share/atuin/init.nu

# aliases
def ll [dir: path = "."] { ls -a $dir | sort-by type name }
def whatsmyip [] { http get http://ipecho.net/plain }

alias clc = claude --allow-dangerously-skip-permissions --chrome
alias vi = nvim
alias vim = nvim
alias view = nvim -R
alias tree = eza --tree --level=2 --long --icons --git
