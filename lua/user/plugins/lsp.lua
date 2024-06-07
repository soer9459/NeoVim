return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local capabilities = vim.tbl_deep_extend( 'force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities() )
		require('mason').setup {}
		require('mason-lspconfig').setup {
			ensure_installed = { 'clangd', 'bashls', 'lua_ls', 'texlab', 'pyright', 'taplo', 'marksman', },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
					}
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "bit", "HSL", "HSL_H", "HSL_S", "HSL_L", "BackgroundColor" },
								},
							}
						}
					}
				end,
			},
		}
	end
}
