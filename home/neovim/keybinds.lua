-- :Wq, Xa, etc. remaps
vim.cmd("command! Wq wq")
vim.cmd("command! Wa wa")
vim.cmd("command! W w")
vim.cmd("command! Q q")
vim.cmd("command! X x")
vim.cmd("command! Xa xa")

-- Open file explorer
vim.keymap.set("n", "<leader>fe", ":Ex<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fr", ":vspl<CR><Esc>:Ex<CR>", { noremap = true })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fc", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
end, { noremap = true, silent = true })


-- Format
vim.keymap.set("n", "<leader>p", function()
    vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format document" })


-- Leader y yanks to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-h>', '<C-w>h', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-j>', '<C-w>j', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-k>', '<C-w>k', opts)
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-l>', '<C-w>l', opts)
    end
})
