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
            nvim-treesitter.withAllGrammars
            vim-tmux-navigator
          ];

          # Lazy loaded plugins
          opt = with pkgs.vimPlugins; [
            nvim-lspconfig
            none-ls-nvim
            lspkind-nvim
            blink-cmp
            lazydev-nvim
            luasnip
            friendly-snippets
            nvim-web-devicons
            gitsigns-nvim
            colorful-winsep-nvim
            rose-pine
            neo-tree-nvim
            nvim-autopairs
            markview-nvim
            flash-nvim
            noice-nvim
            lualine-nvim
            snacks-nvim
            hlargs-nvim
            bufferline-nvim
            kitty-scrollback-nvim
            which-key-nvim
            comment-nvim
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
