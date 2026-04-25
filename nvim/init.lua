-- init.lua
-- Author: Nadeem Shabir
-- Source: https://github.com/kiyanwang/dotfiles

-- Set leader key before anything else
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Disable netrw (using nvim-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load core options
require("config.options")

-- Bootstrap and load plugins via lazy.nvim
require("config.lazy")

-- Load keymaps and autocmds after plugins
require("config.keymaps")
require("config.autocmds")
