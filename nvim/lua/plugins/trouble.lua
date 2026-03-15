return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    -- Lua
    local t = require("trouble")
    t.setup()

    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })
    vim.keymap.set("n", "<leader>xw", "<cmd><cr>", { desc = "Toggle workspace Trouble" })
    vim.keymap.set("n", "<leader>xd", "<cmd><cr>", { desc = "Toggle document Trouble" })
    vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Toggle quickfix Trouble" })
    vim.keymap.set("n", "<leader>xl", "<cmd><cr>", { desc = "Toggle loclist Trouble" })
    vim.keymap.set("n", "gR", "<cmd><cr>", { desc = "Toggle lsp refs Trouble" })
  end
}
