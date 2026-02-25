# Repository Guidelines

## Project Structure & Module Organization
This repository stores terminal and prompt configuration files, not application source code.

- Root dotfiles: `.bashrc`, `.zshrc`, `.wezterm.lua`
- Starship config: `.config/*.toml`
- Starship helper scripts: `.config/starship-scripts/*.sh`
- Documentation: `README.md`, `STARSHIP_SETUP_NOTES.md`, `WEZTERM_NOTES.md`
- Local-only reference: `GITHUB_FILE_CHECKLIST_LOCAL_ONLY.md` (ignored by default)

Keep related config and scripts together under `.config/` and update docs when behavior changes.

## Build, Test, and Development Commands
There is no build pipeline. Use targeted validation commands before committing:

- `git status --short` - confirm staged/unstaged changes
- `rg -n --hidden -g '!.git' -g '!*.md' -g '!*.txt' "(token|apikey|api_key|secret|password|PRIVATE KEY|ssh-rsa|BEGIN)" .` - quick secret scan
- `starship module custom.dir_display -p /home/$USER` - validate custom Starship module output
- `wezterm --config-file .wezterm.lua --skip-config-check=false` - validate WezTerm config syntax (if `wezterm` is installed)

## Coding Style & Naming Conventions
- Shell scripts: `#!/usr/bin/env bash`, LF line endings, executable when invoked by tools.
- Indentation: 2 spaces in shell/Lua/TOML unless existing file style differs.
- Script names: lowercase snake case (example: `dir_display.sh`).
- Starship configs: descriptive names with hyphens (example: `starship-minimal.toml`).
- Prefer small, composable script helpers under `.config/starship-scripts/`.

## Testing Guidelines
Automated tests are not configured. Use manual verification:

- Bash/Zsh: start a new shell and confirm prompt renders correctly.
- Starship scripts: run `starship module ...` against representative paths.
- WezTerm: reload config and verify key bindings (especially paste behavior).

Document any non-obvious verification steps in `STARSHIP_SETUP_NOTES.md`.

## Commit & Pull Request Guidelines
Follow the existing commit style: short imperative subject lines (example: `Add gitignore & gitattributes`).

- Keep commits scoped (configs, scripts, docs, or hygiene files).
- Mention affected environments in commit/PR text (`WSL`, `PowerShell`, `WezTerm`).
- Include before/after prompt examples when changing rendering behavior.
- Never include private tokens, machine-specific secrets, or unintended personal paths.
