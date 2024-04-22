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
          #"idle_inhibitor"
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

        #"idle_inhibitor" = {
        #  format = "idle: {status}";
        #};

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

    style = '' 
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: "Fira Code Mono";
        font-size: 13px;
        min-height: 0;
      }
      
      window#waybar {
        background: transparent;
        /*    background-color: rgba(43, 48, 59, 0.5); */
        /*    border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }
      
      window#waybar.hidden {
        opacity: 0.2;
      }
      
      #waybar.empty #window {
        background-color: transparent;
      }
      
      #workspaces {
      }
      
      #window {
        margin: 2;
        padding-left: 8;
        padding-right: 8;
        background-color: rgba(0,0,0,0.3);
        font-size:14px;
        font-weight: bold;
      }
      
      button {
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 0;
      }
      
      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
        background: inherit;
        border-top: 2px solid #c9545d;
      }
      
      #workspaces button {
        padding: 0 4px;
        /*    background-color: rgba(0,0,0,0.3); */
      }
      
      #workspaces button:hover {
      }
      
      #workspaces button.focused {
        /*    box-shadow: inset 0 -2px #c9545d; */
        background-color: rgba(0,0,0,0.3);
        color:#c9545d;
        border-top: 2px solid #c9545d;
      }
      
      #workspaces button.urgent {
        background-color: #eb4d4b;
      }
      
      #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }
      
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
        margin: 2px;
        padding-left: 4px;
        padding-right: 4px;
        background-color: rgba(0,0,0,0.3);
        color: #ffffff;
      }
      
      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }
      
      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }
      
      #clock {
        font-size:14px;
        font-weight: bold;
      }
      
      #battery icon {
        color: red;
      }
      
      #battery.charging, #battery.plugged {
        color: #ffffff;
        background-color: #26A65B;
      }
      
      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }
      
      #battery.warning:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      
      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      
      label:focus {
        background-color: #000000;
      }
      
      #network.disconnected {
        background-color: #f53c3c;
      }

      #temperature.critical {
        background-color: #eb4d4b;
      }
      
      #idle_inhibitor.activated {
        background-color: #ecf0f1;
        color: #2d3436;
      }
      
      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
      } 
    '';
  };
}
