{lib, pkgs, stylix, ...}:
{
  stylix = {
    autoEnable = false;
    image = ../wallpapers/hakurei_reimu_1.jpg;
    base16Scheme = ../color_schemes/equilibrium-light.yaml;
    polarity = "light";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "FiraCode Nerd Font Mono"
      };
      serif = {
        package = pkgs.nerdfonts;
        name = "FiraCode Nerd Font Mono"
      };
      sansSerif= {
        package = pkgs.nerdfonts;
        name = "FiraCode Nerd Font Mono"
      };
      sizes = {
        terminal = 12;
        applications = 12;
        popups = 12;
        desktop = 12;
      };
    };

    opacity = {
      terminal = 0.80;
      applications = 0.90;
      popups = 0.80;
      desktop = 0.90;
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
        enable = false;
        enableCenterBackColors = true;
        enableLeftBackColors = true;
        enableRightBackColors = true;
      };
    };
  };
}
