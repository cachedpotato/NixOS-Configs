{config, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    settings = {
      #leader key settings
      "$mod" = "SUPER";
      #bind = [
      #  "$mod, F, exec, firefox"
      #  ", Print, exec, grimblast copy area"
      #];
      #++ (
      #  #workspaces
      #  #binds $mod + shift + 1:10 to move to workspace 1:10
      #    builtins.concatLists (builtins.genList (
      #        x: let
      #          ws = let
      #            c = (x + 1)/10;

      #          in
      #            builtins.toString(x + 1 - (c * 10));
      #        in [
      #          "$mod, ${ws}, workspace, ${toString (x + 1)}"
      #          "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      #        ]
      #      )
      #      10)
      #  );
      #mouse settings
      #LMB: 272, RMB: 273
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod SHIFT, mouse:272, resizewindow"
      ];
    };
  };
}
