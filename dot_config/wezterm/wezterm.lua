local wezterm = require("wezterm")

local font_map = {
	["Pragmasevka"] = {
		font = wezterm.font("Pragmasevka Nerd Font"),
		font_rules = {
			{
				intensity = "Bold",
				italic = true,
				font = wezterm.font("Pragmasevka Nerd Font", { bold = true, italic = true }),
			},
			{
				italic = true,
				font = wezterm.font("Pragmasevka Nerd Font", { italic = true }),
			},
			{
				intensity = "Bold",
				font = wezterm.font("Pragmasevka Nerd Font", { bold = true, italic = false }),
			},
		},
	},
	["JetBrainsMono"] = {
		font = wezterm.font("JetBrainsMono Nerd Font Mono"),
		font_rules = {
			{
				intensity = "Bold",
				italic = true,
				font = wezterm.font("JetBrainsMono Nerd Font Mono", { bold = true, italic = true }),
			},
			{
				italic = true,
				font = wezterm.font("JetBrainsMono Nerd Font Mono", { italic = true }),
			},
			{
				intensity = "Bold",
				font = wezterm.font("JetBrainsMono Nerd Font Mono", { bold = true, italic = false }),
			},
		},
	},
	["ComicCode"] = {
		font = wezterm.font("Comic Code Ligatures"),
	},
	["BerkeleyMono"] = {
		font = wezterm.font("Berkeley Mono"),
		font_rules = {
			{
				intensity = "Bold",
				italic = true,
				font = wezterm.font("Berkeley Mono Bold Italic", { bold = true, italic = true }),
			},
			{
				italic = true,
				font = wezterm.font("Berkeley Mono Italic", { italic = true }),
			},
			{
				intensity = "Bold",
				font = wezterm.font("Berkeley Mono Bold", { bold = true, italic = false }),
			},
		},
	},
}

-- new font test 2
--local font_family_name = "Pragmasevka"
--local font_family_name = "JetBrainsMono"
--local font_family_name = "ComicCode"
local font_family_name = "BerkeleyMono"
local font_rules
local font

local font_info = font_map[font_family_name]

if font_info then
	font = font_info.font
	font_rules = font_info.font_rules
else
	font = wezterm.font(font_family_name)
end

-- This file is copied to the Windows installation as well, if modified be sure to rerun chezmoi
local config = {
	check_for_updates = false,
	color_scheme = "Catppuccin Macchiato",
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	harfbuzz_features = { "zero" },
	use_dead_keys = false,
	enable_kitty_keyboard = true,

	keys = {
		{ key = "\r", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b[13;2u" }) },
		{ key = "\r", mods = "CTRL", action = wezterm.action({ SendString = "\x1b[13;5u" }) },
	},

	-- allow macOS alt key to function properly in terminal
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = true,

	-- similarly, don't ask the macOS IME/text services to compose input
	-- actually, this seems to be breaking a number of nvim plugins on macOS - leave ime on
	-- use_ime = false,

	window_close_confirmation = "NeverPrompt",
	initial_cols = 160,
	initial_rows = 38,
	hide_tab_bar_if_only_one_tab = true,
	default_prog = { "/usr/local/bin/fish", "-l" },

	font_size = 16.0,
	font = font,
	font_antialias = "Subpixel",
	font_rules = font_rules,

	front_end = "WebGpu",

	launch_menu = {},
	set_environment_variables = {},
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.webgpu_power_preference = "HighPerformance"
	config.font_size = 14.0

	local wsl_domains = wezterm.default_wsl_domains()

	for _, dom in ipairs(wsl_domains) do
		dom.default_cwd = "~"
	end

	config.wsl_domains = wsl_domains
	config.default_domain = "WSL:Ubuntu"
	config.default_prog = { "wsl.exe" }

	-- config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
	-- config.term = "" -- Set to empty so FZF works on windows
	table.insert(config.launch_menu, { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } })
	table.insert(config.launch_menu, { label = "cmd", args = { "cmd.exe" } })

	-- Find installed visual studio version(s) and add their compilation
	-- environment command prompts to the menu
	for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
		local year = vsvers:gsub("Microsoft Visual Studio/", "")
		table.insert(config.launch_menu, {
			label = "x64 Native Tools VS " .. year,
			args = {
				"cmd.exe",
				"/k",
				"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
			},
		})
	end
else
	table.insert(config.launch_menu, { label = "bash", args = { "bash", "-l" } })
	table.insert(config.launch_menu, { label = "fish", args = { "fish", "-l" } })
end

return config
