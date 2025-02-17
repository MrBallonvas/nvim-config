local M = {}

function M.setup()
	local npairs = require("nvim-autopairs")
	require('nvim-autopairs.rule')

	npairs.setup({
		check_ts = true,
		ts_config = {
			lua = { 'string' }, -- it will not add a pair on that treesitter node
			javascript = { 'template_string' },
			java = false,       -- don't check treesitter on java
		}
	})
end

return M
