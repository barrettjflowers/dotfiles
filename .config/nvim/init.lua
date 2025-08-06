-- .config/nvim/init.lua
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"

-- plugin management
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/github/copilot.vim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/kevinhwang91/rnvimr" },
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
require "nvim-treesitter.configs".setup({
	ensure_installed = { "svelte", "typescript", "javascript" },
	highlight = { enable = true }
})
-- repalce netrw with rnvimr (ranger)
vim.g.rnvimr_enable_ex = 1
vim.g.loaded_netrw = 1

-- key mappings
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":RnvimrToggle<CR>")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- LSP configuration
local lspconfig = require "lspconfig"
lspconfig.ts_ls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})

-- styling
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
