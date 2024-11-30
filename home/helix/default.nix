{
	programs.helix = {
		enable = true;
		languages = {
			language = [{
				name = "rust";
				auto-format = true;
			}];
		};
		settings = {
			editor = {
				line-number = "relative";
				lsp.display-messages = true;
			};

			theme = "mellow";
		};
	};
}
