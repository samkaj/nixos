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
    username = "samkaj";
  };

  programs.git = {
    enable = true;
    userName = "samkaj";
    userEmail = "kajavasamuel@gmail.com";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      ".." = "cd ..";
      "..." = "cd ../..";
      rebuild = "sudo nixos-rebuild switch --impure --flake
      /home/samkaj/.config/nixos#moomin";
      hr = "home-manager --flake /home/samkaj/.config/nixos#moomin switch";
    };
    oh-my-zsh = {
      enable = true;
      theme = "gentoo";
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
