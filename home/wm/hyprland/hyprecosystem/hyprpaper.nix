{pkgs, lib, config, inputs, ...}:
{
  imports = [
    inputs.hyprpaper.homeManagerModules.default
  ];

  services.hyprpaper = {
    enable = true;
    ipc = true; #false if it's getting slow
    spash = true;
    preloads = [
      "~/.flake_configs/wallpapers/hakurei_reimu_1.jpg";
    ];
    wallpapers = [
      "eDP-1, ~/.flake_configs/wallpapers/hakurei_reimu_1.jpg";
    ];
  };

  #hyprpapr conf should not have spaces in between ,
  #home.file.".config/hypr/hyprpaper.conf".text = ''
  #  preload = ~/.flake_configs/wallpapers/hakurei_reimu_1.jpg
  #  wallpaper = eDP-1,~/.flake_configs/wallpapers/hakurei_reimu_1.jpg
  #  
  #  splash = true
  #  #ipc = off
  #'';
}
