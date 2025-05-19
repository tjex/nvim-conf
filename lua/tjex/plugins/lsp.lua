-- Compatible with Neovim v0.11+
-- Configs for lsp, mason and diagnostics

local lsp_keymaps = function(bufnr)
	local key = require("tjex.keybind")
	local bufopts = { buffer = bufnr }

	key.nmap({ "gd", vim.lsp.buf.definition, bufopts })
	key.nmap({
		"[d",
		function()
			vim.diagnostic.jump({ count = -1, float = true })
		end,
		bufopts,
	})
	key.nmap({
		"]d",
		function()
			vim.diagnostic.jump({ count = -1, float = true })
		end,
		bufopts,
	})
	key.nmap({
		"K",
		function()
			vim.lsp.buf.hover({ border = "rounded" })
		end,
		bufopts,
	})
	key.nmap({ "<c-x>", vim.lsp.buf.code_action, bufopts })

	key.nmap({
		"<leader>io",
		function()
			local config = vim.diagnostic.config() or {}
			if config.virtual_lines then
				vim.diagnostic.config({ virtual_lines = false })
			else
				vim.diagnostic.config({ virtual_lines = true })
			end
		end,
		{ desc = "Toggle lsp_lines" },
	})
end

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
			"gopls",
			"pyright",
			"stylelint_lsp",
			"astro",
			"jsonls",
			"marksman"
		}

		vim.diagnostic.config({
			virtual_text = false,
			signs = { text = {
				[vim.diagnostic.severity.INFO] = "",
			} },
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
			automatic_enable = true,
		})

		local lsp_attach = function(client, bufnr)
			client.server_capabilities.document_formatting = true
			lsp_keymaps(bufnr)
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- General config for all servers
		for _, server in ipairs(servers) do
			vim.lsp.config[server] = {
				on_attach = lsp_attach,
				capabilities = capabilities,
			}
		end

		-- Specific config overrides
		vim.lsp.config["lua_ls"] = {
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
			settings = {
				stylelintplus = {
					autoFixOnSave = true,
					autoFixOnFormat = true,
				},
			},
		}

		vim.lsp.config["marksman"] = {
			on_init = function(client)
				-- Detach marksman if in a zk notebook
				if vim.fs.root(0, ".zk") ~= nil then
					vim.lsp.buf_detach_client(0, client.id)
				end
			end,
		}

		vim.lsp.config["ltex_plus"] = {
			settings = {
				ltex = {
					disabledRules = {
						["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
					},
					language = "en-AU",
					completionEnabled = false,
				},
			},
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
