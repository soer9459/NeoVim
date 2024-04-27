-- SOMETHING WRONG WITH PATHS. File in Contract Theory Notes folder does not compile

function LatexCompile()
	local filename = vim.fn.expand("%:p")
	local output = vim.fn.expand("%:p:h")
	local command = "latexmk -pdf -outdir=" .. output .. " " .. filename
	vim.fn.system(command)
	print("Compiling LaTeX document")
end
vim.api.nvim_command('command! LatexCompile lua LatexCompile()')

function LatexClean()
	local filename = vim.fn.expand("%:p")
	local output = vim.fn.expand("%:p:h")
	local command = "latexmk -c -outdir=" .. output .. " " .. filename
	vim.fn.system(command)
	print("Cleaning LaTeX files")
end
vim.api.nvim_command('command! LatexClean lua LatexClean()')

function LatexCompileClean()
	LatexCompile()
	LatexClean()
end
vim.api.nvim_command('command! LatexCompileClean lua LatexCompileClean()')

function LatexView()
	local filename = vim.fn.expand("%:p:r")
	local command = "zathura " .. filename .. ".pdf &"
	vim.fn.system(command)
	print("Opening PDF")
end
vim.api.nvim_command('command! LatexView lua LatexView()')
