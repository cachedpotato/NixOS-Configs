{config, lib, pkgs, stylix, ...}:
{
  stylix = {
    autoEnable = false;
    image = ../wallpapers/hakurei_reimu_1.jpg; 
    #base16Scheme = ../themes/base16/equilibrium-light.yaml;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "FiraCode Nerd Font Mono";
      };
      serif = {
        package = pkgs.nerdfonts;
        name = "FiraCode Nerd Font Mono";
      };
      sansSerif= {
        package = pkgs.nerdfonts;
        name = "FiraCode Nerd Font Mono";
      };
      sizes = {
        terminal = 12;
        applications = 12;
        popups = 12;
        desktop = 12;
      };
    };

    opacity = {
      terminal = 0.50;
      applications = 0.50;
      popups = 0.50;
      desktop = 0.50;
    };

    targets = {
      alacritty.enable = true;
      kitty.enable = true;
      firefox.enable = true;
      hyprland.enable = true;
      #rofi.enable = true;
      #swaylock.enable = true;
      nixvim = {
        enable = true;
        transparent_bg.main = true; #default false
        transparent_bg.sign_column = false;
      };
      waybar = {
        enable = true;
        enableCenterBackColors = true;
        enableLeftBackColors = true;
        enableRightBackColors = true;
      };
    };
  };
}
