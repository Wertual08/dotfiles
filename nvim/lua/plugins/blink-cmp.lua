local completion = {
    list = {
        selection = { preselect = false, auto_insert = true },
    },
    menu = {
        auto_show = true,
    },
    --documentation = {
    --    auto_show = true,
    --},
    ghost_text = {
        enabled = true,
    },
}

require("blink.cmp").setup({
    keymap = {
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-space>'] = { 'show', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<Right>'] = { 'select_next', 'fallback' },
      ['<Left>'] = { 'select_prev', 'fallback' },
      ['<C-y>'] = { 'select_and_accept', 'fallback' },
      ['<C-e>'] = { 'cancel', 'fallback' },
    },

    completion = completion,
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
