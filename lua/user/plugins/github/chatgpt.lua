return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },

    config = function()
        require("chatgpt").setup({
            chat = {
                keymaps = {
                    close = "<C-c>",
                    new_session = "<C-n>",
                    select_session = "<Enter>",
                    rename_session = "r",
                    delete_session = "d",
                }
            }
        }) -- need to set $OPENAI_API_KEY and $OPENAI_API_HOST environment variables
    end
}
