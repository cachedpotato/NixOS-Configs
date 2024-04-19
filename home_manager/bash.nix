{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      e = "nvim"; #as in {e}dit           };
      ll = "ls -l";
      ".." = "cd ..";                     
      nrs = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
    };
};
