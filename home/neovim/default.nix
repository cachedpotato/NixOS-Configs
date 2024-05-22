{pkgs, ...}:
{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      #lazy
      lazy-nvim
      #treesitter
      nvim-treesitter
      #nvim-treesitter-textobjects

      #lsp
      nvim-lspconfig
      #git    
      lazygit #maybe install this separately
      gitsigns
      #cmp
      nvim-cmp
      nvim-cmp-lsp
      cmp-buffer
      cmp-path
      lspkind
      luasnip
      #misc
      telescope-nvim
      telescope-fzy-native-nvim
      colorizer-nvim
      #obsidian-nvim # I do wanna try it out
    ];
  };
}
