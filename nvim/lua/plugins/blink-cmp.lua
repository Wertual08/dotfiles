local completion = {
    list = {
        selection = {
            preselect = false,
            auto_insert = true,
        },
    },
    menu = {
        auto_show = true,
    },
    documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
    },
    ghost_text = {
        enabled = true,
    },
}

require("blink.cmp").setup({
    keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Enter>'] = {
            function(cmp)
                if cmp.get_selected_item_idx() == nil then
                    return false
                end

                return cmp.select_and_accept()
            end,
            'fallback',
        },
        ['<Escape>'] = {
            function(cmp)
                if cmp.get_selected_item_idx() == nil then
                    return false
                end

                return cmp.cancel()
            end,
            'fallback',
        },
    },

    completion = completion,

    fuzzy = {
        prebuilt_binaries = {
            download = true,
            force_version = 'v*',
        },
    },

    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
        },
    },

    cmdline = {
        enabled = true,
        keymap = {
            preset = "inherit",
        },
        completion = completion,
    },
})
