{pkgs, ...}: {
  config = {
    vim = {
      extraPackages = with pkgs; [
        cpplint
        eslint_d
        selene
        # yamllint
        htmlhint
        markdownlint-cli
        shellcheck
        # pylint
        statix
        deadnix
      ];
      diagnostics = {
        nvim-lint = {
          enable = true;
          linters_by_ft = {
            clang = ["cpplint"];
            javascript = ["eslint_d"];
            typescript = ["eslint_d"];
            lua = ["selene"];
            # yaml = [ "yamllint" ];
            html = ["htmlhint"];
            markdown = ["markdownlint"];
            bash = ["shellcheck"];
            # python = [ "pylint" ];
            nix = [
              "statix"
              "deadnix"
            ];
          };
        };
      };
    };
  };
}
