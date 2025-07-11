return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<leader>fw", builtin.live_grep)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true
                    },
                    live_grep = {
                        additional_args = function(_)
                            return { "--hidden" }
                        end
                    }
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
