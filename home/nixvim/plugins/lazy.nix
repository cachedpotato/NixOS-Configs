{pkgs, ...}:
{
  #BufReadPre = Open Preexisting Files
  #BufNewFile = Open New File
  #InsertEnter = When we go into Insert Mode
  programs.nixvim.plugins.lazy = {
    enable = true;
    plugins = [
      {
        pkg = pkgs.vimPlugins.gitsigns-nvim;
        dev = true;
        event = ["BufRead"];
      }
      {
        pkg = pkgs.vimPlugins.nvim-lspconfig;
        dev = true;
        event = ["BufReadPre" "BufNewFile"];
      }
      {
        pkg = pkgs.vimPlugins.indent-blankline-nvim;
        dev = true;
        event = ["BufReadPre" "BufNewFile"];
      }
      {
        pkg = pkgs.vimPlugins.nvim-autopairs;
        dev = true;
        event = ["InsertEnter"];
      }
      {
        pkg = pkgs.vimPlugins.nvim-cmp;
        dev = true;
        event = ["InsertEnter"];
      }
      {
        pkg = pkgs.vimPlugins.nvim-treesitter;
        dev = true;
        event = ["BufReadPre" "BufNewFile"];
      }
      #{
      #  pkg = pkgs.vimPlugins.obsidian-nvim;
      #  dev = true;
      #  event = ["BufReadPre" "BufNewFile"];
      #  ft = "md";
      #}
    ];
  };
}
