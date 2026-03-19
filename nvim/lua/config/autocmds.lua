local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Equalise splits on resize
autocmd("VimResized", {
  group = augroup("EqualSplits", {}),
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- Filetype-specific indentation
autocmd("FileType", {
  group = augroup("FiletypeIndent", {}),
  pattern = "php",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- Puppet iskeyword
autocmd("FileType", {
  group = augroup("PuppetKeyword", {}),
  pattern = "puppet",
  callback = function()
    vim.opt_local.iskeyword:append(":")
  end,
})

-- Filetype associations
autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  group = augroup("MarkdownFiletype", {}),
  pattern = "*.md",
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})

autocmd("BufReadPost", {
  group = augroup("EyamlSyntax", {}),
  pattern = "*.eyaml",
  callback = function()
    vim.bo.syntax = "yaml"
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", {}),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Today command (appends current date)
vim.api.nvim_create_user_command("Today", function()
  local today = os.date("%A %d/%m/%Y")
  vim.api.nvim_put({ today }, "c", true, true)
end, {})
