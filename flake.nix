{
  description = "A very basic flake";

  inputs = {

    #nixos versions
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    #nixpkgs.url-stable = "github:nixos/nixpkgs?ref=nixos-23.11"

    #home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      #follow flake version of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        nixos-mango = lib.nixosSystem {
          inherit system;
          modules = [./configuration.nix];
        };
      };

      homeConfigurations = {
        lowlife = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          #username = "lowlife";
          #homeDirectory = "/home/lowlife";
          modules = [
            ./home_manager
            nixvim.homeManagerModules.nixvim          
          ];
        };
      };
    };
}
