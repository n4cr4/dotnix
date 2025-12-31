# dotnix

n4cr4's configurations.

# Installation

## Nix

Use [nix-installer](https://github.com/DeterminateSystems/nix-installer) .

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

# Update

This repository uses Make to provide convenient update commands.

## Quick Update Commands

Use one of these make targets:

```bash
# 1. Update home-manager only (fastest)
make hm

# 2. Update home-manager + sheldon lock (when shell config changed)
make hm-shell

# 3. Full update: flake + home-manager + sheldon lock (recommended periodically)
make hm-full
```

## Other Make Commands

```bash
# Format Nix files
make fmt

# Show all available commands
make help
```

## Manual Update (without Make)

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
