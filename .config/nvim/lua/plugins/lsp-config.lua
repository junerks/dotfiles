return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"stylua",

				-- c#
				"csharpier",

				-- python
				"mypy",
				"black",
				"isort",

				-- c
				"clang-format",
				"cmakelang",

				-- web dev
				"eslint_d",
				"prettier",

				-- gdscript
				"gdtoolkit",
			},
		},

		config = function(_, opts)
			local mason_registry = require("mason-registry")
			local mason = require("mason")
			mason.setup(opts)

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})

			-- Check if all tools are installed
			local missing = {}
			for _, tool in ipairs(opts.ensure_installed) do
				local ok, pkg = pcall(mason_registry.get_package, tool)
				if ok and not pkg:is_installed() then
					table.insert(missing, tool)
				end
			end

			if #missing > 0 then
				vim.cmd("MasonInstall " .. table.concat(missing, " "))
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"lua_ls",

				-- c#
				"csharp_ls",

				-- c
				"clangd",
				"neocmake",

				-- python
				"pyright",
				"ruff",

				-- web dev
				"html",
				"cssls",
				"ts_ls",
				"angularls",

				-- json
				"jsonls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.enable("lua_ls")

			vim.lsp.enable("csharp_ls")

			vim.lsp.enable("clangd")
			vim.lsp.enable("neocmake")

			vim.lsp.enable("pyright")

			vim.lsp.enable("html")

			vim.lsp.enable("cssls")

			vim.lsp.enable("ts_ls")

			vim.lsp.enable("jsonls")

			vim.lsp.enable("angularls")

			vim.lsp.enable("gdscript")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
