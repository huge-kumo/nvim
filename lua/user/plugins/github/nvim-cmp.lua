return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",

    dependencies = {
        {
            'L3MON4D3/LuaSnip', -- snippet engine
            dependencies = "rafamadriz/friendly-snippets", -- useful snippets
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        },

        'onsails/lspkind.nvim',
        'lukas-reineke/cmp-under-comparator',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
    },

    config = function()
        local cmp = require("cmp")
        local lspkind= require("lspkind")
        local luasnip = require("luasnip")

        vim.opt.completeopt = "menu,menuone,noselect"
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<c-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<c-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<c-b>"] = cmp.mapping.scroll_docs(-4),
                ["<c-f>"] = cmp.mapping.scroll_docs(4),
                ["<c-l>"] = cmp.mapping.complete(), -- show complete suggesstions
                ["<c-e>"] = cmp.mapping.abort(), -- close complete window
                ["<cr>"] = cmp.mapping.confirm({select = true}), -- accept currently selected item.
            }),

            formatting = {
                format = lspkind.cmp_format({
                  maxwidth = 50,
                  ellipsis_char = "...",
                }),
            },

            sorting = {
                comparators = {
                    require 'cmp-under-comparator'.under,
                }
            },

            snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end
            },

            sources = cmp.config.sources({
                {name = 'path'},
                {name = 'nvim_lsp'},
            }),
        })
    end
}
