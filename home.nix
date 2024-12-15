{
  pkgs,
  ...
}:

{
  home = rec {
    username = "n4cr4";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  imports = [ ./home-manager ];
  programs.home-manager.enable = true;
}
