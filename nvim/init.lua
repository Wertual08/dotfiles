require("lazy-bootstrap")
require("lsp-bootstrap")

vim.opt.tabstop     = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smarttab    = true
vim.opt.rnu         = true
vim.opt.nu          = true
vim.opt.splitright  = true
vim.opt.autoread    = true
vim.opt.lazyredraw  = true
vim.opt.scrolloff   = 10

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

vim.keymap.set('n', '<space>t', '<Cmd>ToggleTerm<CR>', { silent = true })
vim.keymap.set('n', ',', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '.', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<C-,>', '<Cmd>BufferLineMovePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-.>', '<Cmd>BufferLineMoveNext<CR>', { silent = true })

vim.keymap.set('n', '<Space>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<Space>fg', function()
    require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })
end, {})
vim.keymap.set('n', '<Space>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<Space>fh', require('telescope.builtin').help_tags, {})
vim.keymap.set('n', '<Space>fvc', require('telescope.builtin').git_commits, {})
vim.keymap.set('n', '<Space>fvb', require('telescope.builtin').git_branches, {})
vim.keymap.set('n', '<Space>fvs', require('telescope.builtin').git_status, {})

vim.keymap.set('n', '<space>v', require("nvim-tree.api").tree.toggle, {})

vim.keymap.set('n', 'gO', function()
    require("telescope.builtin").lsp_document_symbols({
        reuse_win = true,
    })
end, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', function()
    require("telescope.builtin").lsp_definitions({
        reuse_win = true,
    })
end, { noremap = true, silent = true })
vim.keymap.set('n', 'gD', function()
    require("telescope.builtin").lsp_type_definitions({
        reuse_win = true,
    })
end, { noremap = true, silent = true })
vim.keymap.set('n', 'gri', function()
    require('telescope.builtin').lsp_implementations({
        reuse_win = true,
    })
end, { noremap = true, silent = true })
vim.keymap.set('n', 'grr', function()
    require('telescope.builtin').lsp_references({
        reuse_win = true,
    })
end, { noremap = true, silent = true })
vim.keymap.set('n', 'grd', function()
    require('telescope.builtin').diagnostics({
        reuse_win = true,
    })
end, { noremap = true, silent = true })


vim.keymap.set('n',        '[d',           function() vim.diagnostic.jump({ count = -1, float = true }) end, { noremap = true, silent = true })
vim.keymap.set('n',        ']d',           function() vim.diagnostic.jump({ count = 1, float = true }) end, { noremap = true, silent = true })
vim.keymap.set('n',        '<space>d',     function() vim.diagnostic.open_float() end, { noremap = true, silent = true })
vim.keymap.set('n',        '<space>rn',    function() vim.lsp.buf.rename() end, { noremap = true, silent = true })
vim.keymap.set('n',        'K',            vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n',        '<C-k>',        vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set('n',        'gD',           vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set('n',        '<space>wa',    vim.lsp.buf.add_workspace_folder, { noremap = true, silent = true })
vim.keymap.set('n',        '<space>wr',    vim.lsp.buf.remove_workspace_folder, { noremap = true, silent = true })
vim.keymap.set('n',        '<space>wl',    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { noremap = true, silent = true })
vim.keymap.set('n',        '<space><C-f>', function() vim.lsp.buf.format { async = true } end, { noremap = true, silent = true })

vim.diagnostic.config {
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰞂",
        },
    },
}
