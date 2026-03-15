return {
  'stevearc/oil.nvim',

  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },

  config = function()
    require("oil").setup({
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      columns = {
        "icon",
      }
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open file explorer" })
  end
}
