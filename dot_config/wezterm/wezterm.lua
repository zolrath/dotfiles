local wezterm = require('wezterm')
local act = wezterm.action

local config = wezterm.config_builder and wezterm.config_builder() or {}

-- ── Appearance ──────────────────────────────────────────────────────

config.color_scheme = 'Catppuccin Macchiato'

config.font = wezterm.font_with_fallback({
  { family = 'JetBrains Mono', weight = 'Medium', harfbuzz_features = { 'calt=1', 'liga=1', 'zero' } },
  { family = 'Symbols Nerd Font Mono', scale = 0.9 },
  'Noto Color Emoji',
})
config.font_size = 14.0
config.use_cap_height_to_scale_fallback_fonts = true

config.window_close_confirmation = 'NeverPrompt'
config.initial_cols = 160
config.initial_rows = 38

-- Dim inactive panes slightly for visual clarity
config.inactive_pane_hsb = {
  hue = 1.0,
  saturation = 0.9,
  brightness = 0.8,
}

-- Ensure text is always readable against the background
config.text_blink_ease_in = 'EaseIn'
config.text_blink_ease_out = 'EaseOut'

-- Window padding
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}

-- Scrollback
config.scrollback_lines = 10000

-- ── Tab Bar ─────────────────────────────────────────────────────────

-- Show tab bar only when multiple tabs exist
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32

-- Catppuccin Macchiato colors for the tab bar
config.colors = {
  tab_bar = {
    background = '#1e2030',
    active_tab = {
      bg_color = '#24273a',
      fg_color = '#cad3f5',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#1e2030',
      fg_color = '#6e738d',
    },
    inactive_tab_hover = {
      bg_color = '#363a4f',
      fg_color = '#cad3f5',
    },
    new_tab = {
      bg_color = '#1e2030',
      fg_color = '#6e738d',
    },
    new_tab_hover = {
      bg_color = '#363a4f',
      fg_color = '#cad3f5',
    },
  },
}

-- ── GPU ─────────────────────────────────────────────────────────────

config.front_end = 'WebGpu'

-- ── Input ───────────────────────────────────────────────────────────

config.use_dead_keys = false
config.enable_kitty_keyboard = true

-- On macOS, ALT sends composed characters by default. Match ghostty's
-- macos-option-as-alt = true behavior.
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

-- ── Smart Splits (seamless neovim/wezterm pane navigation) ──────────
-- CTRL+h/j/k/l moves between neovim splits AND wezterm panes.
-- When the active pane is running neovim, the keypress is forwarded to
-- neovim. Otherwise wezterm handles it as pane navigation.
-- Pair with smart-splits.nvim in your neovim config for full support.

local function is_vim(pane)
  local process = pane:get_foreground_process_name()
  return process and (process:find('n?vim') ~= nil)
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function nav_or_resize(resize, key)
  return {
    key = key,
    mods = resize and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({
          SendKey = { key = key, mods = resize and 'META' or 'CTRL' },
        }, pane)
      else
        if resize then
          win:perform_action(act.AdjustPaneSize({ direction_keys[key], 3 }), pane)
        else
          win:perform_action(act.ActivatePaneDirection(direction_keys[key]), pane)
        end
      end
    end),
  }
end

