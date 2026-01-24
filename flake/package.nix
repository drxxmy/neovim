{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      mylib = import "${self}/lib" { inherit (inputs.nixpkgs) lib; };
      customNeovim = inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit mylib;
        };
        modules = [
          "${self}/modules"
        ];
      };
    in
    {
      packages.default = customNeovim.neovim;
    };
}
