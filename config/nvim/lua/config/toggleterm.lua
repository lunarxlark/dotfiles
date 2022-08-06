require("toggleterm").setup({
  open_mapping = [[<c-\>]],
	direction = "float",
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "curved",
		width = 200,
		height = 90,
	},
})
