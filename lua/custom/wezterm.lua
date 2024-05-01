local wezterm = require 'wezterm'

local initial_cwd = 'c:/dev/'
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)
local ADMIN_ICON = utf8.char(0xf49c)
local VIM_ICON = utf8.char(0xe62b)

local CMD_ICON = utf8.char(0xe62a)
local PS_ICON = utf8.char(0xe70f)
local HOURGLASS_ICON = utf8.char(0xf252)

local SUP_IDX =
  { '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹', '¹⁰', '¹¹', '¹²', '¹³', '¹⁴', '¹⁵', '¹⁶', '¹⁷', '¹⁸', '¹⁹', '²⁰' }
local SUB_IDX = {
  '₁',
  '₂',
  '₃',
  '₄',
  '₅',
  '₆',
  '₇',
  '₈',
  '₉',
  '₁₀',
  '₁₁',
  '₁₂',
  '₁₃',
  '₁₄',
  '₁₅',
  '₁₆',
  '₁₇',
  '₁₈',
  '₁₉',
  '₂₀',
}

local uname = os.getenv 'username' .. '@' .. os.getenv 'computername'
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local edge_background = '#121212'
  local background = '#4E4E4E'
  local foreground = '#1C1B19'
  local dim_foreground = '#3A3A3A'

  if tab.is_active then
    background = '#FBB829'
    foreground = '#1C1B19'
  elseif hover then
    background = '#FF8700'
    foreground = '#1C1B19'
  end

  local edge_foreground = background
  local process_name = tab.active_pane.foreground_process_name
  local pane_title = tab.active_pane.title
  local exec_name = basename(process_name):gsub('%.exe$', '')
  local title_with_icon

  if exec_name == 'cmd' then
    title_with_icon = CMD_ICON .. ' CMD'
  elseif exec_name == 'pwsh' then
    title_with_icon = PS_ICON .. ' PS'
  else
    title_with_icon = HOURGLASS_ICON .. ' ' .. exec_name
  end

  if pane_title:match '^Administrator: ' then
    title_with_icon = title_with_icon .. ' ' .. ADMIN_ICON
  end

  local left_arrow = SOLID_LEFT_ARROW

  if tab.tab_index == 0 then
    left_arrow = SOLID_LEFT_MOST
  end
  local id = SUB_IDX[tab.tab_index + 1]
  local pid = SUP_IDX[tab.active_pane.pane_index + 1]
  local title = ' ' .. wezterm.truncate_right(title_with_icon, max_width - 6) .. ' '

  return {
    { Attribute = { Intensity = 'Bold' } },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = left_arrow },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = id },
    { Text = title },
    { Foreground = { Color = dim_foreground } },
    { Text = pid },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
    { Attribute = { Intensity = 'Normal' } },
  }
end)

