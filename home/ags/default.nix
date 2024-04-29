{pkgs, inputs, ...}:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;

    #config path, leave as null if you don't want HM to manage config
    configDir = ../ags;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      #d-bus user interface for account query
      accountsservice
    ];
  };
}
