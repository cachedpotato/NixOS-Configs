{pkgs, lib, ...}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    #autosuggestion.highlight = "fg=#ff00ff, bg = cyan, bold, underline"; #example
    autocd = true;
    
    history = {
      expireDuplicatesFirst = true;
      size = 5000; #I don't need 10000 bro like what
      save = 5000;
    };

    oh-my-zsh = {
      enable = true;
      #check github/ohmyzsh/ohmyzsh/wiki/Themes for more
      #theme = "";
      plugins = [
        "git"
        "sudo"
        "docker"
      ];

      extraConfig = ''
        #display red dots whilst waiting for completion
        COMPLETION_WAITING_DOTS="true"
      '';
    };

    #config after finishing other zsh configs
    syntaxHighlighting = {
      enable = true;
    };

    plugins = [];

    shellAliases = {
      e = "nvim"; #as in {e}dit
      ll = "ls -l";
      ".." = "cd ..";
      nrs = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
    };
  };
}
