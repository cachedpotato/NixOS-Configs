require('nvim-treesitter.configs').setup{
	ensure_installed = {
		"c",
		"cpp",
		"c_sharp",
		"go",
		"lua",
		"nix",
		"python",
		"rust",
		"query",
		"vim",
		"vimdoc",
	},

	auto_install = false,

	highlight = {enable = true},

	indent= {enable = true},

	incremental_selection = {
		enable = true;
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
}
