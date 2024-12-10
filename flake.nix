{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      rust-overlay,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/desktop/configuration.nix

          # Enable Home Manager as a NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.samkaj = import ./home.nix;
          }

          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];
              environment.systemPackages = [
                pkgs.rust-bin.stable.latest.default
                pkgs.rust-analyzer
              ];
            }
          )
        ];
      };
    };
}
