{
  config.vim = {
    languages.markdown = {
      enable = true;
      extensions.render-markdown-nvim.enable = true;
    };
    keymaps = [
      {
        key = "<leader>m";
        mode = "n";
        silent = true;
        action = "<cmd>RenderMarkdown toggle<cr>";
        desc = "Toggle Markdown render";
      }
    ];
  };
}
