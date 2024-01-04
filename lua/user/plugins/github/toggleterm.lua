return {
    "akinsho/toggleterm.nvim",
    version = "*",
  
    config = function ()
        require("toggleterm").setup({})
        local keymap = vim.keymap
        keymap.set("n", "<leader>h", "<cmd>ToggleTerm direction=horizontal size=20% <cr>", {desc = "Toggle Terminal"})
    end
}
