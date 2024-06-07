HarpoonBuffers = {}

vim.api.nvim_command('command! -nargs=1 HarpoonDefine lua HarpoonDefine(<f-args>)')
vim.api.nvim_command('command! -nargs=1 HarpoonSwitch lua HarpoonSwitch(<f-args>)')
vim.api.nvim_command('command! -nargs=1 HarpoonDelete lua HarpoonDelete(<f-args>)')
vim.api.nvim_command('command! HarpoonPrint lua HarpoonPrint()')
vim.api.nvim_command('command! HarpoonDeleteAll lua HarpoonDeleteAll()')

function HarpoonSet(harpoon)
	for key, value in pairs(HarpoonBuffers) do
		if value == vim.fn.bufnr() then
			HarpoonBuffers[key] = nil
		end
	end
	HarpoonBuffers[harpoon] = vim.fn.bufnr()
	vim.api.nvim_command("redrawstatus")
end

function HarpoonDefine(harpoon)
	if HarpoonBuffers[harpoon] == nil then
		HarpoonSet(harpoon)
	else
		local response = vim.fn.input("Harpoon " .. harpoon .. " already set ("
			.. vim.fn.bufname(HarpoonBuffers[harpoon]) .. "). Continue? [y]: ")
		if response == "y" then
			HarpoonSet(harpoon)
		else
			print(" - Aborted")
		end
	end
end

function HarpoonSwitch(harpoon)
	if HarpoonBuffers[harpoon] == nil then
		print("Harpoon " .. harpoon .. " not set")
	else
		vim.api.nvim_command("buffer " .. HarpoonBuffers[harpoon])
	end
end

function HarpoonDelete(harpoon)
	if HarpoonBuffers[harpoon] == nil then
		print("Harpoon " .. harpoon .. " not set")
	else
		HarpoonBuffers[harpoon] = nil
		vim.api.nvim_command('redrawstatus')
	end
end

function HarpoonDeleteAll()
	local response = vim.fn.input("Delete all Harpoons? [y]: ")
	if response == "y" then
		HarpoonBuffers = {}
	else
		print(" - Aborted")
	end
end

function HarpoonPrint()
	print("Harpoons: \n\n")
	for key, value in pairs(HarpoonBuffers) do
		print("Harpoon " .. key .. " - " .. vim.fn.bufname(value))
	end
end
