{pkgs, config, lib, stylix, inputs, ...}:
{
  imorts = [
    inputs.hyprlock.homeManagerModules.default
  ];

  programs.hyprlock = {
    enable = true;
    general = {
      disable_loading_bar = false;
      grace = 0;
      hide_cursor = true;
      no_fade_in = false; #default, if slow change if this seems to be the problem
      no_fade_out = false;#default, if slow change if this seems to be the problem
    };

    backgrounds = {
      monitor = "eDP-1";
      blur_size = 8;
      blur_passes = 0;
      noise = 0.0117;
      contrast = 0.8917;
    };

    images = {
      monitor = "eDP-1";
      path = "/home/lowlife/.flake_configs/wallpapers/hakurei_reimu_lock_1.jpg";
    };

    input-fields = {
      monitor = "eDP-1";
      size = 200; #default 200
      height = 50; #default 50
      outline_thickness = 3; #default 3
      dots_size = 0.33; #default 0.33
      dots_spacing = 0.18; #default 0.15
      dots_center = true; #center position of the dots
      outer_color = with config.lib.stylix.colors; "rgb(" + base07-rgb-r + "," + base07-rgb-g + "," + base07-rgb-b + ")";
      inner_color = with config.lib.stylix.colors; "rgb(" + base00-rgb-r + "," + base00-rgb-g + "," + base00-rgb-b + ")";
      font_color = "rgb(20, 20, 20)"; #default
      fade_on_empty = true;
      fade_timeout = 2000; #default 2000, ms
      fail_color = with config.lib.stylix.colors; "rgb(" + base08-rgb-r + "," + base08-rgb-g + "," + base08-rgb-b + ")";
      fail_transition = 300; #default 300 ms
      position.x = 0;
      position.y = -20;
      halign = "center";
      valign = "center";

      labels = [
        {
          monitor = "eDP-1";
          text = "Welcome Back, $USER";
          color = with config.lib.stylix.colors; "rgb(" + base07-rgb-r + "," + base07-rgb-g + "," + base07-rgb-b + ")"; #default
          font_size = 25; #default 25
          font_family = "Noto Sans";
          position.x = 0;
          position.y = 80;
          halign = "center";
          valign = "center";
        }
        {
          monitor = "eDP-1";
          text = "$TIME";
          color = "rgba(200, 200, 200, 1.0)"; #default
          font_size = 70; #default 25
          font_family = "Noto Sans";
          position.x = 0;
          position.y = 140;
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
 # home.file.".config/hypr/hyprlock.conf".text = ''
 #   general {
 #     disable_loading_bar = false
 #     #the amount of seconds for which the lockscreen will unlock on mouse movement
 #     grace = 0
 #   }

 #   #shape {
 #   #  monitor =
 #   #  size = 360, 60
 #   #  color = rgba(17, 17, 17, 1.0)
 #   #  rounding = -1
 #   #  border_size = 8
 #   #  border_color = rgba(''+config.lib.stylix.colors.base08-rgb-r+'',''+config.lib.stylix.colors.base08-rgb-g+'', ''+config.lib.stylix.colors.base08-rgb-b+'', 1.0)
 #   #  rotate = 0
 #   #  xray = false # if true, make a "hole" in the background (rectangle of specified size, no rotation)

 #   #  position = 0, 80
 #   #  halign = center
 #   #  valign = center
 #   #}

 #   background {
 #     monitor =
 #     path = screenshot

 #     #default blur/screen settings from official website
 #     blur_passes = 4
 #     blur_size = 5
 #     noise = 0.0117
 #     contrast = 0.8916
 #     brightness = 0.8172
 #     vibrancy = 0.1696
 #     vibrancy_darkness = 0.0
 #   }

 #   input-field {
 #     monitor =
 #     size = 200, 50
 #     outline_thickness = 3
 #     dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
 #     dots_spacing = 0.15 # Scale of dots' absolute size, 0.0 - 1.0
 #     dots_center = false
 #     dots_rounding = -1 # -1 default circle, -2 follow input-field rounding

 #     #================colorconfig with stylix================
 #     #by librephoenix
 #     outer_color = rgb(''+config.lib.stylix.colors.base07-rgb-r+'',''+config.lib.stylix.colors.base07-rgb-g+'', ''+config.lib.stylix.colors.base07-rgb-b+'')
 #     inner_color = rgb(''+config.lib.stylix.colors.base00-rgb-r+'',''+config.lib.stylix.colors.base00-rgb-g+'', ''+config.lib.stylix.colors.base00-rgb-b+'')
 #     font_color = rgb(''+config.lib.stylix.colors.base07-rgb-r+'',''+config.lib.stylix.colors.base07-rgb-g+'', ''+config.lib.stylix.colors.base07-rgb-b+'')
 #     #=======================================================
 #     fade_on_empty = true
 #     fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
 #     placeholder_text = <i>Input Password...</i> # Text rendered in the input box when it's empty.
 #     hide_input = false
 #     rounding = -1 # -1 means complete rounding (circle/oval)
 #     #===================colorconfig with stylix==============
 #     check_color = rgb(''+config.lib.stylix.colors.base0A-rgb-r+'',''+config.lib.stylix.colors.base0A-rgb-g+'', ''+config.lib.stylix.colors.base0A-rgb-b+'')
 #     fail_color = rgb(''+config.lib.stylix.colors.base08-rgb-r+'',''+config.lib.stylix.colors.base08-rgb-g+'', ''+config.lib.stylix.colors.base08-rgb-b+'')
 #     ========================================================
 #     fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
 #     fail_transition = 300 # transition time in ms between normal outer_color and fail_color
 #     capslock_color = -1
 #     numlock_color = -1
 #     bothlock_color = -1 # when both locks are active. -1 means don't change outer color (same for above)
 #     invert_numlock = false # change color if numlock is off
 #     swap_font_color = false # see below

 #     position = 0, -20
 #     halign = center
 #     valign = center
 #   }

 #   label {
 #     monitor =
 #     text = Hello, $USER
 #     text_align = center # center/right or any value for default left. multi-line text alignment inside label container
 #     color = rgb(''+config.lib.stylix.colors.base07-rgb-r+'',''+config.lib.stylix.colors.base07-rgb-g+'', ''+config.lib.stylix.colors.base07-rgb-b+'')
 #     font_size = 25
 #     font_size = 25
 #     font_family = FiraCode Nerd Font Mono
 #     rotate = 0 # degrees, counter-clockwise
 #     position = 0, 80
 #     halign = center
 #     valign = center
 #   }

 #   label {
 #     monitor =
 #     text = $TIME
 #     color = rgba(200, 200, 200, 1.0)
 #     font_size = 80
 #     font_family = JetBrains Nerd Font Mono
 #     rotate = 0 # degrees, counter-clockwise

 #     position = 0, 160
 #     halign = center
 #     valign = center
 #   }
 # '';
 #
