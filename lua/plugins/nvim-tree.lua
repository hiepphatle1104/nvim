return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	-- TODO: hello
	config = function()
		require("nvim-tree").setup({
			renderer = {
				root_folder_label = false,
			},

			diagnostics = {
				enable = true,
				icons = {
					error = "✘",
					warning = "",
					hint = "",
					info = "",
				},
			},
			filters = {
				dotfiles = true,
				custom = {
					"^\\.git$",
					"^node_modules$",
				},
				exclude = {
					".gitignore",
				},
			},

			ui = {
				confirm = {
					default_yes = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Open Explorer" })
	end,
}
