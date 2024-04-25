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
        ];
        modules-center = [
          "clock"
          "idle_inhibitor"
        ];
        modules-right = [
          "cava"
          "battery"
          "network"
        ];

        "hyprland/workspaces" = {
          active-only = false;
          #persistent-workspaces = {
          #  "*" = 5; #5 workspaces at all times
          #};
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            #empty = "";
            urgent = ""; #color to red
          };
          move-to-monitor = true;
        };

        #"hyprland/window" = {
        #  format = "{initialTitle}";
        #  separate-outputs = true;
        #};

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰒲";
            deactivated = "󰒳";
          };
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
          format = "{icon}";
          format-time = "{H} h {M} min";
          states = {
            warning = 30;
            critical = 15;
          };
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "network" = {
          format-ethernet = "󰈁";
          format-wifi = "{icon}";
          format-linked ="";
          format-disconnected = "󰪎";
          format-icons = [
            "󰤠"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          on-click = "alacritty -e 'nmtui'"; #call network manager
        };
      };
    };

    style = ./style.css; 
   };
}
