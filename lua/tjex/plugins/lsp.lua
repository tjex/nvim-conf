-- mason and mason-lsp.
-- use this to configure mason and LSP servers.
-- configure linters and formatters in null-ls.

return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "onsails/lspkind.nvim" },

	config = function()
		-- NOTE: zk lsp is managed by ./zk.lua
		local servers = {
			"lua_ls",
			"marksman",
			"gopls",
			"pyright",
			"stylelint_lsp",
			"astro",
			"jsonls",
			"ruff",
		}

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = true,
		})
	end,
	init = function()
		local lspconfig = require("lspconfig")
		local key = require("tjex.keymap")

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		local lsp_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			-- I don't actually use this do I?
			-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			client.server_capabilities.document_formatting = true
			key.nmap({ "gd", vim.lsp.buf.definition, bufopts })
			key.nmap({ "[d", vim.diagnostic.goto_prev, bufopts })
			key.nmap({ "]d", vim.diagnostic.goto_next, bufopts })
			key.nmap({ "<c-p>", vim.lsp.buf.hover, bufopts })
			key.nmap({ "<c-x>", vim.lsp.buf.code_action, bufopts })
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = lsp_attach,
					capabilities = capabilities,
				})
			end,
			["marksman"] = function()
				require("lspconfig").marksman.setup({
					on_attach = lsp_attach,
					capabilities = capabilities,
					-- if zk lsp is attached, we are working in a zk notebook
					-- so detatch marksman.
					on_init = function(client)
						local clients = vim.lsp.get_active_clients()
						for _, c in ipairs(clients) do
							if c.name == "zk" then
								vim.lsp.buf_detach_client(0, client.id)
							end
						end
					end,
				})
			end,
			["clangd"] = function()
				require("lspconfig").clangd.setup({
					on_attach = lsp_attach,
					capabilities = capabilities,
					name = "clangd",
					cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
					initialization_options = {
						fallback_flags = { "-std=c++17" },
					},
				})
			end,
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					on_attach = lsp_attach,
					capabilities = capabilities,
					settings = {
						Lua = {
							-- format = {
							-- 	defaultConfig = {
							-- 		quote_style = "single",
							-- 		max_line_length = "120",
							-- 		indent_style = "space",
							-- 		indent_size = "2",
							-- 	},
							-- },
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
							telemetry = { enable = false },
						},
					},
				})
			end,
			["stylelint_lsp"] = function()
				require("lspconfig").stylelint_lsp.setup({
					on_attach = lsp_attach,
					capabilities = capabilities,
					settings = {
						stylelintplus = {
							autoFixOnSave = true,
							autoFixOnFormat = true,
						},
					},
				})
			end,
		})
	end,
}
