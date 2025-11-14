vim.lsp.enable('clangd')

vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.scrolloff = 4
vim.opt.cmdheight = 3
vim.opt.number = true
vim.opt.completeopt = {"menuone", "noselect", "popup"}
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = ' '

vim.cmd("filetype on")
vim.cmd("filetype plugin indent on")
vim.cmd("set iskeyword-=_")

vim.pack.add({
	{
		src = 'https://github.com/nvim-lua/plenary.nvim',
		version = 'master'
	},
	{
		src = 'https://github.com/nvim-telescope/telescope.nvim',
		version = '0.1.x'
	}
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

