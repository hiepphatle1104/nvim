return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				go = { "gofumpt", "goimports" },
				json = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				groovy = { "groovyls" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>fm", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { desc = "Format code" })
	end,
}
