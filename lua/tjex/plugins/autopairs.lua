return {
	"windwp/nvim-autopairs",
  enabled = true,

	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt" },
		})
	end,
}
