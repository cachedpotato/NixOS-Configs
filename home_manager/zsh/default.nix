{pkgs, lib, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autosuggestion.highlight = "fg=#ff00ff, bg = cyan, bold, underline" #example
    autocd = true;
    
    history = {
      expireDuplicatesFirst = true;
      size = 5000; #I don't need 10000 bro like what
      save = 5000;
    }

    oh-my-zsh = {
      enable = true;
      #check github/ohmyzsh/ohmyzsh/wiki/Themes for more
      #theme = "";
      plugins = [
        "git"
        "sudo"
      ];
    };

    #config after finishing other zsh configs
    syntaxHighlighting = {};

    plugins = [
      #powerlevel 10k related plugins
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/"; 
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }

      {
        name = "powerlevel10k-config";
        src = "./p10k-config";
        file = "p10k.zsh";
      }
    ];

    shellAliases = {
      e = "nvim"; #as in {e}dit
      ll = "ls -l";
      ".." = "cd ..";
      nrs = "sudo nixos-rebuild switch";
      hms = "home-manager switch"
    };
  };
}
