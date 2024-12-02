{ pkgs, config, ... }:
{
  # Language servers for Rust, Python, JavaScript, HTML, CSS, TypeScript, C, C++
  programs.neovim = {
    enable = true;
    viAlias = true; # Use `vi` command as an alias for `nvim`
    vimAlias = true; # Use `vim` command as an alias for `nvim`

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig

      # Telescope: Fuzzy finder for Neovim. Helps you search files, buffers, and more.
      telescope-nvim

      # Lualine: Statusline plugin for Neovim written in Lua. Displays modes, file info, etc.
      lualine-nvim

      # nvim-cmp: Completion framework for Neovim with snippet support.
      nvim-cmp

      # Harpoon: File navigation tool for quickly toggling between important files.
      harpoon
    ];
extraConfig = ''
      autocmd FileType rust setlocal formatprg=rustfmt
      autocmd FileType python setlocal formatprg=black
      autocmd FileType javascript,typescript setlocal formatprg=prettier
      autocmd FileType c,cpp setlocal formatprg=clang-format

      lua << EOF
        -- Leader is space
        vim.g.mapleader = " "
        vim.g.maplocalleader = ","

        local lspconfig = require("lspconfig")

        -- Add language server configurations
        lspconfig.rust_analyzer.setup{}
        lspconfig.pyright.setup{}
        lspconfig.tsserver.setup{}
        lspconfig.html.setup{}
        lspconfig.cssls.setup{}
        lspconfig.clangd.setup{}
        lspconfig.nil_ls.setup{}

        require("telescope").setup{}
        require("lualine").setup{}
        require("cmp").setup{}
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
