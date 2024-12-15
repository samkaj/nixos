{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gtk3
    lxappearance
    rose-pine-gtk-theme
    rose-pine-icon-theme
    rose-pine-cursor
    dconf
  ];

  services.dbus.enable = true;

  environment.variables = {
    GTK_THEME = "rose-pine-moon";
  };
}
