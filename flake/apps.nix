{
  perSystem =
    { self', ... }:
    {
      apps.neovim = {
        type = "app";
        program = "${self'.packages.default}/bin/nvim";
        meta.description = "Neovim IDE";
      };
    };
}
