{pkgs, ...}: let
  auto-indent-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "auto-indent.nvim";
    version = "2023-11-03";
    src = pkgs.fetchFromGitHub {
      owner = "VidocqH";
      repo = "auto-indent.nvim";
      rev = "main";
      sha256 = "sha256-dubpVupLfc81Jvb4woSQ63n2+VsJCRjnvDzkFTQE2MQ=";
    };
    meta.homepage = "https://github.com/VidocqH/auto-indent.nvim";
    meta.hydraPlatforms = [];
  };
in {
  config = {
    vim = {
      extraPlugins = {
        auto-indent = {
          package = auto-indent-nvim;
        };
      };
    };
  };
}
