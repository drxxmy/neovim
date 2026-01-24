{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        programs = {
          # Nix
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt;
          };

          # Markdown
          prettier.enable = true;
        };
      };
    };
}
