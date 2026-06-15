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
        packages =
          let
            mkCmd = name: body: pkgs.writeShellScriptBin name body;
          in
          [
            (mkCmd "hm" "home-manager switch --flake .")
            (mkCmd "hm-shell" "home-manager switch --flake . && sheldon lock --update")
            (mkCmd "hm-full" ''
              nix flake update && home-manager switch --flake . && sheldon lock --update
            '')
            (mkCmd "fmt" "nix fmt")
          ];
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
