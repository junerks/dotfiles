return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			default_integrations = false,
			transparent_background = true,
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = {},
				strings = { "italic" },
			},
			integrations = {
				mason = true,
				treesitter = true,
				cmp = true,
				alpha = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				gitsigns = true,
				dap = true,
				dap_ui = true,
				native_lsp = {
					enabled = false,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
