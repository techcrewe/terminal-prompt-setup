
local wezterm = require 'wezterm'

local config = {}


-- Make Ubuntu WSL the default shell
config.default_prog = { "wsl.exe", "-d", "Ubuntu" }

-- ================================
-- Appearance (from your original config)
-- ================================
config.font_size = 10
config.line_height = 1.0
config.color_scheme = "Dracula Dark"

config.colors = {
  cursor_bg = "#f8f8f2",
  cursor_fg = "#282a36",
  cursor_border = "#f8f8f2",
}

config.enable_tab_bar = true

-- ================================
-- Launch menu (from your original config)
-- ================================
config.launch_menu = {
  {
    label = "PowerShell",
    args = {"powershell.exe"},
  },
  {
    label = "PowerShell Core",
    args = {"pwsh.exe"},
  },
  {
    label = "Command Prompt",
    args = {"cmd.exe"},
  },
  {
    label = "Ubuntu (WSL)",
    args = {"wsl.exe"},
  },
}

-- ================================
-- Leader key system (ALT+q)
-- ================================
config.leader = {
  key = "q",
  mods = "ALT",
  timeout_milliseconds = 3000,
}

-- ================================
-- Key bindings (merged)
-- ================================
config.keys = {

  -- Leader-based bindings
  { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab "CurrentPaneDomain" },
  { key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane { confirm = false } },

  { key = "b", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
  { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },

  { key = "|", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

  { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Left" },
  { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Down" },
  { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Up" },
  { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Right" },

  { key = "LeftArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
  { key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize { "Right", 5 } },
  { key = "UpArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
  { key = "DownArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize { "Down", 5 } },

  -- Tab switching (leader + number)
  { key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = wezterm.action.ActivateTab(8) },
  { key = "0", mods = "LEADER", action = wezterm.action.ActivateTab(9) },

  -- Direct bindings (Windows‑corrected)
  {
    key = "w",
    mods = "SUPER",
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = "w",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },

  {
    key = "x",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  -- Clipboard paste compatibility (eg. tools that send Ctrl+V)
  {
    key = "v",
    mods = "CTRL",
    action = wezterm.action.PasteFrom "Clipboard",
  },
  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = wezterm.action.PasteFrom "Clipboard",
  },

  {
    key = "Enter",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Next",
  },

  {
    key = "m",
    mods = "LEADER",
    action = wezterm.action.PromptInputLine {
      description = "Move pane to tab number:",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          local tab_index = tonumber(line) - 1
          if tab_index then
            window:perform_action(
              wezterm.action.MovePaneToTab { index = tab_index },
              pane
            )
          end
        end
      end),
    },
  },

}

config.enable_tab_bar = true
config.tab_bar_at_bottom = true

config.enable_scroll_bar = true
config.scrollback_lines = 50000

return config
