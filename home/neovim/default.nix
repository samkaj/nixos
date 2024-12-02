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
      " LSP configuration
      lua << EOF
        local lspconfig = require('lspconfig')

        -- Add language server configurations
        lspconfig.rust_analyzer.setup{}
        lspconfig.pyright.setup{}
        lspconfig.tsserver.setup{}
        lspconfig.html.setup{}
        lspconfig.cssls.setup{}
        lspconfig.clangd.setup{}
        lspconfig.nil_ls.setup{}
      EOF

      " Formatter configuration (requires external formatter binaries to be installed)
      autocmd FileType rust setlocal formatprg=rustfmt
      autocmd FileType python setlocal formatprg=black
      autocmd FileType javascript,typescript setlocal formatprg=prettier
      autocmd FileType c,cpp setlocal formatprg=clang-format

      " Additional plugin configurations (e.g., telescope)
      lua << EOF
        require('telescope').setup{}
        require('lualine').setup{}
        require('cmp').setup{}
        require('harpoon').setup{}
      EOF
    '';
  };
}

