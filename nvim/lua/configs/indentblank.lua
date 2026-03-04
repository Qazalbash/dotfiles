local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "ColorBorrowedFromVSCode", { fg = "#ffd700" })
end)

require("ibl").setup {
    indent = {
        char = "┆", 
        highlight = "ColorBorrowedFromVSCode",
    },
    scope = {
        enabled = true,
    },
}
