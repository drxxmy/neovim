{
  perSystem =
    { pkgs, self', ... }:
    {
      checks = {
        package-test = pkgs.runCommand "test-neovim" { } ''
          ${self'.packages.default}/bin/nvim --version > $out
        '';
      };
    };
}
