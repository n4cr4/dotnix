{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
  ];

  # Claude Code configuration files
  home.file.".claude/CLAUDE.md" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotnix/home-manager/ai/claude/CLAUDE.md";
  };
  home.file.".claude/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotnix/home-manager/ai/claude/settings.json";
  };
  home.file.".claude/commands" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotnix/home-manager/ai/claude/commands";
  };

  # Note: ANTHROPIC_API_KEY is loaded at runtime via ~/.config/zsh/env.zsh
  # from ~/.anthropic_api_key file if it exists
}
