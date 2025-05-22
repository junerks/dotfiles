return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},

	build = ":TSUpdate",
	config = function()
		require("treesitter-context").setup()

		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = false },
		})
	end,
}
