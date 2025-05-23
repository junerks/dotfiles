return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                -- C/C++
                null_ls.builtins.formatting.clang_format,

                -- Web
                null_ls.builtins.formatting.prettier,
            },
        })
    end,
}
