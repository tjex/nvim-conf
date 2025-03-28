return {
	"ibhagwan/fzf-lua",

	config = function()
		local key = require("tjex.keybind")
		local fzf = require("fzf-lua")

		-- use fzf inplace of quickfix
		fzf.register_ui_select()

		key.imap({
			"<c-f>",
			function()
				fzf.files({ previewer = false })
			end,
		})

		key.nmap({
			"sf",
			function()
				fzf.files({ previewer = false })
			end,
		})
		key.nmap({ "sg", fzf.grep })
		key.nmap({ "sG", fzf.grep_cword })
		key.nmap({ "ss", fzf.buffers })
		key.nmap({ "sd", fzf.lsp_document_symbols })
		key.nmap({ "sh", fzf.help_tags })
		key.nmap({ "si", fzf.lsp_incoming_calls })
		key.nmap({ "sl", fzf.resume })
		key.nmap({ "so", fzf.lsp_outgoing_calls })
		key.nmap({ "sp", fzf.registers })
		key.nmap({ "sr", fzf.lsp_references })
		key.nmap({ "sy", fzf.git_branches })
		key.nmap({ "sz", fzf.git_stash })

		require("fzf-lua").setup({
			winopts = {
				width = 0.6,
				height = 0.8,
				preview = { delay = 20, layout = "vertical", vertical = "up:45%" },
			},
			defaults = { file_icons = false },
			hls = {
				border = "FloatBorder",
				backdrop = "nil",
				header_bind = "primary",
				header_text = "primary",
				buf_nr = "keyword",
				buf_id = "keyword",
				buf_linenr = "keyword",
				path_linenr = "keyword",
				path_colnr = "keyword",
				buf_flag_cur = "keyword",
				buf_flag_alt = "keyword",
			},
		})
	end,
}
