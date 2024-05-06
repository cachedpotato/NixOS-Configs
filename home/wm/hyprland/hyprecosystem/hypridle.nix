{pkgs, lib, config,inputs, ...}:
{

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        "lock_cmd" = "pidof hyprlock || hyprlock"; #lib.getExe config.programs.hyprlock.package; #"pidof hyprlock || hyprlock"; 
        "before_sleep_cmd" = "${pkgs.systemd}/bin/loginctl lock-session";
        "after_sleep_cmd" = "hyprctl dispatch dpms on";
        "ignore_dbus_limit" = false;
      };

      listener = [
        {
          timeout = 300;
          "on-timeout" = "brightnessctl -s set 10";
          "on-resume" = "brightnessctl -r";
        }

        {
          timeout = 600;
          "on-timeout" = "loginctl lock-session";
        }

        {
          timeout = 630;
          "on-timeout" = "hyprctl dispatch dpms off";
          "on-resume" = "hyprctl dispatch dpms on";
        }

        {
          timeout = 1800;
          "on-timeout" = "systemctl suspend";
        }
      ];
    };
  };
}
