return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		local cmp = require('cmp')
		cmp.setup {
			experimental = {
				ghost_text = false,
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end
			},
			completion = { completeopt = 'menu, menuone, noinsert, noselect' },
			mapping = cmp.mapping.preset.insert {
				['<C-k>'] = cmp.mapping.confirm({ select = true }),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<C-e>'] = function()
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end,
			},
			sources = {
				{ name = 'luasnip' },
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lua' },
				{ name = 'buffer', keyword_length=3, },
				{ name = 'path' },
			},
			formatting = {
				format = function(entry, vim_item)
					local abbrev = {
						buffer = "BUF",
						nvim_lsp = "LSP",
						nvim_lua = "NVIM",
						path = "PATH",
						luasnip = "SNIP",
						cmdline = "CMD",
					}
					vim_item.menu = "[" .. abbrev[entry.source.name] .. "]"
					return vim_item
				end
			}
		}
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			completion = { autocomplete = false, },
			sources = {
				{ name = 'cmdline' },
			},
		})
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			completion = { autocomplete = false, },
			sources = {
				{ name = 'buffer' },
			},
		})
	end
}
