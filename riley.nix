{ pkgs, ... }:
{
	home.packages = with pkgs; [
		neovim
	];
	home.stateVersion = "25.05";
}
