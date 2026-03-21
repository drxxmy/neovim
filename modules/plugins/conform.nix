{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      prettierd
      rustywind
    ];
    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        defult_format_opts = {
          lsp_format = "fallback";
        };
        formatters_by_ft = {
          yaml = [ "prettierd" ];
          javascript = [ "rustywind" ];
          typescript = [ "rustywind" ];
          javascriptreact = [ "rustywind" ];
          typescriptreact = [ "rustywind" ];
          vue = [
            "rustywind"
            "prettierd"
          ];
        };
      };
    };
  };
}
