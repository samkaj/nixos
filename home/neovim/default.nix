{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		
		# Plugins. Each entry should have docs for maintaining sanity
		plugins = [
			pkgs.vimPlugins.nvim-cmp
		];
				
	};
}
