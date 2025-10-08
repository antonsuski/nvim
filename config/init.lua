vim.lsp.enable('clangd')

vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.scrolloff = 4
vim.opt.cmdheight = 3
vim.opt.number = true
vim.opt.completeopt = {"menuone", "noselect", "popup"}

vim.cmd("filetype on")
vim.cmd("filetype plugin indent on")
vim.cmd("set iskeyword-=_")

