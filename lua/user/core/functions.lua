function GetHSLFromHEX()
	local color = vim.fn.expand('<cword>')
	local hexPattern = "^%x%x%x%x%x%x$"
	if string.match(color, hexPattern) then
        print("Hue: " .. HSL_H('#' .. color) .. " - Saturation: " .. HSL_S('#' .. color) .. " - Lightness: " .. HSL_L("#" .. color))
    else
		print("Not a hex color code")
    end
end

function ToggleFoldcolumn()
	if vim.wo.foldcolumn ~= "0" then
		vim.wo.foldcolumn = "0"
		print("FoldColumn off")
	else
		vim.wo.foldcolumn = "auto:9"
		print("FoldColumn on")
	end
end

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
			vim.api.nvim_command("redrawstatus")
			print("Spelling off")
		elseif choice == 'Danish' then
			vim.api.nvim_command("set spelllang=da")
			vim.o.spell = true
			vim.api.nvim_command("redrawstatus")
			print("Language set to Danish")
		elseif choice == 'English' then
			vim.api.nvim_command("set spelllang=en")
			vim.o.spell = true
			vim.api.nvim_command("redrawstatus")
			print("Language set to English")
		else
			return
		end
	end)
end
