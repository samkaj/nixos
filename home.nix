{config, pkgs, ... }:
{
	home.username = "samkaj";
	home.homeDirectory = "/home/samkaj";

	home.packages = with pkgs; [
		neofetch
		zip
		xz
		unzip
		ripgrep
		jq
		file
		which 
		tree
		i3
	];

	programs.git = {
		enable = true;
		userName = "samkaj";
		userEmail = "kajavasamuel@gmail.com";
	};

	programs.home-manager.enable = true;
	home.stateVersion = "24.05";
}
