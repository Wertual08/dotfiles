vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            imports = {
            granularity = {
                group = "item",
            },
            group = {
                enable = false,
            },
            prefix = "self",
            },
        }
    }
})
