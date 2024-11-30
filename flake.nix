{
  description = "samkaj's nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
	url = "github:nix-community/home-manager/release-24.05";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
	    ./hosts/desktop/configuration.nix
		home-manager.nixosModules.home-manager {
		    home-manager.useGlobalPkgs = true;
		    home-manager.useUserPackages = true;
		    home-manager.users.samkaj = import ./home.nix;
		}
          ];
        };
      };
      # More if needed, e.g., laptop
    };
}
