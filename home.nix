{ config, pkgs, ... }:

{
	home = {
		username = "lyra";
		homeDirectory = "/home/lyra";
		stateVersion = "25.05";
	};
	
	programs = {
		home-manager.enable = true;

		git = {
			enable = true;
			userName = "yves";
			userEmail = "rroughpatch@proton.me";
			extraConfig = {
				init.defaultBranch = "main";
			};
		};
	};
}
