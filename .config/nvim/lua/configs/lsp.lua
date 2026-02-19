require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "cspell_ls",
        "gh_actions_ls",
        "jsonls",
        "lua_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "ty",
        "vimls"
    }
})
