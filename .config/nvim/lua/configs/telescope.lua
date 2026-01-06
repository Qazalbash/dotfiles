local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    -- Better UI defaults
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next,     -- move to next result
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

-- Load the fzf extension
telescope.load_extension('fzf')
