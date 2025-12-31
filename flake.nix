{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    nvf,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
      perSystem = {pkgs, ...}: let
        mylib = import ./lib {inherit (nixpkgs) lib;};
        customNeovim = nvf.lib.neovimConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit mylib;
          };
          modules = [
            ./modules
          ];
        };
      in {
        packages.default = customNeovim.neovim;
      };
    };
}
