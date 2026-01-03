{
  config = {
    vim = {
      dashboard.dashboard-nvim = {
        enable = true;
        setupOpts = {
          theme = "hyper";
          config = {
            disable_move = true;
            week_header.enable = true;
            packages.enable = false;
            project.enable = false;
            mru = {
              enable = true;
              limit = 5;
              cwd_only = true;
            };
          };
        };
      };
    };
  };
}