-- ── Keybindings ─────────────────────────────────────────────────────
-- Mirrors ghostty config:
--   Fast: CMD/ALT+SHIFT+h/j/k/l for split navigation
--   Fast: CMD/ALT+SHIFT+arrows for split resize
--   Slow: CMD/ALT+S leader then h/j/k/l/n for new splits, d to close, z to zoom
--
-- On macOS: CMD is the modifier (matches ghostty)
-- On Windows: ALT is the modifier (CMD doesn't exist)

local mod = wezterm.target_triple:find('darwin') and 'CMD' or 'ALT'
local mod_shift = mod .. '|SHIFT'

-- Leader key: CMD+S (mac) or ALT+S (windows) — matches ghostty's cmd+s>* triggers
config.leader = { key = 's', mods = mod, timeout_milliseconds = 1000 }

config.keys = {
  -- ── Smart split navigation (CTRL+h/j/k/l) ──
  -- Seamlessly moves between neovim splits and wezterm panes
  nav_or_resize(false, 'h'),
  nav_or_resize(false, 'j'),
  nav_or_resize(false, 'k'),
  nav_or_resize(false, 'l'),

  -- ── Smart split resizing (META+h/j/k/l) ──
  nav_or_resize(true, 'h'),
  nav_or_resize(true, 'j'),
  nav_or_resize(true, 'k'),
  nav_or_resize(true, 'l'),

  -- ── Ghostty-style split navigation (fast, no leader) ──
  { key = 'h', mods = mod_shift, action = act.ActivatePaneDirection('Left') },
  { key = 'j', mods = mod_shift, action = act.ActivatePaneDirection('Down') },
  { key = 'k', mods = mod_shift, action = act.ActivatePaneDirection('Up') },
  { key = 'l', mods = mod_shift, action = act.ActivatePaneDirection('Right') },

  -- ── Ghostty-style split resizing (fast, no leader) ──
  { key = 'LeftArrow',  mods = mod_shift, action = act.AdjustPaneSize({ 'Left', 10 }) },
  { key = 'DownArrow',  mods = mod_shift, action = act.AdjustPaneSize({ 'Down', 10 }) },
  { key = 'UpArrow',    mods = mod_shift, action = act.AdjustPaneSize({ 'Up', 10 }) },
  { key = 'RightArrow', mods = mod_shift, action = act.AdjustPaneSize({ 'Right', 10 }) },
  { key = '=', mods = mod_shift, action = act.ResetFontAndWindowSize },

  -- ── Split creation (leader: CMD/ALT+S then key) ──
  { key = 'h', mods = 'LEADER', action = act.SplitPane({ direction = 'Left',  domain = 'CurrentPaneDomain' }) },
  { key = 'j', mods = 'LEADER', action = act.SplitPane({ direction = 'Down',  domain = 'CurrentPaneDomain' }) },
  { key = 'k', mods = 'LEADER', action = act.SplitPane({ direction = 'Up',    domain = 'CurrentPaneDomain' }) },
  { key = 'l', mods = 'LEADER', action = act.SplitPane({ direction = 'Right', domain = 'CurrentPaneDomain' }) },
  { key = 'n', mods = 'LEADER', action = act.SplitPane({ direction = 'Right', domain = 'CurrentPaneDomain' }) },
  { key = 'd', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = false }) },
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },

  -- ── Pane management ──
  { key = 'Space', mods = 'LEADER', action = act.RotatePanes('Clockwise') },
  { key = '0', mods = 'LEADER', action = act.PaneSelect({ mode = 'SwapWithActive' }) },

  -- ── Tabs ──
  { key = 'c', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentTab({ confirm = true }) },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'Tab', mods = 'LEADER', action = act.ActivateTabRelative(1) },

  -- ── Clipboard ──
  { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom('Clipboard') },
  { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo('Clipboard') },

  -- ── Copy mode (vim-style visual selection in scrollback) ──
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },

  -- ── Misc ──
  { key = 'Enter', mods = 'SHIFT', action = act.SendString('\x1b[13;2u') },
  { key = 'Enter', mods = 'CTRL',  action = act.SendString('\x1b[13;5u') },
  { key = 'n', mods = 'SHIFT|CTRL', action = act.ToggleFullScreen },

  -- ── Font size ──
  { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },

  -- ── Workspaces ──
  { key = 'w', mods = 'LEADER', action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }) },
  {
    key = 'W',
    mods = 'LEADER|SHIFT',
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
        end
      end),
    }),
  },

  -- ── Quick launcher ──
  { key = 'l', mods = mod, action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS|DOMAINS|LAUNCH_MENU_ITEMS' }) },
}

-- Leader + 1-9 to switch tabs
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = act.ActivateTab(i - 1),
  })
end

-- ── Status Bar ──────────────────────────────────────────────────────
-- Show leader key state + workspace name + active pane info in the
-- right side of the tab bar.

wezterm.on('update-status', function(window, pane)
  local cells = {}

  -- Leader indicator
  if window:leader_is_active() then
    table.insert(cells, { Foreground = { Color = '#f5a97f' } }) -- Catppuccin peach
    table.insert(cells, { Text = ' LEADER ' })
  end

  -- Current workspace
  local workspace = window:active_workspace()
  if workspace ~= 'default' then
    table.insert(cells, { Foreground = { Color = '#8bd5ca' } }) -- Catppuccin teal
    table.insert(cells, { Text = '  ' .. workspace .. ' ' })
  end

  -- Pane info: current working directory
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    local cwd = cwd_uri.file_path or ''
    -- Shorten home directory
    local home = os.getenv('HOME') or os.getenv('USERPROFILE') or ''
    if home ~= '' and cwd:sub(1, #home) == home then
      cwd = '~' .. cwd:sub(#home + 1)
    end
    table.insert(cells, { Foreground = { Color = '#6e738d' } }) -- Catppuccin overlay0
    table.insert(cells, { Text = ' ' .. cwd .. ' ' })
  end

  window:set_right_status(wezterm.format(cells))
end)

-- ── Tab Title ───────────────────────────────────────────────────────
-- Show the process name and pane index in each tab title.

wezterm.on('format-tab-title', function(tab, _tabs, _panes, _config, _hover, _max_width)
  local pane = tab.active_pane
  local process = pane.foreground_process_name or ''
  process = process:gsub('(.*/)', '') -- strip path

  local title = process
  if title == '' then
    title = pane.title
  end

  -- Zoomed indicator
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = ' [Z]'
  end

  return {
    { Text = ' ' .. (tab.tab_index + 1) .. ': ' .. title .. zoomed .. ' ' },
  }
end)

-- ── WSL / Windows ───────────────────────────────────────────────────

config.launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.webgpu_power_preference = 'HighPerformance'
  config.window_decorations = 'RESIZE'

  local wsl_domains = wezterm.default_wsl_domains()
  for _, dom in ipairs(wsl_domains) do
    dom.default_cwd = '~'
  end
  config.wsl_domains = wsl_domains
  config.default_domain = 'WSL:Ubuntu'

  table.insert(config.launch_menu, { label = 'PowerShell', args = { 'powershell.exe', '-NoLogo' } })
  table.insert(config.launch_menu, { label = 'cmd', args = { 'cmd.exe' } })

  for _, vsvers in ipairs(wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')) do
    local year = vsvers:gsub('Microsoft Visual Studio/', '')
    table.insert(config.launch_menu, {
      label = 'x64 Native Tools VS ' .. year,
      args = { 'cmd.exe', '/k', 'C:/Program Files (x86)/' .. vsvers .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat' },
    })
  end
else
  table.insert(config.launch_menu, { label = 'zsh', args = { 'zsh', '-l' } })
  table.insert(config.launch_menu, { label = 'bash', args = { 'bash', '-l' } })
end

return config
