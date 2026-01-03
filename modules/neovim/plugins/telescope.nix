{pkgs, ...}: {
  config = {
    vim = {
      extraPackages = with pkgs; [
        ripgrep
      ];
      keymaps = [
        {
          key = "<leader>fw";
          mode = "n";
          silent = true;
          action = ":lua require('telescope.builtin').grep_string({layout_strategy='vertical'})<cr>";
          desc = "Search the string under cursor [Telescope]";
        }
      ];
      telescope = {
        enable = true;
        mappings = {
          buffers = "<leader>fb";
          diagnostics = "<leader>fd";
          findFiles = "<leader>ff";
          liveGrep = "<leader>fs";
          treesitter = null;
        };
        extensions = [
          {
            name = "fzf";
            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
            setup = {
              fzf = {
                fuzzy = true;
              };
            };
          }
        ];
        setupOpts = {
          defaults = {
            color_devicons = true;
            layout_strategy = "vertical";
            file_ignore_patterns = [
              "node_modules"
              "%.git/"
              "dist/"
              "build/"
              "target/"
              "result/"
              "%.direnv/"
            ];
          };
        };
      };
    };
  };
}
