{
  config = {
    vim = {
      # Theme
      theme = {
        enable = true;
        name = "rose-pine";
        style = "main";
        extraConfig = ''
          require("rose-pine").setup({
          	highlight_groups = {
              -- Leafy search
          		CurSearch = { fg = "base", bg = "leaf", inherit = false },
          		Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
          	},
          })
        '';
      };

      # Indentation
      mini = {
        indentscope = {
          enable = true;
          setupOpts = {
            ignore_filetypes = [
              "dashboard"
              "neo-tree"
            ];
            symbol = "│";
          };
        };
      };

      # Keymaps overlay
      binds.whichKey.enable = true;

      # Colorful TODO commnets
      notes.todo-comments.enable = true;

      ui = {
        # Modern UI
        noice = {
          enable = true;
        };

        # Colors highlighter
        nvim-highlight-colors = {
          enable = true;
          setupOpts = {
            render = "virtual";
            virtual_symbol = "";
            enable_named_colors = true;
            enable_tailwind = true;
          };
        };
      };
    };
  };
}
