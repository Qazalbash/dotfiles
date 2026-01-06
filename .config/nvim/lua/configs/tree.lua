local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- 1. DISABLE ALL DEFAULT MAPPINGS
      -- (By not calling api.config.mappings.default_on_attach, they stay empty)

      -- 2. DEFINE YOUR CUSTOM MAPPINGS HERE
      vim.keymap.set('n', '<CR>',  api.node.open.edit,            opts('Open'))
      vim.keymap.set('n', 'o',     api.node.open.edit,            opts('Open'))
      vim.keymap.set('n', 'v',     api.node.open.vertical,        opts('Open: Vertical Split'))
      vim.keymap.set('n', 's',     api.node.open.horizontal,      opts('Open: Horizontal Split'))
      vim.keymap.set('n', 't',     api.node.open.tab,             opts('Open: New Tab'))
      
      -- File Management
      vim.keymap.set('n', 'a',     api.fs.create,                 opts('Create'))
      vim.keymap.set('n', 'd',     api.fs.remove,                 opts('Delete'))
      vim.keymap.set('n', 'r',     api.fs.rename,                 opts('Rename'))
      vim.keymap.set('n', 'y',     api.fs.copy.node,              opts('Copy Name'))
      vim.keymap.set('n', 'x',     api.fs.cut,                    opts('Cut'))
      vim.keymap.set('n', 'p',     api.fs.paste,                  opts('Paste'))

      -- Navigation & UI
      vim.keymap.set('n', 'R',     api.tree.reload,               opts('Refresh'))
      vim.keymap.set('n', 'q',     api.tree.close,                opts('Close'))
      vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter, opts('Toggle Hidden'))
      vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  end

require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort_by = "case_sensitive",
  view = {
    width = 40,
    side = "left",
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false, -- Set to true to hide hidden files (starting with .)
  },
  -- Update root on directory change
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})
