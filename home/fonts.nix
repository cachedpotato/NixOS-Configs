{pkgs, ...}:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [

    (pkgs.nerdfonts.override {fonts = [ "FiraCode" "DroidSansMono"]; })
    meslo-lgs-nf #for powerlevel10k
    #fonts for waybar
    cantarell-fonts
    font-awesome
    #other cool fonts
    jetbrains-mono
    intel-one-mono
  ];
}
