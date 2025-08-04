-- nvim config file
vim.opt.compatible = false         -- Disable compatibility to old-time vi
vim.opt.showmatch = true           -- Show matching
vim.opt.ignorecase = true          -- Case insensitive
vim.opt.mouse = "v"                -- Middle-click paste with
vim.opt.hlsearch = true            -- Highlight search
vim.opt.incsearch = true           -- Incremental search
vim.opt.tabstop = 4                -- Number of columns occupied by a tab
vim.opt.softtabstop = 4            -- See multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true           -- Converts tabs to white space
vim.opt.shiftwidth = 4             -- Width for auto-indents
vim.opt.autoindent = true          -- Indent a new line the same amount as the line just typed
vim.opt.relativenumber = true      -- Add line numbers
vim.opt.wildmode = "longest,list"  -- Get bash-like tab completions
-- vim.opt.colorcolumn = "80"      -- Set an 80 column border for good coding style
-- vim.opt.mouse = "a"             -- Enable mouse click
vim.cmd("filetype plugin indent on") -- Allow auto-indenting depending on file type
vim.cmd("syntax on")               -- Syntax highlighting
vim.opt.cursorline = true          -- Highlight current cursor line
vim.opt.ttyfast = true             -- Speed up scrolling in Vim
vim.opt.splitbelow = true          -- Split windows below
vim.opt.splitright = true          -- Split windows to the right

vim.opt.termguicolors = true       -- Enable 256 colors
vim.opt.background = "dark"        -- Set background for better colors

-- Transparent background
vim.api.nvim_create_augroup("TransparentBackground", {})
vim.api.nvim_create_autocmd("ColorScheme", {
    group = "TransparentBackground",
    pattern = "*",
    command = "highlight Normal ctermbg=none guibg=none"
})
vim.api.nvim_create_autocmd("ColorScheme", {
    group = "TransparentBackground",
    pattern = "*",
    command = "highlight NonText ctermbg=none guibg=none"
})

vim.cmd("highlight Normal ctermbg=none guibg=none")
vim.cmd("highlight NonText ctermbg=none guibg=none")

-- Theme
vim.cmd("colorscheme retrobox")
vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=darkgrey")

-- Optional settings (commented out in the original file)
-- vim.opt.spell = true           -- Enable spell check (may need to download language package)
-- vim.opt.swapfile = false       -- Disable creating swap file
-- vim.opt.backupdir = "~/.cache/vim" -- Directory to store backup files
