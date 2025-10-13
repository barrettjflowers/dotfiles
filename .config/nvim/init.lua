-- ~/.config/nvim/init.lua
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = ""
vim.opt.mouse = ""

-- plugin management
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/github/copilot.vim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

-- init plugins
require "mini.pick".setup()
require"mason".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "svelte", "typescript", "javascript" },
	highlight = { enable = true }
})

-- key maps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>g', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('i', '<C-Space>', vim.lsp.buf.completion, { noremap = true, silent = true })

-- tab sizes
vim.keymap.set("n", "<leader>2", ":set tabstop=2 shiftwidth=2 softtabstop=2<CR>")
vim.keymap.set("n", "<leader>4", ":set tabstop=4 shiftwidth=4 softtabstop=4<CR>")

-- LSP configuration
local lspconfig = require "lspconfig"
lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.eslint.setup({})
lspconfig.ts_ls.setup({})

-- styling
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
