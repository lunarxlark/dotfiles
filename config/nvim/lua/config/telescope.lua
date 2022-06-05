local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<c-y>"] = actions_layout.toggle_preview,
				["<esc>"] = actions.close,
			},
		},
		color_devicons = true,
		sorting_strategy = "ascending",
		layout_strategy = "flex",
		layout_config = {
			width = 0.95,
			height = 0.95,
		},
		prompt_position = "top",
		preview = {
			timeout = 1000,
			hide_on_startup = false,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("gh")
require("telescope").load_extension("ghq")
require("telescope").load_extension("memo")
