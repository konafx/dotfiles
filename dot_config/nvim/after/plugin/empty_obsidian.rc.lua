local local_config = vim.fn.stdpath('config') .. "/local/obsidian.lua"
if vim.fn.filereadable(local_config) == 1 then
	dofile(local_config)
	-- Sample:
	-- ```
	-- require('obsidian').setup({
	-- 	workspaces = {
	-- 		{
	-- 			name = "hoge",
	-- 			path = "/path/to/hoge",
	-- 		}
	-- 	}
	-- })
	-- ```
end
