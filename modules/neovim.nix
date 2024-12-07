{ pkgs, lib, ... }:
{
  # Install formatter binaries
  environment.systemPackages = with pkgs; [
    rustfmt
    python3Packages.black
    clang-tools # For clang-format
    nil # Nix language server
    nixfmt-rfc-style # Nix formatter
    prettierd
  ];
}
