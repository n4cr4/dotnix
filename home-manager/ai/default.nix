{ pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
  ];

  # Note: ANTHROPIC_API_KEY is loaded at runtime via ~/.config/zsh/env.zsh
  # from ~/.anthropic_api_key file if it exists
}
