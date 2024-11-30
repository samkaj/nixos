{ config, pkgs, ... }:
{
	imports = [
		./home/i3
		./home/alacritty
	];

	programs.home-manager.enable = true;
	home.stateVersion = "24.05";
	
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

	programs.bash.enable = true;
}
