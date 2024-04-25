{pkgs, inputs, lib, config, ...}:
{
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];

  services.hypridle = {
    enable = true;
    listeners = [
      {
        timeout = 180;
        onTimeout = "brightnessctl -s set 10";
        onResume = "brightnessctl - r";
      }

      {
        timeout = 300;
        onTimeout = "loginctl lock-session";
      }

      {
        timeout = 330;
        onTimeout = "hyprctl dispatch dpms off";
        onResume = "hyprctl dispatch dpms on";
      }

      {
        timeout = 1800;
        onTimeout = "systemctl suspend";
      }
    ];
  };
}
