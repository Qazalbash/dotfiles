-- initialize nvim with lua code
--
-- :author: Ricky Powell
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")

require("keymaps")

require("autocmd")

require("filetypes")

require("commands")

-- setup with Lazy.nvim
require("lazy").setup(
  "plugins",
  {
    ui = {
      border = "rounded",
    },
  }
)

-- Add the $CWD as a workspace folder to get
-- the vim.lsp.buf.references() amoung all of the repo
vim.lsp.buf.add_workspace_folder(vim.fn.getcwd())

-- settings
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("fluoromachine")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("vague")
-- vim.cmd.colorscheme("evergarden")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("gruvbox")
vim.cmd.colorscheme("vscode")
