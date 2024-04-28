{pkgs, config, ...}:
{
  # Bootloader
  boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = {
        ext4 = true;
      };
    };

    #use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false;

      #enable grub bootloader
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = false;
        devices = [ "nodev" ];
      };
    };

    plymouth.enable = true;

  };

  environment.systemPackages =  [config.boot.kernelPackages.cpupower];

}
