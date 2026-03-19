return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "hunks" },
        { "<leader>b", group = "buffer" },
        { "<leader>w", group = "save" },
        { "<leader>e", group = "config" },
        { "<leader>q", group = "quickfix" },
        { "<leader>p", group = "project" },
        { "<leader>r", group = "replace" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer keymaps (which-key)",
      },
    },
  },
}
