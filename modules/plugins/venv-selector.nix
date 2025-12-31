{pkgs, ...}: {
  config = {
    vim = {
      extraPackages = with pkgs; [
        fd
      ];
      extraPlugins = with pkgs.vimPlugins; {
        venv-selector = {
          package = venv-selector-nvim;
          setup = "require('venv-selector').setup({})";
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
  };
}
