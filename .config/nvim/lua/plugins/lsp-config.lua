return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"stylua",

				-- python
				"mypy",
				"black",
				"isort",

				-- c
				"clang-format",

				-- web dev
				"eslint_d",
				"prettier",

				-- c#
				"csharpier",

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
				"omnisharp",

				-- c
				"clangd",

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

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilites,
			})
			lspconfig.omnisharp.setup({
				cmd = { "Omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
				root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
				settings = {
					FormattingOptions = {
						EnableEditorConfigSupport = true,
					},
					Sdk = {
						IncludePrereleases = true,
					},
				},
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilites,
			})
			lspconfig.pyright.setup({
				capabilities = capabilites,
			})
			lspconfig.html.setup({
				capabilities = capabilites,
			})
			lspconfig.cssls.setup({
				capabilities = capabilites,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilites,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilites,
			})
			lspconfig.angularls.setup({
				cmd = {
					"/home/edgar/.local/share/nvim/mason/bin/ngserver",
					"--stdio",
					"--tsProbeLocations",
					"/home/edgar/dev/web/strapi-solvex/frontend/node_modules",
					"--ngProbeLocations",
					"/home/edgar/dev/web/strapi-solvex/frontend/node_modules",
				},
				on_new_config = function(new_config, new_root_dir)
					local nm = new_root_dir .. "/node_modules"
					new_config.cmd = {
						"/home/edgar/.local/share/nvim/mason/bin/ngserver",
						"--stdio",
						"--tsProbeLocations",
						nm,
						"--ngProbeLocations",
						nm,
					}
				end,
				root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
			})
			lspconfig.gdscript.setup({
				capabilities = capabilites,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
