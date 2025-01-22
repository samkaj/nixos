{ pkgs, ... }:
{
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    displayManager.lightdm.enable = true;
    enable = true;
    windowManager.i3 = {
      enable = true;
      # packages which are only started through i3
      extraPackages = with pkgs; [
        rofi
        rofi-power-menu
        feh
        picom
        dmenu
      ];
    };

    xkb.layout = "us,se";
    xkb.options = "grp:shift_space_toggle";
  };
}
