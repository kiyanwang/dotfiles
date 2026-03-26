return {
  -- Mason: manages external LSP servers, linters, formatters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  -- Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "ts_ls",
        "jsonls",
        "html",
        "cssls",
        "ansiblels",
        "dockerls",
        "docker_compose_language_service",
        "intelephense",
        "lua_ls",
        "yamlls",
        "eslint",
        "bashls",
      },
    },
  },

  -- LSP setup using Neovim 0.11 native API
  -- nvim-lspconfig provides default server configs via lsp/ runtime files
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Default capabilities for all servers (from cmp-nvim-lsp)
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Server-specific settings
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
          },
        },
      })

      -- Nushell LSP (built into the nu binary, not managed by mason)
      vim.lsp.config("nushell", {
        cmd = { "nu", "--lsp" },
        filetypes = { "nu" },
      })

      -- Enable all servers
      vim.lsp.enable({
        "ts_ls",
        "jsonls",
        "html",
        "cssls",
        "ansiblels",
        "dockerls",
        "docker_compose_language_service",
        "intelephense",
        "lua_ls",
        "yamlls",
        "eslint",
        "bashls",
        "nushell",
      })

      -- Keymaps on LSP attach (preserving CoC bindings)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = function(ev)
          local opts = function(desc)
            return { buffer = ev.buf, desc = desc }
          end
          local map = vim.keymap.set

          -- Navigation
          map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts("Go to definition"))
          map("n", "gy", vim.lsp.buf.type_definition, opts("Go to type definition"))
          map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts("Go to implementation"))
          map("n", "gr", "<cmd>Telescope lsp_references<cr>", opts("References"))

          -- Hover and signature
          map("n", "K", vim.lsp.buf.hover, opts("Hover docs"))

          -- Actions
          map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
          map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts("Code action"))
          map("n", "<leader>qf", function()
            vim.lsp.buf.code_action({
              filter = function(a) return a.isPreferred end,
              apply = true,
            })
          end, opts("Quick fix"))

          -- Diagnostics navigation
          map("n", "[d", vim.diagnostic.goto_prev, opts("Previous diagnostic"))
          map("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))

          -- Telescope LSP pickers (space prefix, matching old CoC bindings)
          map("n", "<space>a", "<cmd>Telescope diagnostics<cr>", opts("Diagnostics list"))
          map("n", "<space>o", "<cmd>Telescope lsp_document_symbols<cr>", opts("Document symbols"))
          map("n", "<space>s", "<cmd>Telescope lsp_workspace_symbols<cr>", opts("Workspace symbols"))

          -- Project-wide search for word under cursor
          map("n", "<leader>prw", function()
            require("telescope.builtin").grep_string({ word_match = "-w" })
          end, opts("Search word in project"))

          -- Highlight references on CursorHold
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.supports_method("textDocument/documentHighlight") then
            local hl_group = vim.api.nvim_create_augroup("LspHighlight", { clear = false })
            vim.api.nvim_create_autocmd("CursorHold", {
              group = hl_group,
              buffer = ev.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = hl_group,
              buffer = ev.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Diagnostic signs and display
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
