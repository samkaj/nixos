-- Set formatters
vim.cmd [[autocmd FileType rust setlocal formatprg=rustfmt]]
vim.cmd [[autocmd FileType nil setlocal formatprg=nixfmt]]
vim.cmd [[autocmd FileType python setlocal formatprg=black]]
vim.cmd [[autocmd FileType javascript,typescript,markdown setlocal formatprg=prettier]]
vim.cmd [[autocmd FileType c,cpp setlocal formatprg=clang-format]]
vim.cmd [[autocmd FileType lua setlocal formatprg=lua-format]]

require("cmp").setup(
    {
        snippet = {
            expand = function(args)
                vim.snippet.expand(args.body)
            end,
        },
        mapping = {
            ['<C-p>'] = require("cmp").mapping.select_prev_item(),
            ['<C-n>'] = require("cmp").mapping.select_next_item(),
            ['<C-d>'] = require("cmp").mapping.scroll_docs(-4),
            ['<C-f>'] = require("cmp").mapping.scroll_docs(4),
            ['<C-Space>'] = require("cmp").mapping.complete(),
            ['<C-e>'] = require("cmp").mapping.close(),
            ['<CR>'] = require("cmp").mapping.confirm({
                behavior = require("cmp").ConfirmBehavior.Insert,
                select = true,
            }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            { name = "treesitter" },
        },
    }
)

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

-- Add language server configurations
lspconfig.pyright.setup {
    capabilities = capabilities,
}
lspconfig.lua_ls.setup {
    capabilities = capabilities,
}
lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.cssls.setup {
    capabilities = capabilities,
}
lspconfig.clangd.setup {
    capabilities = capabilities,
}
lspconfig.hls.setup {
    capabilities = capabilities,
}

lspconfig.nil_ls.setup {
    capabilities = capabilities,
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
}
