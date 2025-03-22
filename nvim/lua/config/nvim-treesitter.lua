return {
    --ensure_installed = "all",
    sync_install = false,

    highlight = {
        enable = true,
        disable = function(_, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 100000
        end
    },
}
