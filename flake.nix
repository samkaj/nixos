{
  description = "samkaj's nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = inputs @ { self, nixpkgs, ... }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
	    ./hosts/desktop/configuration.nix
          ];
        };
      };
      # More if needed, e.g., laptop
    };
}
