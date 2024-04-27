return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "markdown", "markdown_inline", "latex", "r" },
			ignore_install = {},
			sync_install = false,
			auto_install = true,
			modules = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
