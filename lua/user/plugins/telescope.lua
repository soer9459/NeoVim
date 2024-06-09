return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'debugloop/telescope-undo.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local ts = require('telescope')
		local ts_undo = require('telescope-undo.actions')
		local h_pct = 0.90
		local w_pct = 0.80
		local w_limit = 75
		local standard_setup = {
			borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			preview = { hide_on_startup = true },
			layout_strategy = 'vertical', -- HORIZONTAL, VERTICAL, FLEX
			layout_config = {
				vertical = {
					mirror = true,
					prompt_position = 'top',
					width = function(_, cols, _)
						return math.min( math.floor( w_pct * cols ), w_limit )
					end,
					height = function(_, _, rows)
						return math.floor( rows * h_pct )
					end,
					preview_cutoff = 10,
					preview_height = 0.4,
				},
			},
		}
		local fullscreen_setup = {
			borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			preview = { hide_on_startup = false },
			layout_strategy = 'flex', -- HORIZONTAL, VERTICAL, FLEX
			layout_config = {
				flex = { flip_columns = 100 },
				horizontal = {
					mirror = false,
					prompt_position = 'top',
					width = function(_, cols, _)
						return math.floor(cols * w_pct)
					end,
					height = function(_, _, rows)
						return math.floor(rows * h_pct)
					end,
					preview_cutoff = 10,
					preview_width = 0.5,
				},
				vertical = {
					mirror = true,
					prompt_position = 'top',
					width = function(_, cols, _)
						return math.floor(cols * w_pct)
					end,
					height = function(_, _, rows)
						return math.floor(rows * h_pct)
					end,
					preview_cutoff = 10,
					preview_height = 0.5,
				},
			},
		}
		ts.setup {
			defaults = vim.tbl_extend('error', standard_setup, {
				sorting_strategy = 'ascending',
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
						'fd', '--type', 'f', '-H', '--strip-cwd-prefix',
					}
				},
			},
			extensions = {
				undo = vim.tbl_extend('error', fullscreen_setup, {
					diff_context_lines = 4,
					preview_title = "Diff",
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
				})
			}
		}
		ts.load_extension('fzf')
		ts.load_extension('undo')
	end,
}
