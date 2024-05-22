{pkgs, ...}:
{
  programs.neovim = 
  let
    readLuaConfig = plugin: "lua << EOF\n${builtins.readFile plugin}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      #lazy
      #lazy-nvim

      #treesitter
			{
				plugin = nvim-treesitter;
				config = readLuaConfig ./plugins/treesitter.lua;
			}

      #lsp
      {
        plugin = nvim-lspconfig;
        config = readLuaConfig ./plugins/lsp.lua;
      }

      #git    
      lazygit #maybe install this separately
      gitsigns

      #cmp
			{
				plugin = nvim-cmp;
				config = readLuaConfig ./plugins/cmp.lua;
			}
			cmp_luasnip
			luasnip
      cmp-nvim-lsp
      cmp-buffer
      cmp-path

      #misc
			{
				plugin = telescope-nvim;
				config = readLuaConfig ./plugins/telescope.lua;
			}

      telescope-fzf-native-nvim
      colorizer-nvim
			{
				plugin = indent-blankline-nvim
				config = readLuaConfig ./plugins/indent-blankline.lua
			}
			nvim-autopairs
			lualine-nvim
      #obsidian-nvim # I do wanna try it out
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
    '';
  };
}
