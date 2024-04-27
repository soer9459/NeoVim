return {
	'L3MON4D3/LuaSnip',
	version = 'v2.*',
	config = function()
		local ls = require('luasnip')
		local ps = ls.parser.parse_snippet
		ls.config.set_config {
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true
		}
		-- KEYMAPS
		vim.keymap.set({'i', 's'}, '<C-L>', function() ls.jump( 1) end, {silent = true})
		vim.keymap.set({'i', 's'}, '<C-J>', function() ls.jump(-1) end, {silent = true})
		-- SNIPPETS
		ls.add_snippets('tex', {
			ps('**', '^{ $1 }'),
			ps('_', '_{ $1 }'),
			ps('*', '\\cdot '),
			ps('frac', '\\frac{ $1 }{ $2 }'),
			ps('dif', '\\frac{\\partial $1}{\\partial $2}'),
			ps('sec', '\\section{$1}'),
			ps('ssec', '\\subsection{$1}'),
			ps('sssec', '\\subsubsection{$1}'),
			ps('nsec', '\\section*{$1}'),
			ps('nssec', '\\subsection*{$1}'),
			ps('nsssec', '\\subsubsection*{$1}'),
			ps('lab', '\\label{$1}'),
			ps('ref', '\\ref{$1}'),
			ps('eqref', '\\eqref{$1}'),
			ps('eq', '\\begin{equation}\n\t$1\n\\end{equation}'),
		})
	end
}
