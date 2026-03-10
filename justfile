# Neovim Flake Tasks

# Default target
default:
    @just --list

# Format all nix files
fmt:
    nix fmt

# Check flake (build, test, format)
check:
    nix flake check --all-systems

# Build the neovim package
build:
    nix build .#default

# Run neovim with this configuration
run:
    nix run .#neovim

# Update flake inputs
update:
    nix flake update

# Clean build artifacts
clean:
    @echo "Cleaning nix build artifacts..."
    rm -rf result

# Show flake metadata
info:
    nix flake metadata

# Test neovim configuration
test:
    nix run .#neovim -- --headless -c "lua print('Neovim config loaded successfully')" -c "qa"

# Full CI pipeline (update, check, build, test)
ci: update check build test
    @echo "✅ CI pipeline completed successfully"
