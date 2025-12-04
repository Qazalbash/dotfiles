require("neo-tree").setup({
  default_source = "filesystem",
  
  window = {
    position = "right",
    width = 40,
  },

  source_selector = {
    winbar = false, 
    statusline = false,
  },

  filesystem = {
    -- This tells Neo-tree to take over when running `nvim .`
    hijack_netrw_behavior = "open_current", 
    
    filtered_items = {
      visible = false, 
      hide_dotfiles = true,
      hide_gitignored = false,
      hide_by_name = { ".git" },
    },
    follow_current_file = {
      enabled = true, 
    },
  },
})
