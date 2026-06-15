# AGENTS.md

This file provides guidance to OpenCode (opencode.ai) when working with code in this repository.

## Repository Overview

This is a Nix-based dotfiles repository (`dotnix`) that manages n4cr4's development environment configuration using home-manager. The configuration is structured as a Nix flake and uses direnv for automatic environment loading.

## Architecture

### Core Structure

- **flake.nix**: Main entry point defining the home-manager configuration for user "n4cr4" on x86_64-linux. Also defines a `devShells.default` that exposes helper commands (`hm`, `hm-shell`, `hm-full`, `fmt`) as `writeShellScriptBin` packages.
- **home.nix**: User-level configuration that imports all home-manager modules
- **home-manager/default.nix**: Central imports file that loads all configuration modules

### Module Organization

The `home-manager/` directory contains modular Nix configurations:

- **shell/**: Zsh configuration using sheldon for plugin management. Uses a two-step plugin loading system with compinit loaded first via "00-compinit" plugin. Shell configs are stored in `shell/config/` and loaded by sheldon.
- **nixvim/**: Neovim configuration using nixvim (nix-community/nixvim). Fully declarative Neovim setup with LSP, completion, Treesitter, and UI plugins. Configuration is organized into:
  - `opts/`: Vim options and globals
  - `keymaps/`: Keybinding configurations
  - `plugins/`: Plugin configurations (ui, lsp, editor, lang)
- **dotfile/**: Legacy dotfiles (gdbinit, latexmkrc, vimrc, lazygit.yml) managed via home-manager file linking
- **dev.nix**: Development toolchain packages (gcc, go, nodejs, pnpm, typst, rustc, cargo)
- **tools.nix**: CLI utilities (bat, delta, eza, fd, ripgrep, fzf, ghq, lazygit, lazydocker, jq, zoxide, awscli2, gh, etc.)
- **git.nix**: Git configuration with delta integration
- **tmux.nix**: Tmux configuration
- **direnv.nix**: direnv integration
- **ai/**: OpenCode CLI configuration with GLM-4.7 model

## Workflow: Applying Configuration Changes

The repository uses [direnv](https://direnv.net/) for automatic environment loading. The `.envrc` file contains `use flake`, which loads the flake's `devShells.default` as soon as you `cd` into the repository.

**Important design note**: `hm`, `hm-shell`, `hm-full`, and `fmt` are implemented as `writeShellScriptBin` packages inside `devShells.default.packages`, NOT as `shellHook` aliases. This is intentional — direnv's `use flake` loads PATH and environment variables but does NOT execute `shellHook`, so shellHook-defined aliases would be invisible outside of an explicit `nix develop`. Packaging them as real executables ensures they are available immediately when entering the directory via direnv.

### Commands available in direnv environment

| Command | Action |
|---|---|
| `hm` | `home-manager switch --flake .` (fastest, HM-only) |
| `hm-shell` | `hm` + `sheldon lock --update` (when shell config changed) |
| `hm-full` | `nix flake update && hm && sheldon lock --update` (full refresh) |
| `fmt` | `nix fmt` |

### Working with Shell Configuration

Shell plugins are managed by sheldon. The configuration uses a specific load order:
- "00-compinit" loads first to initialize completions
- Config files from `~/.config/sheldon/config` load next
- Other plugins (fzf-tab, zsh-autosuggestions, etc.) load after

When modifying shell configs in `home-manager/shell/config/`, run `hm-shell` to apply changes.

### Working with Nixvim Configuration

Neovim is configured using nixvim, a Nix-based configuration framework. The configuration is located in `home-manager/nixvim/`:

- Modify plugin settings in `plugins/` subdirectories (ui, lsp, editor, lang)
- Update keymaps in `keymaps/default.nix`
- Change Vim options in `opts/default.nix`

After modifying nixvim configs, run `hm` to rebuild and apply changes.

### Debugging

For debugging Neovim Lua configs:
```lua
print(vim.inspect(variable_name))
```
Then use `:messages` in command mode to view output.

## Critical: Staging Files Before Applying

Nix flakes only track files that are staged in Git. **Unstaged changes are invisible to home-manager.** Always follow this workflow:

```bash
# 1. Modify configuration files
$EDITOR home-manager/nixvim/plugins/...

# 2. Stage changes so Nix can detect them
git add .

# 3. Apply and test
hm

# 4. If changes work as expected, commit
git commit -m "description of changes"
```

Skipping `git add` is the single most common cause of "my changes don't take effect" issues.

## Definition of Done (Acceptance Criteria)

Any change to this repository MUST pass the applicable AC levels below before being considered complete. Select the level based on what was modified.

### L1 — Mandatory (every change)

Run both unconditionally:

```bash
nix flake check --no-build                              # evaluation only, fail-fast
nix fmt -- --check $(git diff --name-only -- '*.nix')   # formatter check on changed Nix files
```

Both must exit 0. Note: `nix fmt` does not accept `--check` directly — it must be forwarded to the formatter (`nixfmt-rfc-style`) via `--`, and the formatter requires an explicit file list.

### L2 — When home-manager modules change (`home-manager/**`, `home.nix`)

Add a build verification (does NOT switch the system):

```bash
home-manager build --flake .
```

Must complete without error.

### L3 — When `flake.nix` devShell structure changes

Verify that helper commands are still exposed on PATH through direnv:

```bash
nix develop --command bash -c 'command -v hm hm-shell hm-full fmt'
```

All four paths must resolve to `/nix/store/.../bin/<cmd>` (not bash builtins or empty).

### Why these specific commands

- `--no-build` on L1: full `nix flake check` builds all derivations (minutes); evaluation-only catches 99% of regressions in seconds.
- `home-manager build` on L2: dry-run equivalent — validates the configuration compiles without mutating the live system.
- L3 catches the exact regression class that motivated the move from shellHook aliases to `writeShellScriptBin` packages (commands silently invisible to direnv).

## Important Notes

- **allowUnfree**: Enabled in home-manager/default.nix to allow unfree packages
- **Shell setup**: To use zsh as default shell, add the nix-managed zsh path to `/etc/shells`
- **API Keys**: OpenCode uses GLM-4.7 model via zai API. Configuration is in `~/.config/opencode/opencode.json`
- **Formatter**: Repository uses nixfmt-rfc-style (run via `fmt` or `nix fmt`)
- **Git config**: Uses pull.rebase=true and fetch.prune=true by default
- **Nixvim**: Neovim is configured declaratively using nixvim. Plugin dependencies and LSP servers are automatically managed by Nix.
