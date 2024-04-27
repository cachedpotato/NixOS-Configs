{
  imports = [
    ./obsidian.nix
    ./gitsigns.nix
  ];

  programs.nixvim.plugins = {
    nvim-colorizer.enable = true;
  };
}
