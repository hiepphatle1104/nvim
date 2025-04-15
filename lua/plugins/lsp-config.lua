local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp", "williamboman/mason-lspconfig.nvim" },

	ensure_installed = { "lua_ls", "gopls", "ts_ls", "jdtls", "groovyls", "pyright", "buf_ls", "jsonls" },
	opts = {
		servers = {
			jsonls = {},
			buf_ls = {},
			ts_ls = {},
			jdtls = {},
			groovyls = {},
			pyright = {},
			gopls = {
				settings = {
					cmd = { "gopls" },
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
				},
			},
			lua_ls = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			config.on_attach = on_attach
			lspconfig[server].setup(config)
		end
	end,
}
