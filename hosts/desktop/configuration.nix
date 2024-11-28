# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/i3.nix
      ./hardware-configuration.nix
    ];
  
  networking.hostName  = "moomin";
  users.users.samkaj = {
    isNormalUser = true;
    description = "samkaj";
    extraGroups = ["networkmanager" "wheel"];
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  #services.xserver.videoDrivers = ["nvidia"];
  #hardware.opengl.enable = true;
  #hardware.nvidia = {
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  #  modesetting.enable = true;
  #};
}
