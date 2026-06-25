return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},

	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.diagnostics.mypy,

				require("none-ls.diagnostics.ruff").with({
					extra_args = { "--no-config" },
				}),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				-- C/C++
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.cmake_format,
				null_ls.builtins.diagnostics.cmake_lint,

				-- Web
				require("none-ls.code_actions.eslint_d"),
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "css", "javascript", "typescript", "json" },
					extra_args = { "--tab-width", "2" },
				}),

				-- Godot
				null_ls.builtins.diagnostics.gdlint,
				null_ls.builtins.formatting.gdformat,
			},
		})
	end,
}
