{pkgs, ...}: 
{
  # wayland & sddm config
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    package = pkgs.sddm;
  };
}
