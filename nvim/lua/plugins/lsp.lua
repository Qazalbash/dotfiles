return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "folke/neodev.nvim", opts = {} },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",

      -- vsnip user
      -- "hrsh7th/cmp-vsnip",
      -- "hrsh7th/vim-vsnip",
      -- luasnip users.
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- LSP status
      {
        "j-hui/fidget.nvim",
        opts = {},
      },

      -- custom completion formattings
      -- "onsails/lspkind.nvim",
    },

    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
      require("mason-lspconfig").setup({
        automatic_installation = false,
        ensure_installed = {
          "terraformls",
          "pyright",
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "eslint",
          -- "gopls",
          "html",
          "cssls",
          "jsonls",
          "bashls",
          "clangd",
          "jdtls",
          -- "remark_ls",
          "marksman",
          "mdx_analyzer",
          "terraformls",
          "vimls",
          "yamlls",
          "zls",
        },
        handlers = {
          function(server_name)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config(server_name, {
              capabilities = capabilities,
            })
            vim.lsp.enable(server_name)
          end,

          ["rust_analyzer"] = function(server_name)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config(server_name, {
              capabilities = capabilities,
              settings = {
                ["rust-analyzer"] = {
                  inlayHints = {
                    typeHints = {
                      enable = true,
                    },
                    parameterHints = {
                      enable = true,
                    },
                    chainingHints = {
                      enable = false,
                    },
                  },
                },
              },
            })
            vim.lsp.enable(server_name)
          end,

          ["eslint"] = function(server_name)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config(server_name, {
              capabilities = capabilities,
            })
            vim.lsp.enable(server_name)
          end,

          ["sourcekit"] = function(server_name)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

            vim.lsp.config(server_name, {
              capabilities = capabilities,
              flags = {
                debounce_text_changes = 1000, -- milliseconds
                timeout_ms = 30000,           -- increased from 20s for large iOS projects
              },
            })
            vim.lsp.enable(server_name)
          end,

          ["ts_ls"] = function(server_name)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config(server_name, {
              capabilities = capabilities,
              root_dir = vim.lsp.config.root_pattern({ ".git" }),
              settings = {
                typescript = {
                  inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                  },
                },
              },
            })
            vim.lsp.enable(server_name)
          end,

          ["zls"] = function(server_name)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config(server_name, {
              capabilities = capabilities,
              settings = {
                zls = {
                  enable_build_on_save = true,
                  semantic_tokens = "full",
                  warn_style = true,
                  enable_inlay_hints = true,
                  inlay_hints_show_builtin = true,
                  inlay_hints_exclude_single_argument = true,
                  inlay_hints_hide_redundant_param_names = false,
                  inlay_hints_hide_redundant_param_names_last_token = false,
                },
              },
            })
            vim.lsp.enable(server_name)
          end,

          ["lua_ls"] = function()
            vim.lsp.config("lua_ls", {
              settings = {
                Lua = {
                  diagnostics = {
                    -- Get the lsp to recognize the `vim` global
                    globals = { "vim" },
                  },
                },
              },
            })
            vim.lsp.enable("lua_ls")
          end,
        },
      })

      -- inlay hints
      vim.lsp.inlay_hint.enable(true)

      -- swift lsp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
      vim.lsp.config("sourcekit", {
        capabilities = capabilities,
      })
      vim.lsp.enable("sourcekit")

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '[dzz', vim.diagnostic.goto_prev, { desc = "Diagnostic previous" })
      vim.keymap.set('n', ']dzz', vim.diagnostic.goto_next, { desc = "Diagnostic next" })

      -- float windows with borders
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "single",
        }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = "single",
        }
      )

      -- completions
      local cmp = require("cmp")
      -- local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require("snippy").expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "vsnip" },   -- For vsnip users.
          { name = "luasnip" }, -- For luasnip users.
          { name = "treesitter" },
          -- { name = "ultisnips" }, -- For ultisnips users.
          -- { name = "snippy" }, -- For snippy users.
        }, {
          { name = "buffer" },
        }),
        formatting = {
          fields = { "abbr", "kind", "menu" },
          expandable_indicator = true,
          format = function(entry, vim_item)
            local kind_icons = {
              Text = "",
              Method = "󰆧",
              Function = "󰊕",
              Constructor = "",
              Field = "󰇽",
              Variable = "󰂡",
              Class = "󰠱",
              Interface = "",
              Module = "",
              Property = "󰜢",
              Unit = "",
              Value = "󰎠",
              Enum = "",
              Keyword = "󰌋",
              Snippet = "",
              Color = "󰏘",
              File = "󰈙",
              Reference = "",
              Folder = "󰉋",
              EnumMember = "",
              Constant = "󰏿",
              Struct = "",
              Event = "",
              Operator = "󰆕",
              TypeParameter = "󰅲",
            }

            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            vim_item.menu = ({
              buffer = "[Buffer]",
              -- nvim_lsp = "🍦",
              -- nvim_lsp = "[LSP]",
              nvim_lsp = "☁️ ",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[LaTeX]",
              treesitter = "🌲",
            })[entry.source.name]
            return vim_item
          end
        },
      })

      -- Diagnostics
      vim.diagnostic.config({
        update_on_insert = true,
        float = { border = "single" },
        focus = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
