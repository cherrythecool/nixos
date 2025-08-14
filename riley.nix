{ pkgs, ... }:
{
	home.username = "riley";
	home.homeDirectory = "/home/riley";
	home.stateVersion = "25.05";

	home.packages = with pkgs; [
        # Regular apps n shit
		ungoogled-chromium
		btop
		ghostty
		fooyin
        mpv

        # Dev tooling
        clang
        clang-tools
        gnumake

        zig
        zls

        # Games
        steam
        wineWowPackages.stagingFull
	];

    programs.fish.enable = true;

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
			gruvbox-nvim
			telescope-nvim
            coq_nvim
            coq-artifacts
            coq-thirdparty
		];

		extraLuaConfig = ''
			vim.o.tabstop = 4
			vim.o.shiftwidth = 4
			vim.o.expandtab = true
			
			vim.o.termguicolors = true
			vim.o.number = true
			vim.o.relativenumber = true
			
			vim.o.cursorline = true
			vim.o.cursorlineopt = "number"
			
			vim.o.clipboard = "unnamedplus"
			
			vim.lsp.enable("zls")
			vim.lsp.enable("clangd")
			--vim.lsp.enable("gopls")
			
			--vim.g.mapleader = "<Space>"

            vim.g.coq_settings = {
                auto_start = 'shut-up'
            }

            vim.cmd([[colorscheme gruvbox]])

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		'';
	};

	programs.git = {
		userEmail = "138817584+cherrythecool@users.noreply.github.com";
		userName = "cherrythecool";
	};
}
