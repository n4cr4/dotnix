# dotnix

n4cr4's configurations.

# Installation

## Nix

Use [nix-installer](https://github.com/DeterminateSystems/nix-installer) .

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

## direnv

Install direnv and configure:

```
nix-env -iA nixpkgs.direnv
```

Then add to your shell configuration:

```bash
# For zsh
eval "$(direnv hook zsh)"

# For bash
eval "$(direnv hook bash)"
```

# Update

This repository uses direnv for automatic environment loading and devshell for convenience commands.

## Workflow

1. **Normal use**: direnv automatically loads the environment when you enter the directory
2. **With shortcuts**: Run `nix develop` in a separate tmux pane to access devshell aliases

## Quick Update Commands

Use these aliases from devshell (run `nix develop` first):

```bash
# 1. Update home-manager only (fastest)
hm

# 2. Update home-manager + sheldon lock (when shell config changed)
hm-shell

# 3. Full update: flake + home-manager + sheldon lock (recommended periodically)
hm-full
```

## Other Commands

```bash
# Format Nix files
fmt

# Show all available commands
help
```

## Manual Update (without devshell)

If you prefer to run commands manually:

```bash
# Basic update
home-manager switch --flake .

# With shell update
home-manager switch --flake . && sheldon lock --update

# Full update
nix flake update && home-manager switch --flake . && sheldon lock --update
```

# Misc

## Default shell

If you want to add zsh of profile, you have to add path to `/etc/shells` in order to valid the shell.

## Debug lua configs

If you want to debug some lua vim configs, then use below.

```lua
print(vim.inspect(hogehuga))
```

and just `:messages` in x-mode.
