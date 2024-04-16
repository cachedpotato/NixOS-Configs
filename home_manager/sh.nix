{config, pkgs, ...}:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
  };

}
