return {
	"David-Kunz/gen.nvim",
	lazy = true,
	cmd = "Gen",

	config = function()
		require("gen").prompts = {} -- clear defaults first
		local prompt = require("gen").prompts

		local code_model = "deepseek-coder:33b"

		require("gen").setup({
			model = "llama3",
			host = "localhost",
			port = "11434",
			retry_map = "<c-r>", -- set keymap to re-send the current prompt.
			accept_map = "<c-cr>", -- accept for replacement.
			display_mode = "split",
			show_prompt = true,
			show_model = true,
			quit_map = "q",
			no_auto_close = true,
			init = function(options)
				pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
			end,
			-- Function to initialize Ollama
			command = function(options)
				local body = { model = options.model, stream = true }
				return "curl --silent --no-buffer -X POST http://"
					.. options.host
					.. ":"
					.. options.port
					.. "/api/chat -d $body"
			end,
			debug = false,
		})

		prompt["chat"] = {
			prompt = "$input",
			replace = false,
		}

		-- code

		prompt["explain_code"] = {
			model = code_model,
			prompt = "Explain how the following code works:\n```$filetype\n$text```",
		}

		prompt["fix_code"] = {
			model = code_model,
			prompt = "The following code is buggy, fix it. Output ONLY the fixed code. DO NOT include anything except the specific code required to fix this problem:\n```$filetype\n$text```",
			replace = false,
			extract = "```$filetype\n(.-)```",
		}

		prompt["optimize_code"] = {
			model = code_model,
			prompt = "Optimize the following code, and explain concisely why the changes were made. Output the optimized code after your explanation:\n```$filetype\n$text```",
			replace = false,
			extract = "```$filetype\n(.-)```",
		}

		prompt["code_question"] = {
			model = code_model,
			prompt = "I want to ask you a question about some code. $input:\n\n```$filetype\n$text```",
		}

		-- writing and general text

		prompt["reduce_word_count"] = {
			prompt = "Reduce the word count of the following text, but without losing the quality or clarity of the underlying message or meaning:\n'$text'",
			replace = false,
			extract = '"(.-)"',
		}

		prompt["improve_writing"] = {
			prompt = "Improve the following text by making it clearer. You can increase the word count if necessary. Do not output any other text than the improved text that should replace the input text. Here is the text:\n'$text'",
			replace = false,
			extract = '"(.-)"',
		}

		prompt["summarise_text"] = {
			prompt = "Summarise the following text: $text",
		}

		prompt["ask_about_text"] = {
			prompt = "$input. Take a breath and think openly.\nThe following text is what my question or concern is based on: $text.",
		}
	end,
}
