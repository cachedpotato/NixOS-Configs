{ config, pkgs, nix-colors, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lowlife";
  home.homeDirectory = "/home/lowlife";

  imports =[
    ./nixvim.nix
    ./bash.nix
    ./hyprland.nix
    ./zsh
    #nix-colors.homeManagerModules.default
  ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    neofetch
    ripgrep
    fzf
    kitty

    (pkgs.nerdfonts.override {fonts = [ "FiraCode" "DroidSansMono"]; })
    meslo-lgs-nf #for powerlevel10k
    #fonts for waybar
    cantarell-fonts
    font-awesome
    #other cool fonts
    jetbrains-mono

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  programs.cava = {
    enable = true;
  };
  
  programs.git = {
    enable = true;
    userName = "cachedpotato";
    userEmail = "chiwonchung98@gmail.com";
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

  #programs.starship = {
  #  enable = true;

  #  #custom settings
  #  settings = {
  #    add_newline = false;
  #    aws.disabled = true;
  #    gcloud.disabled = true;
  #    line_break.disabled = true;
  #  };
  #};
  
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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lowlife/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "alacritty";
    TERMINAL = "alacritty";
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
