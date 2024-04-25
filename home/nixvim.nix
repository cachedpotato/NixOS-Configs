{config, pkgs, inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true;
        xclip.enable = true;
      };
    };
    plugins = {
      lualine.enable = true;

      nvim-autopairs.enable = true;

			indent-blankline = {
				enable = true;
				settings.indent.char = "";
			};

      lsp = {
        enable = true;
        servers = {
          bashls.enable = true; #bash
          ccls.enable = true; #c/c++
          dockerls.enable = true; #Docker
          gleam.enable = true; #gleam
          marksman.enable = true; #markdown
          nixd.enable = true; #nix
          #pylsp.enable = true; 
          #pylyzer.enable = true;
          pyright.enable = true;
          #ruff.enable = true;
          #ruff-lsp.enable = true; #python
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          yamlls.enable = true; #YAML
        };
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
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "buffer";}
            {name = "path";}
            {name = "cmdline";}
            {name = "cmp";}
            {name = "luasnip";}
          ];

          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';

          view.docs.auto_open = true;

          window = {
            documentation.border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
            documentation.winhighlight = "Normal:NormalNC,FloatBorder:NormalNC,CursorLine:PmenuSel,Search:None";
            documentation.max_height = "math.floor(40 * (40 / vim.o.lines))";
            documentation.max_width = "math.floor((40 * 2) * (vim.o.columns / (40 * 2 * 16 / 9)))";
            completion.border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
            completion.winhighlight = "Normal:NormalNC,FloatBorder:NormalNC,CursorLine:PmenuSel,Search:None";

            mapping = {
              "<C-b>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = "cmp.mapping.complete()";
              "<C-e>" = "cmp.mapping.abort()";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              #__raw = ''
              #  cmp.mapping.preset.insert({
              #    ['<CR>'] = cmp.mapping({
              #      i = function(fallback)
              #        if cmp.visible() and cmp.get_active_entry() then
              #          cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false})
              #        else
              #          fallback()
              #        end
              #      end,
              #      s = cmp.mapping.confirm({select = true}),
              #      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true}),
              #    }),
              #  })
              #'';
            };
          }; 
        };
      };

      friendly-snippets.enable = true;
      lspkind.enable = true;
      lspkind.cmp.enable = true; #icons

      treesitter = {
        enable = true;
        indent = true;
        ensureInstalled = [
          "c"
          "cpp"
          "dockerfile"
          "bash"
          "gleam"
          "markdown"
          "nix"
          "python"
          "rust"
          "yaml"
        ];
        incrementalSelection.enable = true;
      };

			telescope = {
			  enable = true;
				extensions.fzf-native.enable = true;
				keymaps = {
				  "<leader>tf" = {
					  mode = "n";
						action = "find_files";
						options.desc = "[t]elescope [f]ind file";
					};
				  "<leader>tg" = {
					  mode = "n";
						action = "live_grep";
						options.desc = "[t]elescope search [g]rep string";
					};  
				  "<leader>tr" = {
					  mode = "n";
						action = "oldfiles";
						options.desc = "[t]elescope search through [r]ecents";
					};

				  "<leader>tc" = {
					  mode = "n";
						action = "grep_string";
						options.desc = "[t]elescope search string under [c]ursor";
					};
					#"<C-k>" = {
					#  mode = "i";
					#	action = "move_selection_previous";
					#};
					#"<C-j>" = {
					#  mode = "i";
					#	action = "move_selection_next";
					#};
				};
			};
      
    };

    opts = {
      #tabs
      tabstop = 2;
			expandtab = true;
      shiftwidth = 2;

      #indentations
      autoindent = true;

      #line number
      number = true;
      relativenumber = true;

      #Misc
			wrap = false;
      guicursor = "a:block-CursorLineNr";
      colorcolumn = "100";
      ignorecase = true;
      smartcase = true;
      #mouse = "a";
    };

    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>nh";
        action = ":noh<CR>";
        options = {
            silent = true;
            noremap = true;
            desc = "deactivate search highlights";
        };
      }
      {
        mode = "i";
        key = "jk";
        action = "<ESC>";
        options = {
            silent = true;
            noremap = true;
            desc = "escape from insert mode";
        };
      }
    ];
  };
}
