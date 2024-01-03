return {
    "windwp/nvim-autopairs",

    config = function()
        require("nvim-autopairs").setup({
            map_cr = true, -- without completion plugin
        })
    end
}
