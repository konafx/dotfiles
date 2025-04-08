local ok, wk = pcall(require, 'which-key')
if not ok then
	print('which-key is not installed')
end

-- [lsp]を押しても表示されない. :WhichKey [lsp]には登録されている
wk.add({
	mode = {"n"},
	{ "[lsp]<C-d>", desc = "vim.lsp.buf.definition" },
	{ "[lsp][", desc = "<Cmd>Lspsaga diagnostic_jump_prev<CR>" },
	{ "[lsp]]", desc = "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
	{ "[lsp]e", desc = "<Cmd>Lspsaga show_cursor_diagnostics<CR>" },
	{ "[lsp]d", desc = "<Cmd>Lspsaga peek_definition<CR>" },
	{ "[lsp]f", desc = "<Cmd>Lspsaga lsp_finder<CR>" },
	{ "[lsp]D", desc = "Declaration" },
	{ "[lsp]F", desc = "Format" },
	{ "[lsp]i", desc = "Implementation" },
})
