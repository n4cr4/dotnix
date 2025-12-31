# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Nix-based dotfiles repository (`dotnix`) that manages n4cr4's development environment configuration using home-manager. The configuration is structured as a Nix flake and uses Make for convenient build workflows.

## Architecture

### Core Structure

- **flake.nix**: Main entry point defining the home-manager configuration for user "n4cr4" on x86_64-linux
- **home.nix**: User-level configuration that imports all home-manager modules
- **home-manager/default.nix**: Central imports file that loads all configuration modules

### Module Organization

The `home-manager/` directory contains modular Nix configurations:

- **shell/**: Zsh configuration using sheldon for plugin management. Uses a two-step plugin loading system with compinit loaded first via "00-compinit" plugin. Shell configs are stored in `shell/config/` and loaded by sheldon.
- **editor/**: Neovim configuration. The actual vim config is in `editor/nvim/` with init.lua, lua modules, and snippets.
- **dotfile/**: Legacy dotfiles (gdbinit, latexmkrc, vimrc, lazygit.yml) managed via home-manager file linking
- **dev.nix**: Development toolchain packages (gcc, go, nodejs, pnpm, typst, rustc, cargo)
- **tools.nix**: CLI utilities (bat, delta, eza, fd, ripgrep, fzf, ghq, lazygit, lazydocker, jq, zoxide, awscli2, gh, etc.)
- **git.nix**: Git configuration with delta integration
- **tmux.nix**: Tmux configuration
- **direnv.nix**: direnv integration
- **ai/**: Claude Code CLI configuration (requires ANTHROPIC_API_KEY at runtime via ~/.config/zsh/env.zsh)

### Update Workflow

The repository uses **Make** to provide convenient build commands:

1. **make hm** - Fast update: `home-manager switch --flake .`
2. **make hm-shell** - Update with shell plugins: `home-manager switch --flake . && sheldon lock --update`
3. **make hm-full** - Full update: `nix flake update && home-manager switch --flake . && sheldon lock --update`

Additional commands:
- **make fmt** - Format Nix files using `nix fmt`
- **make clean** - Remove build artifacts and lock files
- **make help** - Display all available commands (default target)

## Common Commands

### Applying Configuration Changes

```bash
# Quick update (most common)
make hm

# Update after changing shell config
make hm-shell

# Full update including flake inputs
make hm-full

# Format Nix files
make fmt

# Show all available commands
make help
```

### Manual Commands (without Make)

```bash
# Apply configuration
home-manager switch --flake .

# Update flake inputs
nix flake update

# Update sheldon plugins
sheldon lock --update

# Format Nix files
nix fmt
```

### Working with Shell Configuration

Shell plugins are managed by sheldon. The configuration uses a specific load order:
- "00-compinit" loads first to initialize completions
- Config files from `~/.config/sheldon/config` load next
- Other plugins (fzf-tab, zsh-autosuggestions, etc.) load after

When modifying shell configs in `home-manager/shell/config/`, use `make hm-shell` to apply changes.

### Debugging

For debugging Neovim Lua configs:
```lua
print(vim.inspect(variable_name))
```
Then use `:messages` in command mode to view output.

## Important Notes

- **allowUnfree**: Enabled in home-manager/default.nix to allow unfree packages
- **Shell setup**: To use zsh as default shell, add the nix-managed zsh path to `/etc/shells`
- **API Keys**: ANTHROPIC_API_KEY for Claude Code should be in `~/.anthropic_api_key` and loaded via `~/.config/zsh/env.zsh`
- **Formatter**: Repository uses nixfmt-rfc-style (run with `nix fmt`)
- **Git config**: Uses pull.rebase=true and fetch.prune=true by default
