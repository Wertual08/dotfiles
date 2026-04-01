require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'lua', 'c', 'md' },
	callback = function(ev)
        if vim.api.nvim_buf_line_count(ev.buf) > 100000 then
            return
        end

		vim.treesitter.start()

		vim.bo.syntax = 'ON'
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo.foldmethod = 'expr'
	end,
})
