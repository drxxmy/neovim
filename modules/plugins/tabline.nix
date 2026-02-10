{
  config.vim = {
    tabline.nvimBufferline = {
      enable = true;
      mappings = {
        cyclePrevious = "<A-h>";
        cycleNext = "<A-l>";
        movePrevious = "<A-,>";
        moveNext = "<A-.>";
        pick = "<A-p>";
      };
      setupOpts = {
        options = {
          numbers = "none";
          max_name_length = 16;
          tab_size = 16;
        };
      };
    };
  };
}
