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
  };
}
