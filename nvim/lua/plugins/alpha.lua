return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- ASCII banner from startify config
      dashboard.section.header.val = {
        [[ ██████╗ ██╗  ██╗██╗██╗   ██╗ █████╗ ███╗   ██╗██╗    ██╗ █████╗ ███╗   ██╗ ██████╗ ]],
        [[██╔═══██╗██║ ██╔╝██║╚██╗ ██╔╝██╔══██╗████╗  ██║██║    ██║██╔══██╗████╗  ██║██╔════╝ ]],
        [[██║██╗██║█████╔╝ ██║ ╚████╔╝ ███████║██╔██╗ ██║██║ █╗ ██║███████║██╔██╗ ██║██║  ███╗]],
        [[██║██║██║██╔═██╗ ██║  ╚██╔╝  ██╔══██║██║╚██╗██║██║███╗██║██╔══██║██║╚██╗██║██║   ██║]],
        [[╚█║████╔╝██║  ██╗██║   ██║   ██║  ██║██║ ╚████║╚███╔███╔╝██║  ██║██║ ╚████║╚██████╔╝]],
        [[ ╚╝╚═══╝ ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ]],
      }

      -- Menu buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
        dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("n", "  File tree", "<cmd>NvimTreeToggle<cr>"),
        dashboard.button("c", "  Config", "<cmd>e $MYVIMRC<cr>"),
        dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
      }

      -- Footer
      dashboard.section.footer.val = function()
        local stats = require("lazy").stats()
        return "  " .. stats.loaded .. "/" .. stats.count .. " plugins loaded"
      end

      -- Layout spacing
      dashboard.config.layout = {
        { type = "padding", val = 4 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      -- Catppuccin colours for the header
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      alpha.setup(dashboard.config)
    end,
  },
}
