vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- VSCode theme
    use("Mofiqul/vscode.nvim")

    -- Lualine
    use({
	    "nvim-lualine/lualine.nvim",
	    event = "BufEnter",
	    config = function()
		    require("configs.lualine")
	    end,
	    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("configs.treesitter")
        end,
    })

end)
