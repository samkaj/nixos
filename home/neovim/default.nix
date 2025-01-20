{ pkgs, config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  # Language servers for Rust, Python, JavaScript, HTML, CSS, TypeScript, C, C++
  programs.neovim = {
    enable = true;
    viAlias = true; # Use `vi` command as an alias for `nvim`
    vimAlias = true; # Use `vim` command as an alias for `nvim`

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-nvim-lsp
      nvim-cmp
      cmp-cmdline

      # Telescope: Fuzzy finder for Neovim. Helps you search files, buffers, and more.
      telescope-nvim

      # Lualine: Statusline plugin for Neovim written in Lua. Displays modes, file info, etc.
      lualine-nvim

      # nvim-cmp: Completion framework for Neovim with snippet support.
      nvim-cmp

      # Harpoon: File navigation tool for quickly toggling between important files.
      harpoon

      # Colors
      base16-nvim

      rustaceanvim

      tmux-nvim

      (nvim-treesitter.withPlugins (p: [
        p.c
        p.rust
        p.nix
        p.python
        p.typescript
      ]))
    ];
    extraConfig = ''
      autocmd FileType rust setlocal formatprg=rustfmt
      autocmd FileType nil setlocal formatprg=nixfmt
      autocmd FileType python setlocal formatprg=black
      autocmd FileType javascript,typescript,markdown setlocal formatprg=prettier
      autocmd FileType c,cpp setlocal formatprg=clang-format
      set noshowmode

      lua << EOF
        vim.opt.termguicolors = true
        vim.cmd("let g:netrw_banner = 0")

        -- Leader is space
        vim.g.mapleader = " "
        vim.g.maplocalleader = ","

        -- Leader y yanks to system clipboard
        vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true })

        local keymap = vim.api.nvim_set_keymap
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

        local lspconfig = require("lspconfig")
        
        vim.opt.background = "dark"
        vim.cmd("colorscheme base16-rose-pine")
        require('base16-colorscheme').setup({
           base00 = '#${palette.base00}', base01 = '#${palette.base01}', base02 = '#${palette.base02}', base03 = '#${palette.base03}',
           base04 = '#${palette.base04}', base05 = '#${palette.base05}', base06 = '#${palette.base06}', base07 = '#${palette.base07}',
           base08 = '#${palette.base08}', base09 = '#${palette.base09}', base0A = '#${palette.base0A}', base0B = '#${palette.base0B}',
           base0C = '#${palette.base0C}', base0D = '#${palette.base0D}', base0E = '#${palette.base0E}', base0F = '#${palette.base0F}',
        })

        require("tmux").setup()

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

        local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

        -- Add language server configurations
        lspconfig.pyright.setup{
            capabilities = capabilities, 
        }
        lspconfig.html.setup{
            capabilities = capabilities,
        }
        lspconfig.cssls.setup{
            capabilities = capabilities,
        }
        lspconfig.clangd.setup{
            capabilities = capabilities,
        }
        lspconfig.nil_ls.setup{
            capabilities = capabilities,
            settings = {
                ['nil'] = {
                    formatting = {
                       command = { "nixfmt" },
                    },
                },
            },
        }

        require("telescope").setup{}


        require("lualine").setup{
            options = {
                theme = "auto",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                icons_enabled = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { { 'mode', fmt = function(res) return res:sub(1,1) end } },
            },
        }
        require("harpoon").setup{}

        -- :Wq, Xa, etc. remaps
        vim.cmd("command! Wq wq")
        vim.cmd("command! W w")
        vim.cmd("command! Q q")
        vim.cmd("command! X x")
        vim.cmd("command! Xa xa")

        -- Open file explorer
        vim.api.nvim_set_keymap("n", "<leader>fe", ":Ex<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>fr", ":vspl<CR><Esc>:Ex<CR>", { noremap = true })

        -- Highlight on yank
        vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

        -- Harpoon
        vim.keymap.set("n", "<leader>hh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { silent = true })
        vim.keymap.set("n", "<leader>hc", ':lua require("harpoon.mark").add_file()<CR>', { silent = true })

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

        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.expandtab = true

        -- Line numbers
        vim.opt.number = true
        vim.opt.relativenumber = true

        -- Yank into system clipboard
        vim.opt.clipboard = "unnamedplus"

        -- Wrap at 80 cols
        vim.cmd([[ autocmd FileType * set textwidth=80 ]])


        -- Format
        vim.keymap.set("n", "<leader>p", function()
          vim.lsp.buf.format({ async = true })
        end, { noremap = true, silent = true, desc = "Format document" })
      EOF
    '';
  };
}
