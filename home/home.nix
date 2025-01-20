{ nix-colors, ... }:
{
  imports = [
    ./alacritty
    ./helix
    ./i3
    ./neovim
    ./polybar
    ./gtk
    ./rofi
    ./tmux
    nix-colors.homeManagerModules.default
  ];

  colorScheme = {
    slug = "molt";
    name = "molt";
    author = "samkaj";
    palette = {
      base00 = "#101010";
      base01 = "#232323";
      base02 = "#222222";
      base03 = "#333333";
      base04 = "#999999";
      base05 = "#b7b7b7";
      base06 = "#c1c1c1";
      base07 = "#d5d5d5";
      base08 = "#de6e6e";
      base09 = "#dab083";
      base0A = "#ffc799";
      base0B = "#5f8787";
      base0C = "#60a592";
      base0D = "#8eaaaa";
      base0E = "#d69094";
      base0F = "#876c4f";
    };
  };

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
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      rebuild = "sudo nixos-rebuild switch --impure --flake /home/samkaj/.config/nixos#tool";
    };

    initExtra = ''
      PROMPT="%B%F{blue}[%f%b%B%n%b%B%F{blue}@%f%b%B%m%b%B%F{blue}] %f%b%B%~%b%B%F{magenta} λ %f%b"
    '';
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
