{config , ...}:
{
  programs.hyprlock = {
    enable = true;
    
    settings = {
      general = {
        disable_loading_bar = false;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false; 
        no_fade_out = false;
      };

      background = [
        {
          monitor = "eDP-1";
          path = "~/.flake_configs/wallpapers/zelda_totk_wallpaper.png";
          blur_passes = 0;
          blur_size = 8;
          noise = "0.0117";
          contrast = "0.8917";
        }
      ];

      input-field = [ 
        {
          monitor = "eDP-1";
          size = "240, 60";
          outline_thickness = 3; #default 3
          dots_size = "0.33"; #default 0.33
          dots_spacing = "0.18"; #default 0.15
          dots_center = true; #center position of the dots
          outer_color = with config.lib.stylix.colors; "rgb(" + base00-rgb-r + "," + base00-rgb-g + "," + base00-rgb-b + ")";
          inner_color = with config.lib.stylix.colors; "rgb(" + base07-rgb-r + "," + base07-rgb-g + "," + base07-rgb-b + ")";
          font_color = "rgb(20, 20, 20)"; #default
          fade_on_empty = true;
          fade_timeout = 2000; #default 2000, ms
          fail_color = with config.lib.stylix.colors; "rgb(" + base08-rgb-r + "," + base08-rgb-g + "," + base08-rgb-b + ")";
          fail_transition = 300; #default 300 ms
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
      
      label = [
        {
          monitor = "eDP-1";
          text = "Welcome Back, $USER";
          color = with config.lib.stylix.colors; "rgb(" + base00-rgb-r + "," + base00-rgb-g + "," + base00-rgb-b + ")"; #default
          font_size = 25; #default 25
          font_family = "Intel One Mono";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "eDP-1";
          text = "$TIME";
          color = with config.lib.stylix.colors; "rgb(" + base00-rgb-r + "," + base00-rgb-g + "," + base00-rgb-b + ")"; #default
          font_size = 70; #default 25
          font_family = "Intel One Mono";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
