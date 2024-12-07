{ pkgs, lib, ... }:
let
  mod = "Mod4";
in
{
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    displayManager.lightdm.enable = true;
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        feh
        picom
        dmenu
        polybar
      ];
    };

    xkb.layout = "us,se";
    xkb.options = "grp:ctrl_space_toggle";
  };
}
