{ config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 14;
    };

    settings = {
      window_padding_width = 4;
      
      cursor_shape = "block";
      cursor_shape_unfocused= "hollow";
      shell_integration = "no-cursor";
      enable_audio_bell = false;
      foreground = "#${palette.base05}";
      background = "#${palette.base00}";
      color0 = "#${palette.base00}";
      color1 = "#${palette.base01}";
      color2 = "#${palette.base02}";
      color3 = "#${palette.base03}";
      color4 = "#${palette.base04}";
      color5 = "#${palette.base05}";
      color6 = "#${palette.base06}";
      color7 = "#${palette.base07}";
      color8 = "#${palette.base08}";
      color9 = "#${palette.base09}";
      color10 = "#${palette.base0A}";
      color11 = "#${palette.base0B}";
      color12 = "#${palette.base0C}";
      color13 = "#${palette.base0D}";
      color14 = "#${palette.base0E}";
      color15 = "#${palette.base0F}";
    };
  };
}
