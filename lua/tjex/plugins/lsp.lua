-- Compatible with Neovim v0.11+
-- Assumes you are using mason.nvim v2+ and mason-lspconfig.nvim v2+

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp", -- required for `default_capabilities`
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		local servers = {
			"lua_ls",
			"marksman",
			"gopls",
			"pyright",
			"stylelint_lsp",
			"astro",
			"jsonls",
		}

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
			automatic_enable = true, -- new in v2
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local key = require("tjex.keybind")
		local lsp_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			client.server_capabilities.document_formatting = true

			key.nmap({ "gd", vim.lsp.buf.definition, bufopts })
			key.nmap({ "[d", vim.diagnostic.goto_prev, bufopts })
			key.nmap({ "]d", vim.diagnostic.goto_next, bufopts })
			key.nmap({
				"<c-k>",
				function()
					vim.lsp.buf.hover({ border = "rounded" })
				end,
				bufopts,
			})
			key.nmap({ "<c-x>", vim.lsp.buf.code_action, bufopts })
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		-- General config for all servers
		for _, server in ipairs(servers) do
			vim.lsp.config[server] = {
				on_attach = lsp_attach,
				capabilities = capabilities,
			}
		end

		-- Specific config overrides
		vim.lsp.config["lua_ls"] = {
			on_attach = lsp_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = { enable = false },
				},
			},
		}

		vim.lsp.config["stylelint_lsp"] = {
			on_attach = lsp_attach,
			capabilities = capabilities,
			settings = {
				stylelintplus = {
					autoFixOnSave = true,
					autoFixOnFormat = true,
				},
			},
		}

		vim.lsp.config["marksman"] = {
			on_attach = lsp_attach,
			capabilities = capabilities,
			on_init = function(client)
				for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
					if c.name == "zk" then
						vim.lsp.buf_detach_client(0, client.id)
					end
				end
			end,
		}

		vim.lsp.config["clangd"] = {
			on_attach = lsp_attach,
			capabilities = capabilities,
			name = "clangd",
			cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
			initialization_options = {
				fallback_flags = { "-std=c++17" },
			},
		}
	end,
}
