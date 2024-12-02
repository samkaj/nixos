{ config, pkgs, ... }:
{
	imports = [
		./home/i3
		./home/alacritty
		./home/polybar
		./home/helix
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
		helix
	];

	programs.zsh = {
		enable = true;
		shellAliases = {
			ll = "ls -la";
			gs = "git status";
			ga = "git add";
			gc = "git commit";
			gp = "git push";
			".." = "cd ..";
			"..." = "cd ../..";
			rebuild = "sudo nixos-rebuild switch --impure --flake /home/samkaj/.config/nixos#desktop";
		};
		ohMyZsh = {
			enable = true;
		};
	};

	programs.git = {
		enable = true;
		userName = "samkaj";
		userEmail = "kajavasamuel@gmail.com";
	};

	programs.bash.enable = true;
}
