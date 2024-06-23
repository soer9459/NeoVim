-- TRANSFER TO VIM.SYSTEM

local function exit_handler(success, error)
	return function(_, exit_code, _)
		if exit_code == 0 then
			vim.api.nvim_echo({{success, 'DiagnosticOk'}}, true, {})
		else
			vim.api.nvim_echo({{error .. exit_code, 'DiagnosticError'}}, true, {})
		end
	end
end

function Latex(option)
	if vim.bo.filetype ~= 'tex' then
		return vim.api.nvim_echo({{'✘ Not a LaTeX document', 'DiagnosticError'}}, true, {})
	end
	local filename = vim.fn.shellescape(vim.fn.expand("%:p"))
	local output = vim.fn.shellescape(vim.fn.expand("%:p:h"))
	if option == 'compile' then
		local command = "latexmk -halt-on-error -pdf -outdir=" .. output .. " " .. filename
		vim.api.nvim_echo({{'↻ Compiling LaTeX document', 'DiagnosticWarn'}}, true, {})
		vim.fn.jobstart(command, {
			detach = true,
			on_exit = exit_handler('✔ LaTeX compilation successful!', '✘ Error compiling LaTeX document!. Exit Code: ')
		})
	elseif option == 'clean' then
		local command = "latexmk -c -outdir=" .. output .. " " .. filename
		vim.api.nvim_echo({{'Cleaning LaTeX files', 'DiagnosticWarn'}}, true, {})
		vim.fn.jobstart(command, {
			detach = true,
			on_exit = exit_handler('✔ LaTeX cleaning successful!', '✘ Error cleaning LaTeX files!. Exit Code: ')
		})
	elseif option == 'pdf' then
		local pdfname = vim.fn.shellescape(vim.fn.expand("%:p:r") .. ".pdf" )
		local command = "zathura " .. pdfname .. " &"
		vim.api.nvim_echo({{'Opening PDF', 'DiagnosticWarn'}}, true, {})
		vim.fn.jobstart(command, {
			detach = true,
			on_exit = exit_handler('✔ PDF opened!', '✘ Error opening PDF file!. Exit Code: ')
		})
	elseif option == 'sympy' then
		local input = vim.fn.input("Enter SymPy command: ")
		vim.api.nvim_command('read !python -c "from sympy import *; from sympy.abc import *; print(latex(' .. input .. '))"')
	else
		vim.api.nvim_echo({{'✘ Error: Not a valid LaTeX option', 'DiagnosticError'}}, true, {})
	end
end
