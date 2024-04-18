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
        gaps_out = 5; #default 20

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