return {
  -- default_prog = {"C:/tools/neovim/Neovim/bin/nvim.exe","."},
  -- disable_default_key_bindings = true,
  set_environment_variables = {
    prompt = '┌($E[34m' .. uname:lower() .. '$E[0m)─[$E[32m$P$E[0m]$_└─$E[34m$$$E[0m',
    LANG = 'en_US.UTF-8',

    -- PATH = "c:\include_path\;" .. os.getenv("PATH"),
  },
  -- leader = { key="`"},
  leader = { key = 'a', mods = 'CTRL' },
  disable_default_key_bindings = true,
  default_cwd = initial_cwd,
  window_padding = {
    left = 6,
    right = 2,
    top = 0,
    bottom = 0,
  },
  -- https://wezfurlong.org/wezterm/config/default-keys.html
  keys = {
    -- create new tab pane
    { key = 'l', mods = 'ALT', action = wezterm.action { SplitPane = { direction = 'Right', command = { args = {} }, size = { Percent = 30 } } } },
    { key = 'j', mods = 'ALT', action = wezterm.action { SplitPane = { direction = 'Down', command = { args = {} }, size = { Percent = 25 } } } },

    -- switch between tabs
    { key = 'Tab', mods = 'CTRL', action = wezterm.action { ActivateTabRelative = 1 } },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action { ActivateTabRelative = -1 } },

    -- paste from the clipboard
    { key = 'V', mods = 'CTRL', action = wezterm.action { PasteFrom = 'Clipboard' } },

    -- navigate between tabs using vim keys
    { key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Down' } },

    -- resize tab window using vim keys
    { key = 'h', mods = 'CTRL|ALT', action = wezterm.action { AdjustPaneSize = { 'Left', 5 } } },
    { key = 'j', mods = 'CTRL|ALT', action = wezterm.action { AdjustPaneSize = { 'Down', 5 } } },
    { key = 'k', mods = 'CTRL|ALT', action = wezterm.action { AdjustPaneSize = { 'Up', 5 } } },
    { key = 'l', mods = 'CTRL|ALT', action = wezterm.action { AdjustPaneSize = { 'Right', 5 } } },

    -- close/open a new wezterm window
    { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action { CloseCurrentPane = { confirm = false } } },
    {
      key = '+',
      mods = 'CTRL|SHIFT',
      action = wezterm.action {
        SpawnCommandInNewTab = {
          -- cwd = initial_cwd
        },
      },
    },

    -- Set default key for font size shortcuts
    { key = '-', mods = 'CTRL|ALT', action = 'DecreaseFontSize' },
    { key = '=', mods = 'CTRL|ALT', action = 'IncreaseFontSize' },

    -- switch to full screen
    { key = '\r', mods = 'ALT', action = 'ToggleFullScreen' },

    { key = '1', mods = 'ALT', action = wezterm.action { ActivateTab = 0 } },
    { key = '2', mods = 'ALT', action = wezterm.action { ActivateTab = 1 } },
    { key = '3', mods = 'ALT', action = wezterm.action { ActivateTab = 2 } },
    { key = '4', mods = 'ALT', action = wezterm.action { ActivateTab = 3 } },
    { key = '5', mods = 'ALT', action = wezterm.action { ActivateTab = 4 } },
    { key = '6', mods = 'ALT', action = wezterm.action { ActivateTab = 5 } },
    { key = '7', mods = 'ALT', action = wezterm.action { ActivateTab = 6 } },
    { key = '8', mods = 'ALT', action = wezterm.action { ActivateTab = 7 } },
    { key = '9', mods = 'ALT', action = wezterm.action { ActivateTab = 8 } },
    { key = '0', mods = 'ALT', action = wezterm.action { ActivateTab = -1 } },
  },
  initial_rows = 45,
  initial_cols = 104,
  line_height = 1.2,
  -- font_dirs = {"C:/Windows/Fonts"},
  font_shaper = 'Harfbuzz', -- "Allsorts", Harfbuzz
  font_size = 10.0,
  font_rasterizer = 'FreeType',
  -- font_antialias = "Greyscale",  -- None, Grayscale, Subpixel
  -- font_hinting = "Full",  -- None, Vertical, VerticalSubpixel, Full
  -- font = wezterm.font('Monofur Nerd Font', { weight = 'Regular', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font("OperatorMono Nerd Font", {weight=325, stretch="Normal", italic=false}),
  -- font = wezterm.font("Iosevka Nerd Font", {weight="Light", stretch="Normal", style="Normal"}),
  -- font = wezterm.font('Iosevka Nerd Font', { weight = 'Regular', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font("Iosevka Nerd Font", {weight="Medium", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("Iosevka Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("IntelOne Mono", {weight="Light", stretch="Normal", style="Normal"}), font = wezterm.font("IntelOne Mono", {weight="Light", stretch="Normal", style="Italic"}), font = wezterm.font("IntelOne Mono", {weight="Regular", stretch="Normal", style="Normal"}), font = wezterm.font("IntelOne Mono", {weight="Regular", stretch="Normal", style="Italic"}), font = wezterm.font("IntelOne Mono", {weight="Medium", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("IntelOne Mono", {weight="Medium", stretch="Normal", style="Italic"}),
  -- font = wezterm.font("IntelOne Mono", {weight="Bold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("IntelOne Mono", {weight="Bold", stretch="Normal", style="Italic"}),
  -- font = wezterm.font("OperatorMono Nerd Font", {weight="DemiLight", stretch="Normal", italic=false}),
  -- font = wezterm.font("OperatorMono Nerd Font", {weight=275, stretch="Normal", italic=false}),
  -- font = wezterm.font("JetBrainsMono NF", {weight="Regular", stretch="Normal", italic=false}),
  -- font = wezterm.font("JetBrainsMonoMedium NF", {weight="Medium", stretch="Normal", italic=false}),
  -- font = wezterm.font("SauceCodePro NF", {weight="Regular", stretch="Normal", italic=false}),
  -- font = wezterm.font("SauceCodePro Nerd Font Mono", {weight="Regular", stretch="Normal", italic=false}),
  -- font = wezterm.font("SauceCodePro Nerd Font Mono", {weight="Regular", stretch="Normal", italic=false}),
  -- font = wezterm.font("JetBrainsMonoExtraBold Nerd Font Mono", {weight="ExtraBold", stretch="Normal", italic=false}),
  -- font = wezterm.font("SFMono Nerd Font", {weight="DemiBold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("SFMono Nerd Font", {weight="Medium", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("CamingoCode Nerd Font", {weight="Regular", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("CamingoCode Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("BlexMono NF", {weight="Regular", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("CaskaydiaCove NF", {weight="Regular", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("FantasqueSansMono NF", {weight="Regular", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("FantasqueSansMono NF", {weight="Regular", stretch="Normal", style="Italic"}),
  -- font = wezterm.font("FantasqueSansMono NF", {weight="Bold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("FantasqueSansMono NF", {weight="Bold", stretch="Normal", style="Italic"}),
  -- font = wezterm.font("FiraCode NF", {weight="Light", stretch="Normal", style="Normal"}),
  -- font = wezterm.font('FiraCode NF', { weight = 'Regular', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font('FiraCode NF', { weight = 450, stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font('FiraCode NF', { weight = 'Medium', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font("FiraCode NF", {weight="DemiBold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("FiraCode NF", {weight="Bold", stretch="Normal", style="Normal"}),
  font = wezterm.font('JuliaMono', { weight = 'Regular', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font('ComicMono NF', { weight = 'Regular', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font("ComicMono NF", {weight="Regular", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight=250, stretch="Normal", style="Normal"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight=250, stretch="Normal", style="Italic"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight=265, stretch="Normal", style="Normal"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight=265, stretch="Normal", style="Italic"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight="Light", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight="Light", stretch="Normal", style="Italic"}),
  -- font = wezterm.font('Comic Code Ligatures', { weight = 'Regular', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font("Comic Code Ligatures", {weight="Regular", stretch="Normal", style="Italic"}),
  -- font = wezterm.font('Comic Code Ligatures', { weight = 'Medium', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font("Comic Code Ligatures", {weight="Medium", stretch="Normal", style="Italic"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight="DemiBold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight="DemiBold", stretch="Normal", style="Italic"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight="Bold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("Comic Code Ligatures", {weight="Bold", stretch="Normal", style="Italic"}),

  -- font = wezterm.font('MonoLisa Static-NoScript', { weight = 'Regular', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font('MonoLisa Static-NoScript', { weight = 'Regular', stretch = 'Normal', style = 'Italic' }),
  -- font = wezterm.font('MonoLisa Static-NoScript', { weight = 'Medium', stretch = 'Normal', style = 'Normal' }),
  -- font = wezterm.font("MonoLisa Static-NoScript", {weight="Medium", stretch="Normal", style="Italic"}),
  -- font = wezterm.font("MonoLisa Static-NoScript", {weight="DemiBold", stretch="Normal", style="Normal"}),
  -- font = wezterm.font("MonoLisa Static-Script", {weight="Regular", stretch="Normal", style="Normal"}),

  -- COLOR SCHEMES
  -- color_scheme = "Builtin Solarized Dark",
  -- color_scheme = 'Obsidian',
  -- color_scheme = "Gruvbox Dark",
  -- color_scheme = "OneHalfDark",
  -- color_scheme = "Batman",
  -- color_scheme = 'Dracula',
  color_scheme = 'shades-of-purple',
  -- color_scheme = 'Dark Violet (base16)',
  -- color_scheme = default_color_scheme,
  -- color_scheme = 'Night Owl (Gogh)',
  -- color_scheme = 'tokyonight_day',

  default_cursor_style = 'BlinkingUnderline', -- SteadyBlock, SteadyBar, BlinkingBlock,
  -- BlinkingBar, SteadyUnderline, BlinkingUnderline
  scrollback_lines = 12000,
  selection_word_boundary = ' \t\n[]"\'`(),.;:', -- Default: " \t\n{}[]()\"'`",
  adjust_window_size_when_changing_font_size = false,
  enable_tab_bar = true,
  enable_scroll_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 32,

  -- image background enable start -----------------------------
  window_background_opacity = 1,
  -- text_background_opacity = 0.3,
  -- win32_acrylic_accent_color = '#2b2042',
  -- win32_acrylic_accent_color = '#11111B',
  -- win32_system_backdrop = 'Acrylic',
  window_background_image = os.getenv 'USERPROFILE' .. '/AppData/Local/nvim/rsrc/bg/img60.png' or '',
  window_background_image_hsb = {
    brightness = 0.05,
    hue = 1.0,
    saturation = 1.0,
  },
  -- image background enable end -------------------------------
  -- leaf
  use_fancy_tab_bar = false,
}
