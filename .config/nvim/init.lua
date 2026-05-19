 -- ~/.config/nvim/init.lua
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = ""
vim.opt.mouse = ""

-- blinking cursor
vim.opt.guicursor =
  "n-v-c:block," ..
  "i-ci-ve:ver25-blinkwait175-blinkoff150-blinkon175," ..
  "r-cr:hor20," ..
  "o:hor50"

-- plugins
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/stevearc/oil.nvim" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },

	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/Exafunction/windsurf.nvim"},
	{ src = "https://github.com/nvim-lua/plenary.nvim"},
	{ src = "https://github.com/hrsh7th/nvim-cmp"},
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp"},
})

-- LSP init
local lspconfig = require "lspconfig"
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({ capabilities = cmp_capabilities })
lspconfig.rust_analyzer.setup({ capabilities = cmp_capabilities })
lspconfig.ts_ls.setup({ capabilities = cmp_capabilities })
lspconfig.html.setup({ capabilities = cmp_capabilities })
lspconfig.svelte.setup({ capabilities = cmp_capabilities })

-- init plugins
require "mini.pick".setup()
require "mason".setup()
require "oil".setup()
require "codeium".setup({
  virtual_text = {
    enabled = true,
  }
})

require "nvim-treesitter.configs".setup({
	ensure_installed = { "svelte", "typescript", "javascript" },
	highlight = { enable = true }
})

-- maps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>g', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>0", ':set nonumber<CR> :set norelativenumber<CR> :lua vim.diagnostic.config({ signs = false })<CR>')

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
local cmp = require("cmp")

-- styling
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
