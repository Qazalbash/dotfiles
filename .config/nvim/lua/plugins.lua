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
	    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }
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

    -- LazyGit
    use({
	"kdheepak/lazygit.nvim",
    	-- optional for floating window border decoration
    	requires = {"nvim-lua/plenary.nvim",},
    })

	-- File Explorer
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch="v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("configs.neo-tree")
		end,
	})

    -- LSP Support
    use({
        'neovim/nvim-lspconfig',
        requires = {
            -- Mason handles the installation of servers
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require("configs.lsp")
        end
    })

    -- Multi-line
    use({
        'mg979/vim-visual-multi',
        branch = 'master'
    })
end)
