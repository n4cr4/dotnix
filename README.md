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

This repository uses [direnv](https://direnv.net/) for automatic environment loading. When you enter the directory, `hm` and related commands become available immediately via `use flake` — no need to run `nix develop`.

## First-time Setup

If this is your first time cloning this repository, you need to install home-manager using nix:

```bash
nix run home-manager/master -- init --switch
nix run home-manager/master -- switch --flake .
```

After the initial setup, you can use the update commands below.

## Quick Update Commands

These commands are available as soon as direnv loads the flake (i.e. when you `cd` into this directory):

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
```
