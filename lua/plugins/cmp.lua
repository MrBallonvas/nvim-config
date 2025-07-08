return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
				'saadparwaiz1/cmp_luasnip',
    },
    opts = function()
        local cmp = require('cmp')

        return {
						snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert(),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
								{ name = 'luasnip' },
            }, {
                { name = 'buffer' },
            }, {
                { name = 'path' },
            }),
						sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    --cmp.config.compare.scopes,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    --cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        }
    end,
}
