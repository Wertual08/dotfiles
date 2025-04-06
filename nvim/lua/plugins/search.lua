return {
    {'nvim-telescope/telescope-ui-select.nvim' },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = require("config.telescope"),
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("ui-select")
        end,
    },
    { "MagicDuck/grug-far.nvim", opts = require("config.grug-far") },
}
