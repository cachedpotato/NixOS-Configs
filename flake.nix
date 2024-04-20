{
  description = "a low-grade flake by cachedpotato";

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

    #base16 color scheme for theming
    #nix-colors.url = "github:misterio77/nix-colors";

    #stylix for more centralized color/theme management
    #may change later
    stylix.url = "github:danth/stylix";
    
    #hyprland
    #hyprland.url = "github:hyprwm/Hyprland";
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: 
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
            stylix.homeManagerModules.stylix
            #nixvim.homeManagerModules.nixvim          
          ];
          extraSpecialArgs = {inherit inputs; };
        };
      };
    };
}
