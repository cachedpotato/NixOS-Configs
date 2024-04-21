{pkgs, lib, config, ...}:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];
        modules-center = [
          "hyprland/window"
          "idle_inhibitor"
        ];
        modules-right = [
          "cava"
          "clock"
          "battery"
        ];

        "hyprland/workspaces" = {
          active-only = false;
          format = "{id}";
          move-to-monitor = true;
        };

        "hyprland/window" = {
          format = "{initialTitle}";
          separate-outputs = true;
        };

        "idle_inhibitor" = {
          format = "idle: {status}";
        };

        "cava" = {
          bars = 12;
          bar_delimiter = 0;
          stereo = true;
          framerate = 60;
          sensitivity = 4.2;
          #if you're setting sensitivity comment out autosens
          #and vice versa
          #autosens = 1;
          input_delay = 2;
          hide_on_silence = false;
          #monstercat smoothing - change both monstercat
          #and waves to the same value
          monstercat = true;
          waves = true;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        "clock" = {
          interval = 60;
          format = "{:%H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          timezones = [
            "Asia/Seoul"
            "America/Los_Angeles"
            "America/Detroit"
          ];
          calendar = {
            mode = "month"; #[month|year]
            mode-mon-col = 4;
            weeks-pos = "left";
            on-scroll = 1;
          };

          actions = {
            on-click = "tz_up";
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
            on-click-middle = "shift_year";
          };
        };

        "battery" = {
          format = "{capacity}%";
          max-length = 25;
          #time till full/zero
          format-time = "{H} h {M} min";
          #tooltip-format = "<tt><small>{timeTo}</small></tt>";
        };
        reload_style_on_change = false; #default false
      };
    };
  };
}
