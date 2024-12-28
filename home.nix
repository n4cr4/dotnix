{
  pkgs,
  ...
}:

{
  home = rec {
    username = "n4cr4";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
    sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib/";
    };
  };

  imports = [ ./home-manager ];
  programs.home-manager.enable = true;
}
