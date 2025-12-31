.PHONY: help hm hm-shell hm-full fmt clean

# Default target - show help
help:
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "dotnix - Nix Configuration Management"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo ""
	@echo "Update commands:"
	@echo "  make hm        - home-manager switch only (fastest)"
	@echo "  make hm-shell  - home-manager switch + sheldon lock"
	@echo "  make hm-full   - flake update + home-manager switch + sheldon lock"
	@echo ""
	@echo "Maintenance commands:"
	@echo "  make fmt       - format Nix files"
	@echo ""

# Fast update - home-manager only
hm:
	@echo "Running: home-manager switch --flake ."
	home-manager switch --flake .

# Update with shell plugins
hm-shell:
	@echo "Running: home-manager switch + sheldon lock"
	home-manager switch --flake . && sheldon lock --update

# Full update - flake inputs, home-manager, and shell plugins
hm-full:
	@echo "Running: flake update + home-manager switch + sheldon lock"
	nix flake update && home-manager switch --flake . && sheldon lock --update

# Format Nix files
fmt:
	@echo "Formatting Nix files..."
	nix fmt
