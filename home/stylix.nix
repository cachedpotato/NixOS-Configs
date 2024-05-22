{ pkgs, inputs, ...}:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    autoEnable = false;
    #image = ../wallpapers/hakurei_reimu_1.jpg; 
    base16Scheme = ../themes/base16/gruvbox-dark-soft.yaml;

    fonts = with pkgs; {
      monospace = {
        package = source-code-pro;
        name = "Source Code Pro";
      };
      serif = {
        package = source-code-pro;
        name = "Source Code Pro";
      };
      sansSerif= {
        package = source-code-pro;
        name = "Source Code Pro";
        #package = (nerdfonts.override {fonts = ["FiraCode"];});
        #name = "FiraCode Nerd Font Mono";
      };
      sizes = {
        terminal = 16;
        applications = 16;
        popups = 16;
        desktop = 16;
      };
    };

    opacity = {
      terminal = 0.90;
      applications = 0.90;
      popups = 0.50;
      desktop = 0.50;
    };

    targets = {
      alacritty.enable = true;
      kitty.enable = true;
      firefox.enable = true;
      hyprland.enable = false;
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
