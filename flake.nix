{
  description = "Minimal Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      mnw,
      neovim-nightly,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      inherit (nixpkgs) lib;
    in
    {
      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = [ self.packages.${system}.default.devMode ];
      };

      packages.${system}.default = mnw.lib.wrap pkgs {
        inherit (neovim-nightly.packages.${system}) neovim;

        initLua = /* lua */ ''
          require('config')
          require('lz.n').load('lazy')
        '';

        desktopEntry = false;

        plugins = {
          start = with pkgs.vimPlugins; [
            lz-n
            nvim-treesitter.withAllGrammars
            plenary-nvim
            vim-tmux-navigator
          ];

          # Lazy loaded plugins
          opt = with pkgs.vimPlugins; [
            blink-cmp
            bufferline-nvim
            colorful-winsep-nvim
            comment-nvim
            conform-nvim
            flash-nvim
            friendly-snippets
            gitsigns-nvim
            hlargs-nvim
            kitty-scrollback-nvim
            lazydev-nvim
            lspkind-nvim
            lspsaga-nvim
            lualine-nvim
            luasnip
            markview-nvim
            noice-nvim
            nvim-autopairs
            nvim-lint
            nvim-lspconfig
            nvim-surround
            nvim-ufo
            nvim-web-devicons
            quicker-nvim
            rose-pine
            snacks-nvim
            todo-comments-nvim
            which-key-nvim
          ];

          dev.config = {
            impure = "/home/dreamy/dev/neovim";
            pure =
              let
                fs = lib.fileset;
              in
              fs.toSource {
                root = ./.;
                fileset = fs.unions [
                  ./lua
                ];
              };
          };
        };

        # Runtime dependencies
        extraBinPath = builtins.attrValues {
          inherit (pkgs)
            black
            clang-tools
            cppcheck
            deadnix
            deno
            fd
            gitlint
            html-tidy
            isort
            just-lsp
            lua-language-server
            marksman
            nixd
            nixfmt
            pylint
            ripgrep
            rustywind
            selene
            shfmt
            sqruff
            statix
            stylelint
            stylua
            yamlfmt
            yamllint
            ;
        };
      };
    };
}
