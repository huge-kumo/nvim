return {
    'nvim-treesitter/nvim-treesitter',

    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "go", "html", "css", "typescript", "javascript", "tsx", "python", "markdown", "sql", "json", "toml", "csv"},
            highlight = {
                enable = true,
        },
    })
    vim.cmd[[ TSEnable highlight ]]
  end
}
