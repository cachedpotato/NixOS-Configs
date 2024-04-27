{ config, ...}:
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
          #"cava"
          #"custom/language"
          "cpu"
          "memory"
          "backlight"
          "pulseaudio"
          "network"
          "battery"
        ];

        "hyprland/workspaces" = {
          active-only = false;
          #persistent-workspaces = {
          #  "*" = 5; #5 workspaces at all times
          #};
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
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

        #"cava" = {
        #  bars = 12;
        #  bar_delimiter = 0;
        #  stereo = true;
        #  framerate = 60;
        #  sensitivity = 4.2;
        #  #if you're setting sensitivity comment out autosens
        #  #and vice versa
        #  #autosens = 1;
        #  input_delay = 2;
        #  hide_on_silence = false;
        #  #monstercat smoothing - change both monstercat
        #  #and waves to the same value
        #  monstercat = true;
        #  waves = true;
        #  format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        #};

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
            #on-scroll-up = "shift_up";
            #on-scroll-down = "shift_down";
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
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "cpu" = {
          format = " {usage}%";
          interval = 30;
        };

        "memory" = {
          format = " {percentage}%";
          interval = 30;
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          format-muted = "󰖁";
          format-bluetooth = "󰂰";
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
    
    style = with config.lib.stylix.colors; ''
      * {
        border: none;
        font-family:JetBrainsMono Nerd Font;
        font-size: 13px;
        color: #ffffff;
        border-radius: 0px;
        min-height: 0;
      }

      window {
        /*font-weight: bold;*/
      }
      window#waybar {
        /*background: rgba(0, 0, 0, 0);*/
        background: transparent;
      }
      /*-----module groups----*/
      .modules-right {
      }
      .modules-center {
      }
      .modules-left {
      }

      /*-----modules indv----*/
      /*-----from left to right-----*/
      #workspaces button {
        padding: 1px 5px 0 5px; 
        margin: 1px 0 0 0;
        background-color: transparent;
      }
      
      #workspaces button:hover {

      }
      
      #workspaces button.urgent {
        color : rgba(245, 39, 39, 0.73)
        /*background-color: rgba(0,43,51,0.85);*/
      }

      #clock {

      }

      #idle_inhibitor {

      }

      #cpu {

      }

      #memory {

      }

      #backlight {

      }

      #pulseaudio {

      }

      #network {

      }

      /*battery kept getting clipped off on the right side*/
      #battery {
        padding: 1 10px 0 5px;
        margin: 1 10px 0 5px;
      }

      #clock,
      #network,
      #backlight,
      #memory,
      #cpu,
      #pulseaudio,
      #idle_inhibitor {
        padding: 1px 3px 0 3px;
        margin: 1px 2px 0 2px;
      }

      /*-----Animations-----*/

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: black;
        }
      }

      /*-----Indicators-----*/

      #idle_inhibitor.activated {
          color: #ffffff;
      }
      #idle_inhibitor.deactivated {
          color: #ffffff;
      }
      #battery.charging {
          color: #2dcc36;
      }
      #battery.warning:not(.charging) {
        color: #e6e600;
        animation-name: blink;
        animation-duration: 1.0s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      #battery.critical:not(.charging) {
        color: #cc3436;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
