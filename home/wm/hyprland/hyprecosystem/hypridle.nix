{pkgs, lib, config,inputs, ...}:
{
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];

  services.hypridle = {
    enable = true;
    lockCmd = lib.getExe config.programs.hyprlock.package; #"pidof hyprlock || hyprlock"; 
    beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
    afterSleepCmd = "hyprctl dispatch dpms on";
    ignoreDbusInhibit = false;

    listeners = [
      {
        timeout = 300;
        onTimeout = "brightnessctl -s set 10";
        onResume = "brightnessctl -r";
      }

      {
        timeout = 600;
        onTimeout = "loginctl lock-session";
      }

      {
        timeout = 630;
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
