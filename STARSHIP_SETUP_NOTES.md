# Terminal Prompt Setup Notes

## Goal
Maintain two reusable Starship prompt variants for WSL shells (bash/zsh), plus helper scripts for OS and path rendering.

## Active Prompt Profiles

### 1) Chuck profile (multiline)
File: `~/.config/starship-chuck.toml`

Behavior:
- Line 1: `$os`, optional `custom.os_type` (`(WSL)`), `$shell`, `$hostname`, `$username`
- Line 2: `custom.dir_display` output
- Line 3: prompt character

Key details:
- `custom.os_type` runs `.config/starship-scripts/os_type.sh`
- `custom.dir_display` runs `.config/starship-scripts/dir_display.sh`
- Multiline `format` closes directly after `$character` to avoid extra blank cursor line

### 2) Minimal profile (single-line)
File: `~/.config/starship-minimal.toml`

Behavior:
- Single line with OS, shell, directory, git branch/status, dotted fill, right-side time, then prompt character
- Includes compact git status symbols and `time_format = "%I:%M:%S %p"`

## Helper Scripts
Directory: `~/.config/starship-scripts/`

- `dir_display.sh`: custom path shortening with home icon and `/mnt/<drive>`-aware truncation
- `os_type.sh`: prints ` (WSL)` when `WSL_DISTRO_NAME` is present
- `user.sh`: prints `hostname/user` (currently not used by active format)
- `true.sh`: always succeeds for `when` checks

Scripts should use LF endings and executable bit (`chmod +x ~/.config/starship-scripts/*.sh`).

## Shell Integration
Both `.bashrc` and `.zshrc` include:
- `starship init` for that shell
- `starship_switch()` helper
- aliases:
  - `ch` -> `starship-chuck.toml`
  - `min` -> `starship-minimal.toml`
- default config fallback:
```bash
export STARSHIP_CONFIG="$HOME/.config/starship-chuck.toml"
```

## Quick Validation Commands
```bash
echo "$STARSHIP_CONFIG"
starship module custom.os_type
starship module custom.dir_display -p "$HOME"
starship module custom.dir_display -p /mnt/c/Users
```

## Troubleshooting Notes
1. If custom modules are blank, verify executable bit and LF line endings in script files.
2. If glyphs render as `?`, install/select a Nerd Font in the terminal.
3. If switching profiles does not appear immediately, run `exec zsh` or `exec bash`.
