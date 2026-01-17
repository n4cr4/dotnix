{ config, pkgs, ... }:
{
  # Add opencode bin to PATH
  home.sessionPath = [
    "${config.home.homeDirectory}/.opencode/bin"
  ];

  # OpenCode configuration files
  home.file.".config/opencode/opencode.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotnix/home-manager/ai/opencode/opencode.json";
  };
  home.file.".config/opencode/AGENTS.md" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotnix/home-manager/ai/opencode/AGENTS.md";
  };
}
