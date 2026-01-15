{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
  ];

  # Add opencode bin to PATH
  home.sessionPath = [
    "${config.home.homeDirectory}/.opencode/bin"
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
  # Note: ZAI_API_KEY is loaded at runtime via ~/.config/zsh/env.zsh
  # from ~/.zai_api_key file if it exists

  # OpenCode configuration files
  home.file.".config/opencode/opencode.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotnix/home-manager/ai/opencode/opencode.json";
  };
  home.file.".config/opencode/AGENTS.md" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotnix/home-manager/ai/opencode/AGENTS.md";
  };
}
