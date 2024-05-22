local lspconfig = require('lspconfig')

-- enable autocompletion
local capabilities = require('cmp_nvim_lsp').default_capabilities() 

-- keymaps only when LSP is active
local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings
		local opts = {buffer = ev.buf, silent = true}

		-- keymaps
		opts.desc = "Show LSP References"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Go to Declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "show buffer diagnostics"
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "show documentation for what's under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)

	end,
})

-- diagnostic symbols
local signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- set up default settings ofr lsp servers
local lsp_servers = [
	"ccls",
	"ruff",
	"pyright",
	"rust_analyzer",
	"gopls",
	"clang",
	"lua_ls",
	"nixd",
	"rnix",
]

for server in lsp_servers do
	lspconfig[server].setup{
		capabilities = capabilities,
	}
end
