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
        p.lua
      ]))
    ];
    extraLuaConfig = ''
      -- Colorscheme depends on attribute set, hence hardcoded here
      require('base16-colorscheme').setup({
         base00 = '#${palette.base00}', base01 = '#${palette.base01}', base02 = '#${palette.base02}', base03 = '#${palette.base03}',
         base04 = '#${palette.base04}', base05 = '#${palette.base05}', base06 = '#${palette.base06}', base07 = '#${palette.base07}',
         base08 = '#${palette.base08}', base09 = '#${palette.base09}', base0A = '#${palette.base0A}', base0B = '#${palette.base0B}',
         base0C = '#${palette.base0C}', base0D = '#${palette.base0D}', base0E = '#${palette.base0E}', base0F = '#${palette.base0F}',
      })

      ${builtins.readFile ./opts.lua}
      ${builtins.readFile ./plugins.lua}
      ${builtins.readFile ./keybinds.lua}
      ${builtins.readFile ./lsp.lua}
      ${builtins.readFile ./lualine.lua}
    '';
  };
}
