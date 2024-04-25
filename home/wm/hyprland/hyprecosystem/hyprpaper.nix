{pkgs, lib, config, inputs, ...}:
{
  imports = [
    inputs.hyprpaper.homeManagerModules.default
  ];

  services.hyprpaper = {
    enable = true;
    ipc = true; #false if it's getting slow
    splash = true;
    preloads = [
      "~/.flake_configs/wallpapers/hakurei_reimu_1.jpg"
    ];
    wallpapers = [
      "eDP-1, ~/.flake_configs/wallpapers/hakurei_reimu_1.jpg"
    ];
  };
}
