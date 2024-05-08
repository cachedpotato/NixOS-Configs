{pkgs, inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;
      indent-blankline = {
        enable = true;
        settings.indent.char = "│";
      };

      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          ruff-lsp.enable = true; #python, use alongsied with pylsp
          pylsp = {
            enable = true;
            settings.plugins = {
              jedi_completion.enabled = true;
              jedi_completion.fuzzy = true;
            };
          };
          marksman.enable = true; #markdown
          dockerls.enable = true; #docker
          nixd.enable = true; #nix
          tsserver.enable = true; #TypeScript
          rust-analyzer = { #rust
            enable = true;
            settings.cargo.features = "all";
            installCargo = true;
            installRustc = true;
          };
          #gopls.enable = true; #go
          #clangd.enable = true; #C/C++
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {name = "buffer";}
          ];

          completion.keyword_length = 3; #num char. needed to trigger auto-completion
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };

          #mapping = {
          #  __raw = ''
          #    cmp.mapping.preset.insert({['<Tab>'] = function(fallback)
          #      if cmp.visible() then
          #        cmp.select_next_item()
          #      else
          #        fallback()
          #      end
          #    end})
          #  '';
          #};
        };
      };

      luasnip.enable = true;

      #cmp-path.enable = true;
      #cmp-cmdline.enable = true;
      #lspkind = {
      #  enable = true;
      #  cmp.enable = true; 
      #};
      #friendly-snippets.enable = true;

      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options = {
              silent = true;
              desc = "[f]ind [f]iles";
            };
          };
          "<leader>fg" = {
            action = "live_grep";
            options = {
              silent = true;
              desc = "[f]ind [g]repped string";
            };
          };
          "<leader>fh" = {
            action = "help_tags";
            options = {
              silent = true;
              desc = "[f]ind [h]elp tags";
            };
          };
          "<leader>fc" = {
            action = "grep_string";
            options = {
              silent = true;
              desc = "[f]ind string under [c]ursor";
            };
          };
        };
      };

      treesitter = {
        enable = true;
        incrementalSelection = {
          enable = true;
          keymaps = {
            initSelection = "<C-Space>";
            nodeIncremental = "<C-Space>";
            nodeDecremental = "<bs>";
          };
        };
        indent = true; 
        nixvimInjections = true; #dunno how this interacts with smartindent
      };

      #godot.enable = true;
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
      cursorline = true;
      ignorecase = true;
      smartcase = true;
      conceallevel = 2; #nvim obsidian
      
      #gutter
      signcolumn = "yes";
    };

    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>uh";
        action = ":noh<CR>";
        options = {
          silent = true;
          noremap = true;
          desc = "[u]ndo [h]ighlight";
        };
      }
      {
        mode = "n";
        key = "<leader>uu";
        action = "<C-u>zz";
        options = {
          silent = true;
          noremap = true;
          desc = "move [u]p half screen and adjust cursor";
        };
      }
      {
        mode = "n";
        key = "<leader>dd";
        action = "<C-d>zz";
        options = {
          silent = true;
          noremap = true;
          desc = "move [d]own half screen and adjust screen";
        };
      }
    ];

    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim #obsidian
    ];

    extraConfigLua = ''
      local signs = {Error = "󰅙", Warn = "", Hint = "", Info = ""}
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign"..type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
      end
    '';
  };
}
