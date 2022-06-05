require("jaq-nvim").setup({
	cmds = {
		external = {
			c = "gcc main.c && ./a.out",
			go = "go run ./...",
		},
	},
	ui = {
		-- Start in insert mode
		startinsert = false,

		-- Switch back to current file
		-- after using Jaq
		wincmd = false,

		-- Floating Window / FTerm settings
		float = {
			-- Floating window border (see ':h nvim_open_win')
			border = "rounded",

			-- Num from `0 - 1` for measurements
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,

			-- Highlight group for floating window/border (see ':h winhl')
			border_hl = "FloatBorder",
			float_hl = "Normal",

			-- Floating Window Transparency (see ':h winblend')
			blend = 0,
		},
	},
})
