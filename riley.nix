{ pkgs, ... }:
{
	home.username = "riley";
	home.homeDirectory = "/home/riley";
	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		ungoogled-chromium
		btop
		ghostty
		fooyin
	];

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		plugins = with pkgs.vimPlugins; [
			nvim-lspconfig
			nvim-treesitter.withAllGrammars
			plenary-nvim
			gruvbox-material
			mini-nvim
			telescope-nvim
		];
	};

	programs.git = {
		userEmail = "138817584+cherrythecool@users.noreply.github.com";
		userName = "cherrythecool";
	};
}
