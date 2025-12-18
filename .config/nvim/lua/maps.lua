-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d') -- delete motion
vim.keymap.set({'n', 'v'}, '<leader>D', '"+D') -- delete line

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor


-- -- 1. Force reset the variable to ensure it's empty
-- vim.g.VM_maps = {}
--
-- -- 2. Define mappings using explicit square brackets for keys
-- --    Do NOT use 'vim.keymap.set' inside here. Just strings.
-- vim.g.VM_maps['Find Under']         = '<C-n>'
-- vim.g.VM_maps['Find Subword Under'] = '<C-n>'
-- vim.g.VM_maps['Add Cursor Down']    = '<C-M-Down>'
-- vim.g.VM_maps['Add Cursor Up']      = '<C-M-Up>'

