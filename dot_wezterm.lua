-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ IMPORTS AND REQUIREMENTS                                          ║
-- ╚═══════════════════════════════════════════════════════════════════╝
local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ FONT AND APPEARANCE                                               ║
-- ╚═══════════════════════════════════════════════════════════════════╝
config.font = wezterm.font("MesloLGS Nerd Font", { weight = "Thin" })
config.font_size = 14.6

-- Commented out background configuration
-- config.background = {
-- 	{
-- 		source = {},
-- 		hsb = {},
-- 	},
-- }

-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ WINDOW CONFIGURATION                                              ║
-- ╚═══════════════════════════════════════════════════════════════════╝
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Start maximized
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ TAB BAR SETTINGS                                                  ║
-- ╚═══════════════════════════════════════════════════════════════════╝
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 4

-- Commented out tab bar color configuration
local default_colors = wezterm.color.get_builtin_schemes()["Gruvbox (Gogh)"]

config.colors = config.colors or default_colors
config.colors.tab_bar = {
	-- The color of the strip that goes along the top of the window
	-- (does not apply when fancy tab bar is in use)
	background = "#FDF1C2",

	-- The active tab is the one that has focus in the window
	active_tab = {
		-- The color of the background area for the tab
		bg_color = "#EEDAAD",
		-- The color of the text for the tab
		fg_color = "#c0c0c0",

		-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
		-- label shown for this tab.
		-- The default is "Normal"
		intensity = "Half",

		-- Specify whether you want "None", "Single" or "Double" underline for
		-- label shown for this tab.
		-- The default is "None"
		underline = "None",

		-- Specify whether you want the text to be italic (true) or not (false)
		-- for this tab.  The default is false.
		italic = false,

		-- Specify whether you want the text to be rendered with strikethrough (true)
		-- or not for this tab.  The default is false.
		strikethrough = false,
	},

	-- Inactive tabs are the tabs that do not have focus
	inactive_tab = {
		bg_color = "#FDF1C2",
		fg_color = "#808080",

		-- The same options that were listed under the `active_tab` section above
		-- can also be used for `inactive_tab`.
	},

	-- You can configure some alternate styling when the mouse pointer
	-- moves over inactive tabs
	inactive_tab_hover = {
		bg_color = "#FDF1C2",
		fg_color = "#808080",
		italic = true,

		-- The same options that were listed under the `active_tab` section above
		-- can also be used for `inactive_tab_hover`.
	},

	-- The new tab button that let you create new tabs
	new_tab = {
		bg_color = "#FDF1C2",
		fg_color = "#808080",

		-- The same options that were listed under the `active_tab` section above
		-- can also be used for `new_tab`.
	},

	-- You can configure some alternate styling when the mouse pointer
	-- moves over the new tab button
	new_tab_hover = {
		bg_color = "#FDF1C2",
		fg_color = "#909090",
		italic = true,

		-- The same options that were listed under the `active_tab` section above
		-- can also be used for `new_tab_hover`.
	},
}

config.color_scheme = "Gruvbox (Gogh)"
-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ PERFORMANCE SETTINGS                                              ║
-- ╚═══════════════════════════════════════════════════════════════════╝
config.max_fps = 240
config.animation_fps = 240

-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ WORKSPACE SWITCHER CONFIGURATION                                  ║
-- ╚═══════════════════════════════════════════════════════════════════╝
-- workspace_switcher.get_choices = function(opts)
-- 	-- this will ONLY show the workspace elements, NOT the Zoxide results
-- 	return workspace_switcher.choices.get_workspace_elements({})
-- end
workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"

-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ KEYBINDINGS                                                       ║
-- ╚═══════════════════════════════════════════════════════════════════╝
config.keys = {
	{ key = "y", mods = "CMD", action = wezterm.action.ActivateCopyMode },
	{
		key = "k",
		mods = "CMD",
		action = workspace_switcher.switch_workspace(),
	},
	{
		key = "l",
		mods = "CMD",
		action = workspace_switcher.switch_to_prev_workspace(),
	},
}

-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║ PLUGIN SETUP                                                      ║
-- ╚═══════════════════════════════════════════════════════════════════╝
workspace_switcher.apply_to_config(config)
modal.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
