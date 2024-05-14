{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = true;
      spash = false;

      preload = [
        "~/.flake_configs/wallpapers/zelda_totk_wallpaper.png"    
      ];

      wallpaper = [
        "eDP-1,~/.flake_configs/wallpapers/zelda_totk_wallpaper.png"    
      ];
    };
  };
}
