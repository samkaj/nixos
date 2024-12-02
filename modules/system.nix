{
	pkgs,
		lib,
		...
}: {

	nix.settings.experimental-features = ["nix-command" "flakes"];

	users.users.samkaj = {
		isNormalUser = true;
		description = "samkaj";
		extraGroups = ["networkmanager" "wheel"];
		shell = pkgs.zsh;
	};

	environment.pathsToLink = [ "/libexec" ];
	environment.variables.EDITOR = "nvim";

	nix.gc = {
		automatic = lib.mkDefault true;
		dates = lib.mkDefault "weekly";
		options = lib.mkDefault "--delete-older-than 7d";
	};

	nixpkgs.config.allowUnfree = true;

	time.timeZone = "Europe/Stockholm";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "sv_SE.UTF-8";
		LC_IDENTIFICATION = "sv_SE.UTF-8";
		LC_MEASUREMENT = "sv_SE.UTF-8";
		LC_MONETARY = "sv_SE.UTF-8";
		LC_NAME = "sv_SE.UTF-8";
		LC_NUMERIC = "sv_SE.UTF-8";
		LC_PAPER = "sv_SE.UTF-8";
		LC_TELEPHONE = "sv_SE.UTF-8";
		LC_TIME = "sv_SE.UTF-8";
	};

	services.printing.enable = true;

	fonts = {
		packages = with pkgs; [
			material-design-icons
				noto-fonts
				noto-fonts-emoji
				(nerdfonts.override {fonts = ["JetBrainsMono"];})
		];

		enableDefaultPackages = false;

		fontconfig.defaultFonts = {
			serif = ["Noto Sans" "Noto Color Emoji"];
			sansSerif = ["Noto Sans" "Noto Color Emoji"];
			monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
			emoji = ["Noto Color Emoji"];
		};
	};

	environment.systemPackages = with pkgs; [
		neovim
			wget
			curl
			git
			nnn
			firefox
			slack
			alacritty
			bash
			psmisc
			zsh
			clang
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
	};

	sound.enable = true;
	hardware.pulseaudio.enable = false;

	services = {
		pipewire = {
			enable = true;
			alsa.enable = true;
			pulse.enable = true;
			alsa.support32Bit = true;
		};
	};

	networking.networkmanager.enable = true;

	system.stateVersion = "24.05"; # Did you read the comment?
}
