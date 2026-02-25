# Terminal Prompt Quick Start

## Files in this repository
- `.bashrc`, `.zshrc`: shell startup files with Starship init and prompt-switch aliases
- `.config/starship-chuck.toml`: multiline prompt with custom modules/scripts
- `.config/starship-minimal.toml`: compact single-line prompt
- `.config/starship-scripts/*.sh`: helper scripts used by custom Starship modules
- `.wezterm.lua`: WezTerm defaults, launch menu, leader key, and key bindings
- `STARSHIP_SETUP_NOTES.md`, `WEZTERM_NOTES.md`: detailed reference docs

## Quick Start (WSL bash/zsh)
1. Ensure `starship` is installed in WSL.
2. Place repo files into your home paths (`~/.bashrc`, `~/.zshrc`, `~/.config/...`, `~/.wezterm.lua`).
3. Ensure scripts are executable:
```bash
chmod +x ~/.config/starship-scripts/*.sh
```
4. Restart shell or source config (`exec zsh`, `exec bash`, or `source ~/.zshrc`).

## Prompt Variants
Both shell files define:
- `ch` -> switch to `~/.config/starship-chuck.toml`
- `min` -> switch to `~/.config/starship-minimal.toml`

Default if unset:
```bash
export STARSHIP_CONFIG="$HOME/.config/starship-chuck.toml"
```

## Quick Verify
```bash
echo "$STARSHIP_CONFIG"
starship module custom.os_type
starship module custom.dir_display -p "$HOME"
starship module custom.dir_display -p /mnt/c/Users
```

## Font Note (Windows Terminal / WezTerm)
Nerd glyphs require a Nerd Font family installed and correctly selected in terminal settings. If icons fail, test with a plain font first, then switch to a verified Nerd Font family name.
