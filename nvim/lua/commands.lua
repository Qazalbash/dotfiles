vim.api.nvim_create_user_command(
  'ToggleInlayHints',
  function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end,
  {}
)
