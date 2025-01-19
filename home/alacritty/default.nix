{ config, ... }:
let
  palette = config.colorScheme.palette;
in
{

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.alacritty = {
    enable = true;

    settings = {
      general.live_config_reload = true;

      env.TERM = "xterm-256color";

      window = {
        padding = {
          x = 6;
          y = 6;
        };
        dynamic_padding = true;
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 10;
        offset = {
          x = -1;
          y = -1;
        };
      };

      colors = {
        primary = {
          foreground = "#${palette.base05}";
          background = "#${palette.base00}";
        };

        cursor = {
          text = "#${palette.base00}";
          cursor = "#${palette.base05}";
        };

        normal = {
          black = "#${palette.base01}";
          red = "#${palette.base08}";
          green = "#${palette.base0B}";
          yellow = "#${palette.base0A}";
          blue = "#${palette.base0D}";
          magenta = "#${palette.base0E}";
          cyan = "#${palette.base0C}";
          white = "#${palette.base05}";
        };

        bright = {
          black = "#${palette.base01}";
          red = "#${palette.base08}";
          green = "#${palette.base0B}";
          yellow = "#${palette.base0A}";
          blue = "#${palette.base0D}";
          magenta = "#${palette.base0E}";
          cyan = "#${palette.base0C}";
          white = "#${palette.base05}";
        };
      };
    };
  };
}
