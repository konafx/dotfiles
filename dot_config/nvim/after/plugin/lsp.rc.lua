local ok, _ = pcall(require, 'mason')
if not ok then
	print('mason is not installed')
	return
end

-- https://scrapbox.io/vim-jp/better_K_for_neovim_lua
local function lua_help()
	if vim.bo.filetype ~= 'lua' then
		return false
	end
	local current_line = vim.api.nvim_get_current_line()
	local cursor_col = vim.api.nvim_win_get_cursor(0)[2] + 1
	-- vim.fn.foo
	local s, e, m = current_line:find([[fn%.([%w_]+)%(?]])
	if s and s <= cursor_col and cursor_col <= e then
		vim.cmd('h ' .. m)
		return true
	end
	-- vim.fn['foo']
	s, e, m = current_line:find([[fn%[['"]([%w_#]+)['"]%]%(?]])
	if s and s <= cursor_col and cursor_col <= e then
		vim.cmd('h ' .. m)
		return true
	end
	-- vim.api.foo
	s, e, m = current_line:find([[api%.([%w_]+)%(?]])
	if s and s <= cursor_col and cursor_col <= e then
		vim.cmd('h ' .. m)
		return true
	end
	-- other vim.foo (e.g. vim.tbl_map, vim.lsp.foo, ...)
	s, e, m = current_line:find([[(vim%.[%w_%.]+)%(?]])
	if s and s <= cursor_col and cursor_col <= e then
		vim.cmd('h ' .. m)
		return true
	end
	return false
end

-- Mappings. {{{
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--- }}}

-- AuthCmd: LspAttach {{{
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('mylspconfig', {}),
	callback = function(args)
		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufnr = args.bufnr
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set('n', '][', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', bufopts)
		vim.keymap.set('n', ']]', '<Cmd>Lspsaga diagnostic_jump_next<CR>', bufopts)
		vim.keymap.set('n', ']e', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', bufopts)

		-- Definitions
		vim.keymap.set('n', ']d', '<Cmd>Lspsaga peek_definition<CR>', bufopts)
		--vim.keymap.set('n', ']d', '<Cmd>Lspsaga peek_definition<CR>', bufopts)
		vim.keymap.set('n', ']D', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', ']<C-d>', vim.lsp.buf.definition, bufopts)

		-- Implementations
		vim.keymap.set('n', ']i', '<Cmd>Lspsaga finder imp<CR>', bufopts)
		vim.keymap.set('n', ']I', vim.lsp.buf.implementation, bufopts)

		vim.keymap.set('n', ']f', '<Cmd>Lspsaga finder<CR>', bufopts)

		vim.keymap.set('n', 'K', function() -- https://scrapbox.io/vim-jp/better_K_for_neovim_lua
			if not lua_help() then
				require('lspsaga.hover'):render_hover_doc()
				-- vim.lsp.buf.hover()
			end
		end, bufopts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
		-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
		-- vim.keymap.set('n', '<space>wl', function()
		--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, bufopts)
		-- vim.keymap.set('n', ']tD', vim.lsp.buf.type_definition, bufopts)
		-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', ']r', '<Cmd>Lspsaga rename<CR>', bufopts)
		-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', ']c', '<Cmd>Lspsaga code_action<CR>', bufopts)
		-- vim.keymap.set('n', ']r', vim.lsp.buf.references, bufopts)
		-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
		vim.keymap.set('n', ']F', function()
			vim.lsp.buf.format { async = true }
		end, bufopts)

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		-- ocal client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		-- if not client:supports_method('textDocument/willSaveWaitUntil')
		--     and client:supports_method('textDocument/formatting') then
		--   vim.api.nvim_create_autocmd('BufWritePre', {
		--     group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
		--     buffer = args.buf,
		--     callback = function()
		--       vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
		--     end,
		--   })
		-- end
	end,
})
-- }}}

-- Capacibilites {{{
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers...
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
	print('cmp-nvim-lsp is not installed')
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
-- }}}

-- mason lspconfig {{{
local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
	print('mson-lspconfig is not installed')
	return
end

mason_lspconfig.setup {
	ensure_installed = {
		'lua_ls',
		'vtsls',
	},
	automatic_installation = true,
}
-- }}}
