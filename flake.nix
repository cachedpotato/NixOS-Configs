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

    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    ags.url = "github:Aylur/ags";

    #stylix for more centralized color/theme management
    #may change later
    stylix.url = "github:danth/stylix";

    ############################---HYPRLAND---############################
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
      inputs.systems.follows = "hyprland/systems";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
      inputs.systems.follows = "hyprland/systems";
    };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
      inputs.systems.follows = "hyprland/systems";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        #config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        nixos-mango = lib.nixosSystem {
          inherit system;
          specialArgs = {inherit inputs;};
          modules = [./hosts/nixos-mango/default.nix];

        };
      };

      homeConfigurations = {
        lowlife = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          #username = "lowlife";
          #homeDirectory = "/home/lowlife";
          modules = [
            ./home
            #stylix.homeManagerModules.stylix
            #nixvim.homeManagerModules.nixvim          
          ];
          extraSpecialArgs = {
            inherit inputs; 
            inherit stylix; 
          };
        };
      };
    };
}
