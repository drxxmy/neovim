{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      cpplint
      eslint_d
      selene
      htmlhint
      shellcheck
      statix
      deadnix
    ];
    diagnostics = {
      nvim-lint = {
        enable = true;
        linters_by_ft = {
          clang = [ "cpplint" ];
          javascript = [ "eslint_d" ];
          typescript = [ "eslint_d" ];
          lua = [ "selene" ];
          html = [ "htmlhint" ];
          bash = [ "shellcheck" ];
          nix = [
            "statix"
            "deadnix"
          ];
        };
      };
    };
  };
}
