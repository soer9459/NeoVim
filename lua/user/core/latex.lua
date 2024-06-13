function LatexCompile()
	if vim.bo.filetype ~= 'tex' then
		return vim.api.nvim_echo({{'✘ Not a LaTeX document', 'DiagnosticError'}}, true, {})
	end
	local filename = vim.fn.shellescape(vim.fn.expand("%:p"))
	local output = vim.fn.shellescape(vim.fn.expand("%:p:h"))
	local command = "latexmk -halt-on-error -pdf -outdir=" .. output .. " " .. filename
	vim.api.nvim_echo({{'↻ Compiling LaTeX document', 'DiagnosticWarn'}}, true, {})
	vim.fn.jobstart(command, {
		detach = true,
		on_exit = function(_, exit_code, _)
			if exit_code == 0 then
				vim.api.nvim_echo({{'✔ LaTeX compilation successful!', 'DiagnosticOk'}}, true, {})
			else
				vim.api.nvim_echo({{'✘ Error compiling LaTeX document!. Exit Code: ' .. exit_code, 'DiagnosticError'}}, true, {})
			end
		end
	})
end

function LatexClean()
	if vim.bo.filetype ~= 'tex' then
		return vim.api.nvim_echo({{'✘ Not a LaTeX document', 'DiagnosticError'}}, true, {})
	end
	local filename = vim.fn.shellescape(vim.fn.expand("%:p"))
	local output = vim.fn.shellescape(vim.fn.expand("%:p:h"))
	local command = "latexmk -c -outdir=" .. output .. " " .. filename
	vim.api.nvim_echo({{'Cleaning LaTeX files', 'DiagnosticWarn'}}, true, {})
	vim.fn.jobstart(command, {
		detach = true,
		on_exit = function(_, exit_code, _)
			if exit_code == 0 then
				vim.api.nvim_echo({{'✔ LaTeX cleaning successful!', 'DiagnosticOk'}}, true, {})
			else
				vim.api.nvim_echo({{'✘ Error cleaning LaTeX files!. Exit Code: ' .. exit_code, 'DiagnosticError'}}, true, {})
			end
		end
	})
end

function LatexView()
	if vim.bo.filetype ~= 'tex' then
		return vim.api.nvim_echo({{'✘ Not a LaTeX document', 'DiagnosticError'}}, true, {})
	end
	local filename = vim.fn.shellescape(vim.fn.expand("%:p:r") .. ".pdf" )
	local command = "zathura " .. filename .. " &"
	vim.api.nvim_echo({{'Opening PDF', 'DiagnosticWarn'}}, true, {})
	vim.fn.jobstart(command, {
		detach = true,
		on_exit = function(_, exit_code, _)
			if exit_code == 0 then
				vim.api.nvim_echo({{'✔ PDF opened!', 'DiagnosticOk'}}, true, {})
			else
				vim.api.nvim_echo({{'✘ Error opening PDF file!. Exit Code: ' .. exit_code, 'DiagnosticError'}}, true, {})
			end
		end
	})
end

function SymPy()
	if vim.bo.filetype ~= 'tex' then
		return vim.api.nvim_echo({{'✘ Not a LaTeX document', 'DiagnosticError'}}, true, {})
	end
	local input = vim.fn.input("Enter SymPy command: ")
	vim.api.nvim_command('read !python -c "from sympy import *; from sympy.abc import *; print(latex(' .. input .. '))"')
end
