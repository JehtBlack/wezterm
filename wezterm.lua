local function get_home_dir()
	local home = os.getenv("MIKE_ROOT")
	if not home then
		home = os.getenv("HOME")
	end
	return home
end

local function get_shell()
	local cmder = os.getenv("CMDER_ROOT")
	if cmder then
		return { "cmd.exe", "/k", "%CMDER_ROOT%\\vendor\\init.bat" }
	end

	return { "cmd.exe" }
end

local wezterm = require("wezterm")
local config = {
	color_scheme = "Dracula",
	window_frame = {
		font = wezterm.font_with_fallback({ family = "FiraCode Nerd Font" }),
		font_size = 12,
	},
	hide_tab_bar_if_only_one_tab = true,
	font = wezterm.font_with_fallback({ family = "FiraCode Nerd Font" }),
	font_size = 11,
	default_cwd = get_home_dir(),
	default_prog = get_shell(),
	window_background_opacity = 0.9,
	initial_cols = 160,
	initial_rows = 50,
}
config.keys = {
	{
		key = "/",
		mods = "SUPER|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "SUPER|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

return config
