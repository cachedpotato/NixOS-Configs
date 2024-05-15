{
  imports = [
    ./obsidian.nix
    ./gitsigns.nix
    #./lazy.nix
  ];

  programs.nixvim.plugins = {
    nvim-colorizer.enable = true;
  };
}
