default:
    @just dev

run:
    @nix run .#packages.x86_64-linux.default

dev:
    @nix run .#packages.x86_64-linux.default.devMode
