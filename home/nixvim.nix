{pkgs, config, inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;
      indent-blankline = {
        enable = true;
        settings.indent.char = "";
      };
    };

    opts = {
      #tabs
      tabstop = 2;
      expandtab = true;
      shiftwidth = 2;

      #indents
      autoindent = true;
      smartindent = true;

      #line number
      number = true;
      relativenumber = true;

      #Misc
      wrap = false;
      guicursor = "a:block";
      colorcolumn = "100";
      ignorecase = true;
      smartcase = true;
    };

    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>h";
        action = ":noh<CR>";
        options = {
          silent = true;
          noremap = true;
          desc = "remove [h]ighlight";
        };
      }
      {
        mode = "n";
        key = "<Alt-u>";
        action = "<C-u>zz";
        options = {
          silent = true;
          noremap = true;
          desc = "move [u]p half screen and adjust cursor";
        };
      }
      {
        mode = "n";
        key = "<Alt-d>";
        action = "<C-d>zz";
        options = {
          silent = true;
          noremap = true;
          desc = "move [d]own half screen and adjust cursor";
        };
      }
    ];
  };
}
