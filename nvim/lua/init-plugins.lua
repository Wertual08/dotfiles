require("plugins.vscode-nvim")
require("plugins.alpha-nvim")

require("lualine").setup(require("plugins.lualine"))
require("lsp-progress").setup()
require("bufferline").setup(require("plugins.bufferline"))

require("nvim-tree").setup(require("plugins.nvim-tree"))
require("plugins.telescope")
require("toggleterm").setup(require("plugins.toggleterm"))

require("plugins.nvim-treesitter")

require("mason").setup()
require("mason-lspconfig").setup()

require("plugins.blink-cmp")

--require("dap").setup(require("plugins.nvim-dap"))
require("plugins.grug-far")

require("plugins.kulala-nvim")
