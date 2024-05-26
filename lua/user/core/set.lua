vim.g.tex_flavor = 'latex'
vim.g.python_recommended_style = false

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = false,
	underline = true,
})

vim.opt.inccommand = "split"

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.signcolumn = 'number'
vim.opt.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.termguicolors = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.breakindentopt = "shift:2" --Indents the wrapped line a further 1 space
vim.opt.showbreak = "↪ "
vim.opt.list = true
vim.opt.listchars = {tab = '│ ', lead = '·', trail = '·', precedes = '«', extends = '»'}
vim.opt.fillchars = {eob = ' '}
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.showmode = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = false

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
