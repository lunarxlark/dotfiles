local wezterm = require("wezterm")

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

local TAB_BAR_BG = "#1d2021"
local ACTIVE_TAB_BG = "#fe8019"
local ACTIVE_TAB_FG = "Black"
local NORMAL_TAB_BG = "#7c6f64"
local NORMAL_TAB_FG = "Black"
local HOVER_TAB_BG = "#fabd2f"
local HOVER_TAB_FG = "Black"
-- wezterm.on("update-right-status", function(window, pane)
-- 	local success, date, stderr = wezterm.run_child_process({ "date" })
-- 	date = wezterm.strftime("%Y/%m/%d %H:%M")
--
-- 	window:set_right_status(wezterm.format({
-- 		{ Text = date },
-- 	}))
-- end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = NORMAL_TAB_BG
	local foreground = NORMAL_TAB_FG

	local is_first = tab.tab_id == tabs[1].tab_id
	local is_last = tab.tab_id == tabs[#tabs].tab_id

	if tab.is_active then
		background = ACTIVE_TAB_BG
		foreground = ACTIVE_TAB_FG
	elseif hover then
		background = HOVER_TAB_BG
		foreground = HOVER_TAB_FG
	end

	local leading_fg = NORMAL_TAB_FG
	local leading_bg = background

	local trailing_fg = background
	local trailing_bg = NORMAL_TAB_BG

	if is_first then
		leading_fg = TAB_BAR_BG
	else
		leading_fg = NORMAL_TAB_BG
	end

	if is_last then
		trailing_bg = TAB_BAR_BG
	else
		trailing_bg = NORMAL_TAB_BG
	end

	local title = tab.active_pane.title

	return {
		{ Attribute = { Italic = false } },
		{ Attribute = { Intensity = hover and "Bold" or "Normal" } },
		{ Background = { Color = leading_bg } },
		{ Foreground = { Color = leading_fg } },
		{ Text = SOLID_RIGHT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = trailing_bg } },
		{ Foreground = { Color = trailing_fg } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

return {
	--color_scheme = "gruvfox",
	color_scheme = "futurepunk",
	leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
	font = wezterm.font("MesloLGM Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }),
	font_size = 14.0,
	adjust_window_size_when_changing_font_size = false,
	disable_default_key_bindings = true,
	use_ime = true,
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	tab_bar_style = {
		new_tab = wezterm.format({
			{ Background = { Color = HOVER_TAB_BG } },
			{ Foreground = { Color = TAB_BAR_BG } },
			{ Text = SOLID_RIGHT_ARROW },
			{ Background = { Color = HOVER_TAB_BG } },
			{ Foreground = { Color = HOVER_TAB_FG } },
			{ Text = " + " },
			{ Background = { Color = TAB_BAR_BG } },
			{ Foreground = { Color = HOVER_TAB_BG } },
			{ Text = SOLID_RIGHT_ARROW },
		}),
		new_tab_hover = wezterm.format({
			{ Attribute = { Italic = false } },
			{ Attribute = { Intensity = "Bold" } },
			{ Background = { Color = NORMAL_TAB_BG } },
			{ Foreground = { Color = TAB_BAR_BG } },
			{ Text = SOLID_RIGHT_ARROW },
			{ Background = { Color = NORMAL_TAB_BG } },
			{ Foreground = { Color = NORMAL_TAB_FG } },
			{ Text = " + " },
			{ Background = { Color = TAB_BAR_BG } },
			{ Foreground = { Color = NORMAL_TAB_BG } },
			{ Text = SOLID_RIGHT_ARROW },
		}),
	},
	window_padding = {
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
	},
	window_decorations = "RESIZE",
	keys = require("keymap"),
}
