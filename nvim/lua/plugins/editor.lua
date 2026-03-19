return {
  -- Surround (same ys/ds/cs bindings as vim-surround)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Comment toggle (gcc / gc{motion})
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Auto pairs (replaces delimitMate)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Flash (replaces easymotion)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- Tmux-aware Ctrl+h/j/k/l navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Abolish (keep as-is)
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },

  -- Open file:line (keep as-is)
  {
    "bogado/file-line",
    lazy = false,
  },
}
