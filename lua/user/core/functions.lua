local current_buf = nil
function ToggleNetRW()
	if vim.bo.filetype ~= 'netrw' then
		current_buf = vim.api.nvim_get_current_buf()
		vim.cmd("Ex")
	else
		if current_buf then
			vim.cmd("buffer " .. current_buf)
		else
			vim.cmd("bdel")
		end
	end
end
vim.api.nvim_command('command! ToggleNetRW lua ToggleNetRW()')

function ToggleFoldcolumn()
	if vim.wo.foldcolumn ~= "0" then
		vim.wo.foldcolumn = "0"
		print("FoldColumn off")
	else
		vim.wo.foldcolumn = "auto:9"
		print("FoldColumn on")
	end
end
vim.api.nvim_command('command! ToggleFoldcolumn lua ToggleFoldcolumn()')

function ToggleLanguage()
	vim.ui.select({ 'Off', 'Danish', 'English' }, {
		prompt = 'Select language:',
		format_item = function(item)
			return item
		end,
	},
	function(choice)
		if choice == 'Off' then
			vim.o.spell = false
			vim.cmd("redrawstatus")
			print("Spelling off")
		elseif choice == 'Danish' then
			vim.api.nvim_command("set spelllang=da")
			vim.o.spell = true
			vim.cmd("redrawstatus")
			print("Language set to Danish")
		elseif choice == 'English' then
			vim.api.nvim_command("set spelllang=en")
			vim.o.spell = true
			vim.cmd("redrawstatus")
			print("Language set to English")
		else
			return
		end
	end)
end
vim.api.nvim_command('command! ToggleLanguage lua ToggleLanguage()')
