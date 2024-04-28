{pkgs, ...}:
{
  users = {
    users.lowlife = {
      isNormalUser = true;
      description = "lowlife";
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        firefox
      #  thunderbird
      ];
    };

    defaultUserShell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
