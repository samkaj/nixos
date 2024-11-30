{
	config,
		pkgs,
		lib,
		...
}:
let
mod = "Mod4";
in {
#home.file.".config/i3/config".source = ./config;
	xsession.windowManager.i3 = {
		extraConfig = ''
			default_border pixel 1
			default_floating_border normal
			for_window [class="^.*"] border pixel
			'';
		config = {
			modifier = mod;

			startup = [
				# TODO: handle polybar in nix :)
				{ command = "$HOME/.config/polybar/launch.sh"; }
			];

			gaps = {
				inner = 4;
				outer = 1;
				top = 28;
			};

			fonts = {
				names = ["JetBrainsMono Nerd Font"];
				style = "Regular";
				size = 11.0;
			};

			floating.titlebar = false;

			modes = {
				resize = {
					k = "resize grow height 10 px or 10 ppt";
					Escape = "mode default";
					h = "resize shrink width 10 px or 10 ppt";
					Return = "mode default";
					l = "resize grow width 10 px or 10 ppt";
					j = "resize shrink height 10 px or 10 ppt";
				};
			};

			keybindings = lib.mkOptionDefault {
				"${mod}+d" = "exec dmenu_run";
				"${mod}+Return" = "exec alacritty";
				"${mod}+Shift+q" = "kill";
				"${mod}+r" = "mode resize";

				"${mod}+v" = "split v";
				"${mod}+b" = "split h";
				"${mod}+f" = "fullscreen toggle";
				"${mod}+space" = "floating toggle";

				"${mod}+h" = "focus left";
				"${mod}+j" = "focus down";
				"${mod}+k" = "focus up";
				"${mod}+l" = "focus right";

				"${mod}+Shift+h" = "move left";
				"${mod}+Shift+j" = "move down";
				"${mod}+Shift+k" = "move up";
				"${mod}+Shift+l" = "move right";
			};

			bars = [];
		};
		enable = true;
	};
}
