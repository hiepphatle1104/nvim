return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"black",
					"isort",
					"prettierd",
					"prettier",
					"gofumpt",
					"goimports",
				},
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "ts_ls", "jdtls", "groovyls", "pyright" },
				automatic_installation = true,
			})
		end,
	},
}
