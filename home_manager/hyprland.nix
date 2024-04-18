{config, pkgs, lib, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    settings = {
      #leader key settings
      "$mod" = "SUPER";

      general = with config.colorScheme.colors; {
        gaps_in = 5; #default
        gaps_out = 5; #default 20

        #border colors with matching base16 colors? idk
        "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
        "col.inactive_border" = "rgba(${base00}ff)"
        
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
        active_opacity = "0.3";
        inactive_opacity = "0.3";
        fullscreen_opacity = "0.3";
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
