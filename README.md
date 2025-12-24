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

This repository uses direnv to provide convenient update commands.
When you `cd` into this directory, the development environment will be loaded automatically.

## Quick Update Commands

After entering this directory, use one of these commands:

```bash
# 1. Update home-manager only (fastest)
hm

# 2. Update home-manager + sheldon lock (when shell config changed)
hm-shell

# 3. Full update: flake + home-manager + sheldon lock (recommended periodically)
hm-full
```

## Manual Update (without direnv)

If direnv is not active, you can still update manually:

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
