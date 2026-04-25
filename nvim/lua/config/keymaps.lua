local map = vim.keymap.set

-- jj to escape
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- Save with ,w
map("n", "<leader>w", ":w!<CR>", { desc = "Save file" })

-- Clear search highlight
map("n", "<leader><space>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Buffer navigation
map("n", "<leader>.", ":bn<CR>", { desc = "Next buffer" })
map("n", "<leader>,", ":bp<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":b#<bar>bd#<CR>", { desc = "Close buffer keeping split" })

-- Move by visual line
map("n", "j", "gj", { desc = "Move down by visual line" })
map("n", "k", "gk", { desc = "Move up by visual line" })

-- Edit/source config
map("n", "<leader>ev", ":e $MYVIMRC<CR>", { desc = "Edit config" })
map("n", "<leader>sv", ":so $MYVIMRC<CR>", { desc = "Reload config" })

-- Set working directory to current file
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", { desc = "CD to current file dir" })

-- Remove trailing whitespace
map("n", "<leader>wws", [[<cmd>let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>]], { desc = "Remove trailing whitespace" })

-- Move lines with Alt+j/k (macOS sends ∆/˚)
map("n", "∆", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "˚", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "∆", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "˚", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "∆", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "˚", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Force ansible filetype
map("n", "<leader>fa", ":set filetype=ansible<CR>", { desc = "Set filetype to ansible" })

-- Lazygit in a tab
map("n", "<leader>gg", ":tab term lazygit<CR>", { desc = "Open lazygit" })

-- Replace word under cursor (pre-fills cmdline)
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Boxes utility integration
map("v", "<leader>mc", "!boxes -d shell -s 80 -a c<CR>", { desc = "Add box comment" })
map("n", "<leader>mc", "!!boxes -d shell -s 80 -a c<CR>", { desc = "Add box comment" })
map("v", "<leader>xc", "!boxes -d shell -r<CR>", { desc = "Remove box comment" })
map("n", "<leader>xc", "!!boxes -d shell -r<CR>", { desc = "Remove box comment" })

-- Close all hidden buffers
map("n", "<leader>bc", function()
  local visible = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    visible[vim.api.nvim_win_get_buf(win)] = true
  end
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and not visible[buf] and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end, { desc = "Close hidden buffers" })
