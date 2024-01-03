return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-tree/nvim-web-devicons' },
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        
        telescope.load_extension("fzf")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                    },
                },
            },
        })

        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Fuzzy find files in cwd"})
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {desc = "Find string in cwd"})
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {desc = "Fuzzy find recent files"})
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {desc = "Find string under cursor in cwd"})
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc = "Fuzzy find buffers"})

    end

}
