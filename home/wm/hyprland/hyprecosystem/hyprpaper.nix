{pkgs, ...}:
{
  home.packages = with pkgs; [
    hyprpaper
  ];

  #hyprpapr conf should not have spaces in between ,
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/.flake_configs/wallpapers/hakurei_reimu_1.jpg
    wallpaper = eDP-1,~/.flake_configs/wallpapers/hakurei_reimu_1.jpg
    
    splash = true
    #ipc = off
  '';
}
