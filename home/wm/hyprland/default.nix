{pkgs, ...}:
{
  imports = [
    #  nix-colors.homeManagerModules.default
    ./hyprecosystem 
  ];

  #colorScheme = nix-colors.colorSchemes.dracula;

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.variables = ["--all"]; #systemd access to PATH

    settings = {
      #leader key settings
      "$mod" = "SUPER";

      general = {
        gaps_in = 5; #default
        gaps_out = 7; #default 20
        border_size = 1; #default 1

        #colors using nix-colors
        #"col.active_border" = "rgba(${config.colorScheme.palette.base0E}ff) rgba(${config.colorScheme.palette.base00}ff) 60deg";
        #"col.inactive_border" = "rgba(${config.colorScheme.palette.base00}ff)";
      };

      monitor = [
        "eDP-1, 1920x1080, 0x0, 1" #hyprctl showed scaling of 1.5 for some reason
      ];

      #xwayland = {
      #  force_zero_scaling = true; #for obsidian
      #}

      exec-once = [
        "waybar"
        "hypridle"
        "hyprpaper"
        "hyprlock"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      #keyboard layout
      input = {
        kb_layout = "kr, jp";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      #Keybinds
      bind = [
        "$mod, Q, exec, alacritty"
        "$mod, F, exec, firefox"
        "$mod, W, exec, wofi --show drun"
        "$mod, O, exec, obsidian"

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

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"

        #toggle mute
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        
      ];

      #brightness & sound settings
      bindle = [
        ", XF86MonBrightnessDown, exec, brightnessctl set 2-%"
        ", XF86MonBrightnessUp, exec, brightnessctl set +2%"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ];

      #Mouse bindings
      #LMB: 272, RMB: 273
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod SHIFT, mouse:272, resizewindow"
      ];

      decoration = {
        rounding = 7;
        #opacity is better managed using stylix
        #active_opacity = "0.7";
        #inactive_opacity = "0.7";
        #fullscreen_opacity = "0.7";
        drop_shadow = true; #what is this idek

        #blur subcategory
        blur = {
          enabled = true;
          size = 8; #default
          new_optimizations = "on";
          noise = "0.02"; #default "0.0117";
          vibrancy = "0.1696"; #default
        };
      };
    };
  };
}
