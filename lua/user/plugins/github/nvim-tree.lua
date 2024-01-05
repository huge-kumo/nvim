return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  config = function()

    local nvimtree = require("nvim-tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    -- set NvimTree IndentMarker highlight
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    nvimtree.setup({
        sort = {
            sorter = "name",
            folders_first = true,
            files_first = false,
        },
        view = {
            side = "left",

        },
      git = {
        enable = false,
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>") -- toggle the explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>") -- find the file in explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>") -- refresh the explorer
  end
}
