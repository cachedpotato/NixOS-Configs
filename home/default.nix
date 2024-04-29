{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lowlife";
  home.homeDirectory = "/home/lowlife";

  imports =[
    ./nixvim
    ./wm
    ./shell
    ./stylix.nix
    ./fonts.nix
    ./ags
  ];

  home.packages = with pkgs; [
    neofetch
    ripgrep
    fzf
    kitty
  ];

  programs.cava = {
    enable = true;
    settings = { 
      output.data_format = "ascii";
      output.ascii_max_range = 9;
    };
  };
  
  programs.git = {
    enable = true;
    userName = "cachedpotato";
    userEmail = "chiwonchung98@gmail.com";
  };

  programs.ruff = { #Python linter, rust powered!
    enable = true;
    settings = {
      line-length = 100;
    };
  };

  programs.btop = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        #draw_bold_text_with_bright_colors = true;
      };

      cursor = {
        style.shape = "block";
        style.blinking = "on";
        blink_interval = 750; #ms, default
      };

      #colors = {}
      selection.save_to_clipboard = true;
    };
  };

  
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  #
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "alacritty";
    TERMINAL = "alacritty";
    XDG_SESSION_TYPE = "wayland";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
}
