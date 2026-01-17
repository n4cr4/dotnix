{
  description = "Home Manager configuration of n4cr4";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."n4cr4" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          ./home.nix
          nixvim.homeModules.nixvim
        ];
      };

      devShells.${system}.default = pkgs.mkShell {
        shellHook = ''
          alias hm="home-manager switch --flake ."
          alias hm-shell="home-manager switch --flake . && sheldon lock --update"
          alias hm-full="nix flake update && home-manager switch --flake . && sheldon lock --update"
          alias fmt="nix fmt"

          help() {
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "dotnix - Nix Configuration Management"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
            echo "Update commands:"
            echo "  hm           - home-manager switch only (fastest)"
            echo "  hm-shell     - home-manager switch + sheldon lock"
            echo "  hm-full      - flake update + home-manager switch + sheldon lock"
            echo ""
            echo "Maintenance commands:"
            echo "  fmt          - format Nix files"
          }
        '';
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
