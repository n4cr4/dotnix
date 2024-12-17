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

If some configurations have changed, exec this.

```
# cd to this repo
home-manager switch --flake .
```

Also, if you changed some configurations related to **zsh**, exec this.

```
sheldon lock --update
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
