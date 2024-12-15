{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "rose-pine-moon";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "oomox-rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    cursorTheme = {
      name = "rose-pine-cursor";
      size = 12;
    };
  };
}
