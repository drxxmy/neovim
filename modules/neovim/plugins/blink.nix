{
  config = {
    vim = {
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        setupOpts = {
          completion = {
            documentation.auto_show = true;
            menu.auto_show = true;
          };
        };

        mappings = {
          close = "<C-e>";
          confirm = "<Tab>";
          next = "<C-j>";
          previous = "<C-k>";
          scrollDocsDown = "<C-u>";
          scrollDocsUp = "<C-d>";
        };

        setupOpts = {
          signature = {
            enabled = true;
            trigger = {
              enabled = true;
            };
          };

          sources = {
            default = [
              "lsp"
              "snippets"
              "path"
              "buffer"
            ];

            providers = {
              lsp = {
                min_keyword_length = 0;
                score_offset = 0;
              };
              snippets = {
                min_keyword_length = 0;
                score_offset = 1;
              };
              path = {
                min_keyword_length = 0;
                score_offset = 2;
              };
              buffer = {
                min_keyword_length = 3;
                score_offset = 3;
              };
            };
          };

          cmdline.keymap.preset = "super-tab";
        };
      };
    };
  };
}
