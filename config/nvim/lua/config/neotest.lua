require("neotest").setup({
	icons = {
		running = "↻",
	},
	adapters = {
		require("neotest-go"),
		require("neotest-plenary"),
	},
	config = {
		floating = {
			border = "rounded",
			max_height = 0.5,
			max_width = 0.6,
		},
		strategies = {
			integrated = {
				width = 120,
				height = 40,
			},
		},
	},
})
