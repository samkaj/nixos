{
  description = "samkaj's nixos config";

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
    {
      nixpkgs,
      home-manager,
      rust-overlay,
      ...
    }:
    {
      nixosConfigurations.moomin = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/moomin/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.samkaj = import ./home/home.nix;
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
