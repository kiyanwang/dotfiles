return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
    },
    opts = {
      filters = {
        dotfiles = false,
        custom = { ".git" },
      },
      view = {
        width = 30,
      },
      renderer = {
        icons = {
          show = {
            git = true,
            file = true,
            folder = true,
            folder_arrow = true,
          },
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    },
  },
}
