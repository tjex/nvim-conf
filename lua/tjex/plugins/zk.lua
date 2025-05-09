local tjv = require("tjex/vars")

return {
	"zk-org/zk-nvim",
	-- dir = "~/zk-nvim",
	-- name = "zk-local",

	event = "BufEnter *.md",
	config = function()
		local tjutil = require("tjex.util")

		local cmd = require("zk.commands")
		local key = require("tjex.keybind")
		local util = require("zk.util")
		local zk = require("zk")

		local weekdate = vim.fn.system("~/scripts/utility/weekdate.sh")
		local year = vim.fn.strftime("%y")
		local diary_dir = "d/" .. year

		cmd.add("ZkOrphans", function(options)
			options = vim.tbl_extend("force", { orphan = true }, options or {})
			zk.edit(options, { title = "Zk Orphans" })
		end)

		local keymaps = function(bufnr)
			key.nmap({ "gd", vim.lsp.buf.definition, { buffer = bufnr } })

			-- make daily note
			key.nmap({
				"zd",
				function()
					local notebook_root = util.notebook_root(vim.fn.expand("%:p"))
					local filename = weekdate
					local path_table = { notebook_root, diary_dir, filename }
					local filepath = table.concat(path_table, "/") .. ".md"
					local title = ""
					if tjutil.file_exists(filepath) then
						vim.cmd(":e " .. filepath)
					else
						local subheading = vim.fn.input("Subheading: ")
						if subheading ~= "" then
							title = "'" .. filename .. ":" .. " " .. subheading .. "'"
						else
							title = filename
						end
						cmd.get("ZkNew")({ dir = diary_dir, group = "d", title = title, { buffer = bufnr } })
					end
				end,
				{ buffer = bufnr },
			})
			key.nmap({
				"zn",
				":ZkNew {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>",
				{ buffer = bufnr },
			})
			key.nmap({ "st", ":ZkTags<cr>", { buffer = bufnr } })
			key.nmap({ "sf", ":ZkNotes {excludeHrefs = {'d'}}<cr>", { buffer = bufnr } })
			key.nmap({ "so", ":ZkLinks<cr>", { buffer = bufnr } })
			key.nmap({ "ss", ":ZkBuffers<cr>", { buffer = bufnr } })
			key.nmap({ "si", ":ZkBacklinks<cr>", { buffer = bufnr } })

			-- visual mode
			key.vmap({ "sm", ":ZkMatch<cr>", { buffer = bufnr } })
			key.vmap({
				"zn",
				":ZkNewFromTitleSelection {dir = vim.fn.input('Dir: ')}<cr>",
				{ buffer = bufnr },
			})
			key.vmap({ "zl", ":ZkInsertLinkAtSelection<cr>", { buffer = bufnr } })
			key.vmap({
				"ze",
				":ZkNewFromContentSelection {title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ')}<cr>",
				{ buffer = bufnr },
			})

			-- insert mode
			key.imap({
				"<c-r>",
				function()
					vim.cmd("norm! i") -- otherwise link gets inserted after cursor
					cmd.get("ZkInsertLink")()
				end,
				{ buffer = bufnr },
			})
		end

		require("zk").setup({
			picker = tjv.picker,

			-- lsp config is dealt with here instead of lsp.lua because .setup()
			-- actually communicates directly with nvim-lsp to setup the server.
			-- trying to integrate it in mason-lsp will probably end badly.
			lsp = {
				config = {
					cmd = { "zk", "lsp", "--log", "/tmp/zk-lsp.log" },
					name = "zk",
					on_attach = function()
						local bufnr = vim.api.nvim_get_current_buf()
						require("cmp_nvim_lsp").default_capabilities()
						keymaps(bufnr)
					end,
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})
	end,
}
