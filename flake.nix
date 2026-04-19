{
  description = "Minimal Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
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
        shellHook = ''
          tmuxinator .
        '';
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
            plenary-nvim

            telescope-nvim
            telescope-fzf-native-nvim

            nvim-treesitter.withAllGrammars
            nvim-lspconfig
            lspkind-nvim
            none-ls-nvim

            vim-tmux-navigator
            flash-nvim

            noice-nvim
            lualine-nvim
            snacks-nvim
            comment-nvim
            bufferline-nvim
            lazydev-nvim
            luasnip
            friendly-snippets
          ];

          # Lazy loaded plugins
          opt = with pkgs.vimPlugins; [
            nvim-web-devicons
            gitsigns-nvim
            colorful-winsep-nvim
            rose-pine
            blink-cmp
            neo-tree-nvim
            nvim-autopairs
            render-markdown-nvim
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
            lua-language-server
            stylua
            selene
            black
            marksman
            isort
            clang-tools
            prettierd
            rustywind
            shfmt
            sqruff
            html-tidy
            yamlfmt
            gitlint
            cppcheck
            pylint
            stylelint
            yamllint

            nixd
            deadnix
            statix
            nixfmt

            just-lsp

            deno

            ripgrep
            fd
            ;
        };
      };
    };
}
