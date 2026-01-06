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

    use({
        'nvim-telescope/telescope.nvim', tag = '*',
        requires = { 
            { 'nvim-lua/plenary.nvim'},
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
        config = function()
            require("configs.telescope")
        end,
    })

    -- File Explorer
    use({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function ()
            require("configs.tree")
        end
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

    -- Autocompletion
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            {'hrsh7th/cmp-nvim-lsp'},     -- LSP source for nvim-cmp
            {'L3MON4D3/LuaSnip'},         -- Snippet engine
            {'saadparwaiz1/cmp_luasnip'}, -- Snippet expansion
            {'hrsh7th/cmp-buffer'},       -- Text in current buffer
            {'hrsh7th/cmp-path'},         -- File system paths
        },
        config = function()
            require("configs.autocomplete")
        end,
    })

    -- Multi-line
    use({
        'mg979/vim-visual-multi',
        branch = 'master'
    })

end)
