-- Set keymaps
vim.g.mapleader = " "

vim.opt.showcmd = true
vim.opt.showcmdloc = "last"

-- Set the behavior of tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c-sm:block-blinkwait175-blinkon175,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.winbar = "%=%m %f"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.g.netrw_liststyle = 3
vim.opt.laststatus = 3

-- True colors
vim.opt.termguicolors = true
vim.opt.winborder = "single"

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
