{ lib, ... }:
{
  config.vim = {
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        enable_cursor_hijack = true;
        git_status_async = true;
        filesystem.use_libuv_file_watcher = true;
        event_handlers = [
          {
            event = "neo_tree_popup_input_ready";
            handler = lib.generators.mkLuaInline /* lua */ ''
              function(args)
                -- map <esc> to enter normal mode (by default closes prompt)
                vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
              end,
            '';
          }
        ];
        filesystem = {
          filtered_items = {
            hide_by_name = [
              "__pycache__"
              ".direnv"
              ".devenv"
              "node_modules"
              ".vscode"
              ".vite"
            ];
            never_show = [
              "__pycache__"
            ];
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>Neotree toggle<cr>";
        desc = "Toggle Neotree";
      }
    ];
  };
}
