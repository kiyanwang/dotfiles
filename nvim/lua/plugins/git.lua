return {
  -- Fugitive (keep as-is)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gvdiffsplit", "GBrowse" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
      { "<leader>gb", "<cmd>GBrowse<cr>", desc = "Git browse" },
      { "<leader>gpu", "<cmd>Git push<cr>", desc = "Git push" },
    },
    dependencies = {
      "tpope/vim-rhubarb", -- GBrowse support for GitHub
    },
  },

  -- Gitsigns (replaces vim-gitgutter)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = vim.keymap.set
        local opts = function(desc)
          return { buffer = bufnr, desc = desc }
        end

        -- Hunk navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.nav_hunk("next") end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Next hunk" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.nav_hunk("prev") end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Previous hunk" })

        -- Hunk actions
        map("n", "<leader>hs", gs.stage_hunk, opts("Stage hunk"))
        map("n", "<leader>hr", gs.reset_hunk, opts("Reset hunk"))
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, opts("Stage hunk"))
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, opts("Reset hunk"))
        map("n", "<leader>hu", gs.undo_stage_hunk, opts("Undo stage hunk"))
        map("n", "<leader>hp", gs.preview_hunk, opts("Preview hunk"))
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, opts("Blame line"))
      end,
    },
  },
}
