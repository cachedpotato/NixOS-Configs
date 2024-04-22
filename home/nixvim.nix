{config, pkgs, inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    global.mapping = " "; #set leader key to space

    plugins = {
      airline = {
        enable = true;
        settings = {
          powerline_fonts = false;
          statusline_ontop = false;
        };
      };

      autoclose = {
        enable = true;
        keys = {
          "(" = {escape = false; close = true; pair = "()";};
          "{" = {escape = false; close = true; pair = "{}";};
          "[" = {escape = false; close = true; pair = "[]";};
        };
        options.autoIndent = true;
      };

      indent-blankline = true;

      lsp ={
        enable = true;
        servers = {
          rust_analyzer.enable = true;
          pylsp.enable = true;
          gleam.enable = true;
          gopls.enable = false;
          ccls.enable = true;
          nixd.enable = true;
          yamlls.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp"};
            {name = "path"}; #cmd_path
            {name = "buffer"}; #cmd_buffer
            {name = "cmdline"}; #cmd_cmdline
            {name = "luasnip"};
          ];

          mapping = {
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";#show completion suggestions
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({select=true})";
          };
        };
      };

      cmp_luasnip.enable = true;
      cmp_buffer.enable = true;
      cmp_path.enable = true;
      cmp_cmdline.enable = true;
      
      #vscode like pictograms - integrate with cmp
      lspkind = {
        enable = true;
        mode = "symbol"; #text, text_symbol, symbol_text also possible
        cmp.enable = true;
      };

      luasnip.enable = true;

      nix.enable = false;
      rust-tools.enable = false;

      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
        };

        keymaps = {
          "<C-k>" = {
            mode = "i";
            action = "move_selection_previous";
          };
          "<C-j>" = {
            mode = "i";
            action = "move_selection_next";
          };
        };

        keymapsSilent = false; #idk how this interacts with nixvim keybind options
      };

      treesitter = {
        enable = true;
        ensureInstalled = [
          "c"
          "cpp"
          "gleam"
          "nix"
          "python"
          "rust"
          "yaml"
        ];
      };
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      tabstop = 2;
      nowrap = true;
      ignorecase = true;
      smartcase = true;
      guicursor = "n-v-c-i:block"; #set cursor to block type at all times
   
    };

    keymaps = [
      #telescope key maps 
      {
        mode = "n";
        key = "<leader>tf";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        mode = "n";
        key = "<leader>tg";
        action = "<cmd>Telescope live_grep<cr>";
      }
      {
        mode = "n";
        key = "<leader>th";
        action = "<cmd>Telescope help_tags<cr>";
      }
      {
        mode = "n";
        key = "<leader>tr";
        action = "<cmd>Telescope oldfiles<cr>";
      }
    ];
  };
}
