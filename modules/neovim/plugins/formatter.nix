{pkgs, ...}: {
  config = {
    vim = {
      extraPackages = with pkgs; [
        # yamllint
        yamlfmt
        black
        isort
        prettierd
        rustywind
        alejandra
      ];
      formatter.conform-nvim = {
        enable = true;
        setupOpts = {
          defult_format_opts = {
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            nix = [
              "alejandra"
            ];
            yaml = [
              "yamlfmt"
            ];
            python = [
              "isort"
              "black"
            ];
            vue = [
              "rustywind"
              "prettierd"
            ];
          };
        };
      };
    };
  };
}
