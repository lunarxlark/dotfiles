local wezterm = require("wezterm")

local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

wezterm.on("update-right-status", function(window, pane)
	local success, date, stderr = wezterm.run_child_process({ "date" })
	date = wezterm.strftime("%Y/%m/%d %H:%M")

	window:set_right_status(wezterm.format({
		{ Text = date },
	}))
end)

return {
	color_scheme = "nordfox",
	font = wezterm.font("MesloLGM Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	font_size = 14.0,
	adjust_window_size_when_changing_font_size = false,
	disable_default_key_bindings = true,
	use_ime = true,
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	-- window_decorations = "NONE",
	-- tab_bar_style = {
	-- 	active_tab_left = wezterm.format({
	-- 		{ Background = { Color = "#002240" } },
	-- 		{ Foreground = { Color = "#2cc55d" } },
	-- 		{ Text = SOLID_LEFT_ARROW },
	-- 	}),
	-- 	active_tab_right = wezterm.format({
	-- 		{ Background = { Color = "#002240" } },
	-- 		{ Foreground = { Color = "#2cc55d" } },
	-- 		{ Text = SOLID_RIGHT_ARROW },
	-- 	}),
	-- 	inactive_tab_left = wezterm.format({
	-- 		{ Background = { Color = "#002240" } },
	-- 		{ Foreground = { Color = "#2cc55d" } },
	-- 		{ Text = SOLID_LEFT_ARROW },
	-- 	}),
	-- 	inactive_tab_right = wezterm.format({
	-- 		{ Background = { Color = "#002240" } },
	-- 		{ Foreground = { Color = "#2cc55d" } },
	-- 		{ Text = SOLID_RIGHT_ARROW },
	-- 	}),
	-- },
	leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = require("keymap"),
}
