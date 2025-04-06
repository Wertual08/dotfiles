return {
    defaults = {
        file_ignore_patterns = { "^.git$" },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        layout_config = {
            width = 0.9,
        },
    },
    pickers = {
        lsp_references = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_document_symbols = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_definitions = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_type_definitions = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        lsp_implementations = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
        diagnostics = {
            layout_strategy = 'vertical',
            initial_mode = 'normal',
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                initial_mode = 'normal',
            },
            specific_opts = {

            },
        },
    },
}
