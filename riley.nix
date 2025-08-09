{ pkgs, ... }:
{
	home.packages = with pkgs; [
		neovim
		ungoogled-chromium
		btop
		ghostty
		fooyin
	];

	programs.git = {
		userEmail = "138817584+cherrythecool@users.noreply.github.com";
		userName = "cherrythecool";
	};

	home.stateVersion = "25.05";
}
