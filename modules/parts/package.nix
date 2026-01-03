{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      mylib = import ../../lib { inherit (inputs.nixpkgs) lib; };
      customNeovim = inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit mylib;
        };
        modules = [
          ../../modules/neovim
        ];
      };
    in
    {
      packages.default = customNeovim.neovim;
    };
}
