{
  description = "samkaj's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      rust-overlay,
      nix-colors,
      ...
    }:
    {
      nixosConfigurations.tool = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit nix-colors; };
        modules = [
          ./hosts/tool/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "hm.bak";
            home-manager.useUserPackages = true;
            home-manager.users.samkaj = import ./home/home.nix;
            home-manager.extraSpecialArgs = { inherit nix-colors; };
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
