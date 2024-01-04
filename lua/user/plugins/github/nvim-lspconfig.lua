return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap
        local opts = { noremap = true, silent = true}

        local on_attach = function(client, bufnr)
          opts.buffer = bufnr
          opts.desc = "Show LSP declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- show lsp declaration
          opts.desc = "See available code actions"
          keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts) -- show available code actions
          opts.desc = "Show documentation for what is under the cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- restart lsp
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"},
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {'gopls'},
            filetypes = {"go", "gomod", "gowork", "gotmpl"},
            root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                staticcheck = true,
                gofumpt = true,
                },
            },
        })
    end
}
