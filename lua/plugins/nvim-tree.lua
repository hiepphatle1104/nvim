return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				highlight_opened_files = "name",
				root_folder_label = false,
			},
		})

		vim.keymap.set(
			"n",
			"<leader>e",
			":NvimTreeToggle<CR>",
			{ noremap = true, silent = true },
			{ desc = "Open Explorer" }
		)
	end,
}
