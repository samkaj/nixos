{ ... }:
{
  imports = [
    ./alacritty
    ./helix
    ./i3
    ./neovim
    ./polybar
  ];

  home = {
    homeDirectory = "/home/samkaj";
    stateVersion = "24.05";
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
