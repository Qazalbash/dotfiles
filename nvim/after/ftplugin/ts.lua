vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2


-- Add the $CWD as a workspace folder to get
-- the vim.lsp.buf.references() amoung all of the repo
vim.lsp.buf.add_workspace_folder(vim.fn.getcwd())
