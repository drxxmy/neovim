{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      cpplint
      eslint_d
      selene
      htmlhint
      markdownlint-cli
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
          markdown = [ "markdownlint" ];
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
