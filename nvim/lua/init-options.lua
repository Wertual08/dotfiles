vim.opt.foldlevelstart = 99
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

vim.g.clipboard   = 'osc52'

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

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

