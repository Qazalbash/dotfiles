return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
      },
      transparent_mode = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        keywords = { italic = false },
        comments = { italic = false },
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        transparent = true,
        styles = {
          italic = false,
        }
      })
    end,
  },
  {
    "maxmx03/fluoromachine.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")

      fm.setup {
        glow = true,
        theme = "retrowave",
        transparent = true,
      }

      -- vim.cmd.colorscheme("fluoromachin")
    end
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    opts = {
      commentStyle = { italic = false },
      theme = "dragon",
      transparent = true,
    },
  },
  {
    "vague-theme/vague.nvim",
    enabled = false,
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
        italic = false,
        transparent = true,
      })
      -- vim.cmd("colorscheme vague")
    end
  },
  {
    'everviolet/nvim',
    name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'blue',
      },
      editor = {
        transparent_background = true,
      },
      style = {
        -- no italics
        types = {},
        keyword = {},
        comment = {},
      },
    }
  },
  {
    "catppuccin/nvim",
    enabled = true,
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,

      no_italic = true,

      integrations = {
        treesitter = true,
      },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    enabled = true,
    name = "vscode",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,

      no_italic = true,

      integrations = {
        treesitter = true,
      },
    },
  }
}
