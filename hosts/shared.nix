{ pkgs, lib, ... }:
{
  imports = [
    ../modules/i3.nix
    ../modules/nvim.nix
    ../modules/gtk.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.samkaj = {
    isNormalUser = true;
    description = "samkaj";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  environment.pathsToLink = [ "/libexec" ];
  environment.variables.EDITOR = "nvim";

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.printing.enable = true;

  fonts = {
    packages = with pkgs; [
      material-design-icons
      noto-fonts
      noto-fonts-emoji
      gyre-fonts
      (nerdfonts.override { fonts = [ "GeistMono" ]; })
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [
        "Noto Sans"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Noto Sans"
        "Noto Color Emoji"
      ];
      monospace = [
        "GeistMono Nerd Font"
        "Noto Color Emoji"
      ];
      emoji = [ "Noto Color Emoji" ];
    };

    fontconfig.localConf = ''
      <!-- use a less horrible font substition for pdfs such as https://www.bkent.net/Doc/mdarchiv.pdf -->
      <match target="pattern">
        <test qual="any" name="family"><string>NewCenturySchlbk</string></test>
        <edit name="family" mode="assign" binding="same"><string>TeX Gyre Schola</string></edit>
      </match>
    '';
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    nnn
    firefox
    slack
    alacritty
    bash
    psmisc
    zsh
    clang
    home-manager
    ripgrep
    neofetch
  ];

  programs.zsh.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  networking.networkmanager.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
