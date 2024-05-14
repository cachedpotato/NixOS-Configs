{
  #BufReadPre = Open Preexisting Files
  #BufNewFile = Open New File
  #InsertEnter = When we go into Insert Mode
  programs.nixvim.plugins.lazy = {
    enable = true;
    plugins = {
      gitsigns.event = ["BufReadPre" "BufNewFile"];
      nvim-autopairs.event = ["InsertEnter"];
      indent-blankline.event = ["BufReadPre" "BufNewFile"];
      lsp.event = ["BufReadPre" "BufNewFile"];
      #Obsidian uses Markdown for notes
      obsidian = {
        event = ["BufReadPre" "BufNewFile"];
        ft = "md";
      };
      cmp.event = ["InsertEnter"];
      treesitter.event = ["BufReadPre" "BufNewFile"];
    };
  };

}
