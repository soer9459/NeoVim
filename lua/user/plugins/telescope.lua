return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-file-browser.nvim',
		'debugloop/telescope-undo.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local ts = require('telescope')
		local ts_undo = require('telescope-undo.actions')
		local h_percentage = 0.85
		local w_percentage = 0.85
		local w_limit = 80
		--vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
		local standard_setup = {
			borderchars = {
				--           N    E    S    W   NW   NE   SE   SW
				prompt =  { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
				results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
				preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			},
			preview = { hide_on_startup = true },
			layout_strategy = 'vertical', -- HORIZONTAL, VERTICAL, FLEX
			layout_config = {
				vertical = {
					mirror = true,
					prompt_position = 'top',
					width = function(_, cols, _)
						return math.min( math.floor( w_percentage * cols ), w_limit )
					end,
					height = function(_, _, rows)
						return math.floor( rows * h_percentage )
					end,
					preview_cutoff = 10,
					preview_height = 0.4,
				},
			},
		}
		local fullscreen_setup = {
			borderchars = {
				--           N    E    S    W   NW   NE   SE   SW
				prompt =  { ' ', ' ', '─', ' ', ' ', ' ', ' ', ' ' },
				results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
				preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			},
			preview = { hide_on_startup = false },
			layout_strategy = 'flex', -- HORIZONTAL, VERTICAL, FLEX
			layout_config = {
				flex = { flip_columns = 100 },
				horizontal = {
					mirror = false,
					prompt_position = 'top',
					width = function(_, cols, _)
						return cols
					end,
					height = function(_, _, rows)
						return rows
					end,
					preview_cutoff = 10,
					preview_width = 0.5,
				},
				vertical = {
					mirror = true,
					prompt_position = 'top',
					width = function(_, cols, _)
						return cols
					end,
					height = function(_, _, rows)
						return rows
					end,
					preview_cutoff = 10,
					preview_height = 0.4,
				},
			},
		}
		ts.setup {
			defaults = vim.tbl_extend('error', standard_setup, {
				results_title = '',
				sorting_strategy = 'ascending',
				border = { prompt = { 1, 1, 1, 1 }, results = { 1, 1, 1, 1 }, preview = { 1, 1, 1, 1 }, },
				path_display = { "filename_first" }, -- trunctate or filename_first
				mappings = {
					n = {
						['o'] = require('telescope.actions.layout').toggle_preview,
						['<C-c>'] = require('telescope.actions').close,
					},
					i = {
						['<C-o>'] = require('telescope.actions.layout').toggle_preview,
					},
				},
			}),
			pickers = {
				find_files = {
					find_command = {
						'fd',
						'--type',
						'f',
						'-H',
						'--strip-cwd-prefix',
					}
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true,
					initial_mode = 'insert',
					hide_parent_dir = false,
					hidden = {
						file_browser = false,
						folder_browser = false,
					},
					display_stat = { },
					mappings = {
						n = {
							['-'] = ts.extensions.file_browser.actions.goto_parent_dir,
							['<BS>'] = ts.extensions.file_browser.actions.goto_parent_dir,
							-- KEYBIND TO OPEN MULTI SELECTED FILES
						},
						i = {
							--['<C-d>'] = ts.extensions.file_browser.actions.remove, -- Find another mappning, since C-d is down in preview
							['<C-y>'] = ts.extensions.file_browser.actions.copy,
							['<C-r>'] = ts.extensions.file_browser.actions.rename,
							--['<C-m>'] = ts.extensions.file_browser.actions.move, -- Find another mapping, since C-m is CR
						},
					}
				},
				undo = {
					preview_title = "Difference",
					preview = { hide_on_startup = false },
					mappings = {
						i = {
							['<cr>'] = ts_undo.restore,
							['<C-cr>'] = ts_undo.restore,
							['<C-y>d'] = ts_undo.yank_deletions,
							['<C-y>a'] = ts_undo.yank_additions,
						},
						n = {
							['<cr>'] = ts_undo.restore,
							['ya'] = ts_undo.yank_additions,
							['yd'] = ts_undo.yank_deletions,
						},
					},
				}
			}
		}
		ts.load_extension('file_browser')
		ts.load_extension('fzf')
		ts.load_extension('undo')
	end,
}
