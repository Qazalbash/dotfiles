-- Keymaps
--
-- author: Ricky Powell
--

-- File explorer keymaps

vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open file explorer" })

-- Session with persistence plugin
-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]],
  { desc = "Restore session from current directory" })

-- restore the last session
vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]],
  { desc = "Restore session last" })

-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]],
  { desc = "Stop Persistence; won't save on exit" })

-- Move cursor to other windows
vim.keymap.set("n", "<leader>j", "<C-w>j<cr>", { desc = "Move cursor to window below" })
vim.keymap.set("n", "<leader>k", "<C-w>k<cr>", { desc = "Move cursor to window above" })
vim.keymap.set("n", "<leader>h", "<C-w>h<cr>", { desc = "Move cursor to window left" })
vim.keymap.set("n", "<leader>l", "<C-w>l<cr>", { desc = "Move cursor to window right" })

-- Window resizing
local INT_RESIZE = 2
vim.keymap.set("n", "<C-k>", "<cmd>resize -" .. INT_RESIZE .. "<cr>", { desc = "Decrease current window height" })
vim.keymap.set("n", "<C-j>", "<cmd>resize +" .. INT_RESIZE .. "<cr>", { desc = "Increase current window height" })
vim.keymap.set("n", "<C-h>", "<cmd>vertical resize +" .. INT_RESIZE .. "<cr>", { desc = "Increase current window width" })
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize -" .. INT_RESIZE .. "<cr>",
  { desc = "Decrease current window width" })

-- Scrolling
-- while scrolling up/down, keep the current highlighted line centered horizontally
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Cycle through highlighted text
-- after searching with / or ? or * or #, pressing n and N will also center horizontally
vim.keymap.set("n", "n", "nzz", { desc = "next item in search" })
vim.keymap.set("n", "N", "Nzz", { desc = "prev item in search" })
-- when pressing * or #, center the next word horizontally
vim.keymap.set("n", "*", "*zz", { desc = "highlight forward next word" })
vim.keymap.set("n", "#", "#zz", { desc = "highlight backward next word" })

-- Git
-- lookup git history for current file in buffer in a quickfix list with a Fugitive command
-- use commands ":cn" (next) and ":cp" (previous) to navigate the list
vim.keymap.set("n", "<leader>Gh", "<cmd>0Gclog<cr>", { desc = "Git history for current file" })

-- LSP
vim.keymap.set("n", "<leader>th", "<cmd>ToggleInlayHints<cr>", { desc = "Toggle Inlay Hints" })
vim.keymap.set("n", "<leader>cd", function()
  vim.diagnostic.open_float({
    scope = "cursor",
    border = "single",
    focusable = true,
  })
end, { desc = "Show diagnostic in float" })

-- WhichKey
local which_key_enabled
vim.keymap.set("n", "<leader>tw", function()
  local lazy = require("lazy")
  if not which_key_enabled then
    lazy.disable("which-key.nvim")
    which_key_enabled = false
  else
    lazy.enable("which-key.nvim")
    which_key_enabled = true
  end
end, { desc = "Toggle WhichKey" })
