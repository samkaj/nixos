{ ... }:
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
