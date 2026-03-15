return {
  -- Recommended for `ask()` and `select()` in opencode
  -- Required for `snacks` provider.
  ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      input = {},
      picker = {},
      terminal = {},
    }
  },
}
