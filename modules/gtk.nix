{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gtk3
    lxappearance
    graphite-gtk-theme
    dconf
  ];

  services.dbus.enable = true;

  environment.variables = {
    GTK_THEME = "Graphite-Dark";
    XCURSOR_SIZE = "16";
  };
}
