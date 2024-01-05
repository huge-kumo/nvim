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


        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", {desc = "show lsp definition"})
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", {desc = "show definition, references"})
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", {desc = "show lsp implementation"})
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", {desc = "show lsp type definition"})
        keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<cr>", {desc = "show document symbols"})
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", {desc = "show diagnostics for file"})
    end

}
