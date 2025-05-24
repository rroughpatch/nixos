{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hm = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hm, ... }@inputs: {
    nixosConfigurations = {
			jasmine = nixpkgs.lib.nixosSystem {
      	system = "x86_64-linux";
     		modules = [
					./configuration.nix
					hm.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.lyra = ./home.nix;
					}
				];
    	};
		};
  };
}
