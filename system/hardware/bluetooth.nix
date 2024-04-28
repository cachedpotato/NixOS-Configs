{pkgs, ...}:
{
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez;
    settings = {
      Policy.AutoEnable = true;
    };
  };

  environment.systemPackages = with pkgs; [
      bluez
      bluez-tools
  ];
}
