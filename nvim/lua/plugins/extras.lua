return {
  -- Table mode (keep as-is)
  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
  },

  -- Logstash syntax (keep as-is)
  {
    "robbles/logstash.vim",
    ft = "logstash",
  },

  -- Silicon (code screenshots, keep as-is)
  {
    "segeljakt/vim-silicon",
    cmd = "Silicon",
    init = function()
      vim.g.silicon = {
        theme = "Dracula",
        font = "Hack",
        background = "#AAAAFF",
        ["shadow-color"] = "#555555",
        ["line-pad"] = 2,
        ["pad-horiz"] = 80,
        ["pad-vert"] = 100,
        ["shadow-blur-radius"] = 0,
        ["shadow-offset-x"] = 0,
        ["shadow-offset-y"] = 0,
        ["line-number"] = true,
        ["round-corner"] = true,
        ["window-controls"] = true,
        output = "~/Downloads/code_screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png",
      }
    end,
  },

  -- Neogen (replaces vim-doge for doc generation)
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      { "<leader>dg", "<cmd>Neogen<cr>", desc = "Generate docs" },
    },
    opts = {
      snippet_engine = "luasnip",
    },
  },
}
