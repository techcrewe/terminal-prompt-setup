# WezTerm Notes

## Config File
- `~/.wezterm.lua`

## Current Behavior
- Default shell launches WSL Ubuntu:
  - `config.default_prog = { "wsl.exe", "-d", "Ubuntu" }`
- Launch menu includes:
  - PowerShell
  - PowerShell Core
  - Command Prompt
  - Ubuntu (WSL)
- Appearance:
  - `color_scheme = "Dracula Dark"`
  - `font_size = 10`
  - `tab_bar_at_bottom = true`
  - `enable_scroll_bar = true`
  - `scrollback_lines = 50000`

## Paste/Clipboard Fix Applied
To support tools that paste using `Ctrl+V` (including transcription workflows), both bindings were defined:

- `Ctrl+V` -> `PasteFrom "Clipboard"`
- `Ctrl+Shift+V` -> `PasteFrom "Clipboard"`

This avoids inconsistent paste behavior across apps/tools.

## Key Bindings of Interest
- Leader key: `ALT+q`
- Leader tab/pane controls:
  - `LEADER+c`: new tab
  - `LEADER+x`: close pane
  - `LEADER+b` / `LEADER+n`: previous/next tab
  - `LEADER+|`: horizontal split
  - `LEADER+-`: vertical split
  - `LEADER+h/j/k/l`: move focus by pane direction
  - `LEADER+Arrow`: resize pane by 5 cells
  - `LEADER+1..0`: jump to tab index
  - `LEADER+m`: move pane to tab prompt
- Direct bindings:
  - `Ctrl+Shift+x`: horizontal split
  - `Ctrl+Shift+w` and `Super+w`: close pane
  - `Alt+Enter`: activate next pane
  - `Ctrl+v` and `Ctrl+Shift+v`: paste from clipboard

## Reload/Apply
After edits to `.wezterm.lua`:
1. Restart WezTerm, or
2. Use WezTerm reload config command (if bound)

## Suggested Sanity Checks
In WezTerm pane:
1. Copy a short sentence in Windows clipboard.
2. Press `Ctrl+V` and verify paste works.
3. Press `Ctrl+Shift+V` and verify same behavior.
4. Test pane controls with `ALT+q` leader sequences.
5. Open launch menu entries (WSL, PowerShell, cmd) and verify startup behavior.
