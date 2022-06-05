require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = true,
	},
	renderer = {
		highlight_opened_files = "none",
	},
})
