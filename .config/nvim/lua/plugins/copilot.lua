return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  lazy = false,
  enabled = true,
  opts = {
    panel = {
      auto_refresh = true,
      layout = {
        position = "right",
        ratio = 0.3,
      },
    },
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
      },
    },
  },
}
