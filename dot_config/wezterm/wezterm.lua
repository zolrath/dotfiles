local wezterm = require("wezterm")

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
	window_close_confirmation = "NeverPrompt",
	initial_cols = 232,
	initial_rows = 38,
	hide_tab_bar_if_only_one_tab = true,
	default_prog = { "/bin/zsh", "-l" },

	font_size = 14.0,
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),

	launch_menu = {},
	set_environment_variables = {},
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	local wsl_domains = wezterm.default_wsl_domains()

	for _, dom in ipairs(wsl_domains) do
		dom.default_cwd = "~"
	end

	config.wsl_domains = wsl_domains
	config.default_domain = "WSL:Ubuntu"
	config.default_prog = { "wsl.exe" }

	--config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
	--config.term = "" -- Set to empty so FZF works on windows
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
	table.insert(config.launch_menu, { label = "zsh", args = { "zsh", "-l" } })
end

return config
