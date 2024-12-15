{ pkgs, ... }:
let
  colors = {
    bg = "#191724";
    fg = "#e0def4";
    fg_alt = "#908caa";
    bg_alt = "#1f1d2e";
    warn = "#f6c177";
    error = "#eb6f92";
    hint = "#c4a7e7";
    accent = "#403d52";
    sep = "#524f67";
  };
in
{
  programs.rofi = {
    enable = true;
    extraConfig = ''
      configuration {
        font: "GeistMono Nerd Font 12";
        show-icons: false;
        
        /* Colors */
        background: ${colors.bg};
        foreground: ${colors.fg};
        selected-background: ${colors.bg_alt};
        selected-foreground: ${colors.fg};
        alternate-row-color: true;
        alternate-background: ${colors.accent};
        
        /* Window settings */
        location: 0;
        anchor: 0;
        width: 50%;
        lines: 10;
        fixed-height: true;
        padding: 10;
        
        /* Element positions */
        sidebar-mode: false;
        show-match: true;
      }
    '';
  };
}
