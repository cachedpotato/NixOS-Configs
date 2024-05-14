{
  #BufReadPre = Open Preexisting Files
  #BufNewFile = Open New File
  #InsertEnter = When we go into Insert Mode
  programs.nixvim.plugins.lazy = {
    enable = true;
    plugins = [
      {
        name = "gitsigns";
        dev = true;
        event = ["BufReadPre" "BufNewFile"];
      }
    ];

    #gitsigns.event = ["BufReadPre" "BufNewFile"];
    #nvim-autopairs.event = ["InsertEnter"];
    #indent-blankline.event = ["BufReadPre" "BufNewFile"];
    #lsp.event = ["BufReadPre" "BufNewFile"];
    #cmp.event = ["InsertEnter"];
    #treesitter.event = ["BufReadPre" "BufNewFile"];
  };
}
