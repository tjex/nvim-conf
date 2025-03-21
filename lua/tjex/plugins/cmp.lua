return {

	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local types = require("cmp.types")
		local lspkind = require("lspkind")
		require("cmp").setup({
			completion = {
                -- with this setup, I initiate completion and can keep typing
                -- to filter results.
				autocomplete = {
					false,
					-- types.cmp.TriggerEvent.TextChanged,
				},
				keyword_length = 1,
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				documentation = require("cmp").config.disable, -- disable docs popup
				completion = require("cmp").config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			performance = { max_view_entries = 5 },
			mapping = cmp.mapping.preset.insert({
				["<c-k>"] = cmp.mapping.select_prev_item(),
				["<c-j>"] = cmp.mapping.select_next_item(),
				["<c-l>"] = cmp.mapping.complete(),
				["<c-i>"] = cmp.mapping.confirm({ select = true }), -- Accept item at top of list. Set `select` to `false` to only confirm explicitly selected items.
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				-- { name = "nvim_lua", keyword_length = 6 },
				{ name = "path" },
			}),

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 100,
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					menu = {
						nvim_lsp = "[LSP]",
						luasnip = "[snip]",
						buffer = "[buf]",
						path = "[path]",
						nvim_lua = "[api]",
					},
				}),
			},
		})
		require("cmp").setup.filetype("markdown", {
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
