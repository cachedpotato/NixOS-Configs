{pkgs, ...}:
{
  #BufReadPre = Open Preexisting Files
  #BufNewFile = Open New File
  #InsertEnter = When we go into Insert Mode
  programs.nixvim.plugins.lazy = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      {
        pkg = gitsigns-nvim;
        dir = "/nix/store/aqfirl32akxm1zfmkg9zx11mb26vqifp-vimplugin-lua5.1-gitsigns.nvim-scm-1-unstable-2024-05-04/lua/gitsigns";
        event = ["BufReadPre" "BufNewFile"];
      }
      {
        pkg = nvim-lspconfig;
        dir = "/nix/store/gmzfpq146r13iipky26131zfz64fjm6h-vimplugin-nvim-lspconfig-2024-05-06/lua/lspconfig";
        event = ["BufReadPre" "BufNewFile"];
      }
      {
        pkg = indent-blankline-nvim;
        event = ["BufReadPre" "BufNewFile"];
      }
      {
        pkg = nvim-autopairs;
        event = ["InsertEnter"];
      }
      {
        pkg = nvim-cmp;
        event = ["InsertEnter"];
      }
      {
        pkg = nvim-treesitter;
        event = ["BufReadPre" "BufNewFile"];
      }
      {
        pkg = obsidian-nvim;
        event = ["BufReadPre" "BufNewFile"];
        ft = "md";
      }
    ];
  };
}
