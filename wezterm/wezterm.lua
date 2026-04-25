local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font_with_fallback({ "SauceCodePro Nerd Font Mono" })
config.font_size = 18

-- Window
config.window_decorations = "RESIZE" -- hide title bar, keep resize handle
config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.window_padding = { left = 15, right = 15, top = 15, bottom = 15 }
config.scrollback_lines = 500000

-- Cursor
config.default_cursor_style = "BlinkingBlock"

-- Color scheme
local color_scheme = "Catppuccin Macchiato"
config.color_scheme = color_scheme

-- Catppuccin Macchiato palette for manual overrides
local palette = {
	rosewater = "#f4dbd6",
	flamingo = "#f0c6c6",
	pink = "#f5bde6",
	mauve = "#c6a0f6",
	red = "#ed8796",
	maroon = "#ee99a0",
	peach = "#f5a97f",
	yellow = "#eed49f",
	green = "#a6da95",
	teal = "#8bd5ca",
	sky = "#91d7e3",
	sapphire = "#7dc4e4",
	blue = "#8aadf4",
	lavender = "#b7bdf8",
	text = "#cad3f5",
	crust = "#181926",
}

-- Red blinking block cursor matching ghostty
config.colors = {
	cursor_bg = "#ff0000",
	cursor_fg = "#1e1e2e",
	cursor_border = "#ff0000",
	split = "#3e4451",
}

return config
