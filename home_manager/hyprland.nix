{config, pkgs, lib, nix-colors,...}:
{

  #base  16 colorschemes with nix-color
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    settings = {
      #leader key settings
      "$mod" = "SUPER";

      general = {
        gaps_in = 5; #default
        gaps_out = 7; #default 20
        border_size = 2; #default 1

        #colors using nix-colors
        "col.active_border" = "rgba(${config.colorScheme.palette.base0E}ff) rgba(${config.colorScheme.palette.base00}ff) 60deg";
        "col.inactive_border" = "rgba(${config.colorScheme.palette.base00}ff)";
      };

      #keyboard layout
      input = {
        kb_layout = "kr";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
      };

      #Keybinds
      bind = [
        "$mod, Q, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, C, killactive"
        "$mod, Tab, cyclenext"
        "$mod, M, exit"
        
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        "$mod, 1, exec, hyprworkspace 1"
        "$mod, 2, exec, hyprworkspace 2"
        "$mod, 3, exec, hyprworkspace 3"
        "$mod, 4, exec, hyprworkspace 4"
        "$mod, 5, exec, hyprworkspace 5"

        "$mod SHIFT, 1, exec, movetoworkspace, 1"
        "$mod SHIFT, 2, exec, movetoworkspace, 2"
        "$mod SHIFT, 3, exec, movetoworkspace, 3"
        "$mod SHIFT, 4, exec, movetoworkspace, 4"
        "$mod SHIFT, 5, exec, movetoworkspace, 5"

        #brightness & sound settings
        ", XF86MonBrightnessDown, exec, brightnessctl set 10-%"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, vol --down"
        ", XF86AudioRaiseVolume, exec, vol --up"


        
      ];

      #Mouse bindings
      #LMB: 272, RMB: 273
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod SHIFT, mouse:272, resizewindow"
      ];

      decoration = {
        rounding = 5;
        active_opacity = "0.7";
        inactive_opacity = "0.7";
        fullscreen_opacity = "0.7";
        drop_shadow = true; #what is this idek

        #blur subcategory
        blur = {
          enabled = true;
          size = 8; #default
          new_optimizations = "on";
          noise = "0.0117";
          vibrancy = "0.1696"; #default
        };
      };
    };
  };
}
