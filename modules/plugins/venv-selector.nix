{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      fd
    ];
    lazy.plugins = {
      "venv-selector.nvim" = {
        package = pkgs.vimPlugins.venv-selector-nvim;
        setupModule = "venv-selector";

        # Load only when needed
        cmd = [ "VenvSelect" ];
        keys = [
          {
            key = "<leader>,";
            mode = "n";
          }
        ];
      };
    };
    keymaps = [
      {
        key = "<leader>,";
        mode = "n";
        silent = true;
        action = "<cmd>VenvSelect<cr>";
        desc = "Venv selector (Telescope)";
      }
    ];
  };
}
