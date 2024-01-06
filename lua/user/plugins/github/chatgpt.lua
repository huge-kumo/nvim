return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },

    config = function()
        require("chatgpt").setup() -- need to set $OPENAI_API_KEY and $OPENAI_API_HOST environment variables
    end
}
