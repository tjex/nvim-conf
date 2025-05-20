-- NOTE: Experimenting with native neovim autocomplete
-- Look there.
return {

	"hrsh7th/nvim-cmp",
	enabled = true,
	dependencies = {
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local types = require("cmp.types")


		require("cmp").setup({
			completion = {
				autocomplete = {
					false,
					types.cmp.TriggerEvent.TextChanged,
				},
				keyword_length = 3,
			},
			preselect = {
				cmp.PreselectMode.None,
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
                completion = {
                    -- border = "rounded",
                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
                },
                documentation = {
                    winhighlight = "Normal:Pmenu"
                }
			},
			performance = { max_view_entries = 20 },
			mapping = cmp.mapping.preset.insert({
				["<c-k>"] = cmp.mapping.select_prev_item(),
				["<c-j>"] = cmp.mapping.select_next_item(),
				["<c-l>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept item at top of list. Set `select` to `false` to only confirm explicitly selected items.
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "path" },
			}),

		})
	end,
}
