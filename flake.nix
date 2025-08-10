{
  description = "Dracula theme for Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    flake-compat.url = "github:edolstra/flake-compat";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;
      devSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = lib.genAttrs systems;
      forAllDevSystems = lib.genAttrs devSystems;
      mkModule =
        {
          name ? "dracula",
          type,
          file,
        }:
        { pkgs, ... }:
        {
          _file = "${self.outPath}/flake.nix#${type}Modules.${name}";
          imports = [ file ];
        };
    in
    {
      checks = forAllSystems (system: {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixfmt-rfc-style.enable = true;
            convco.enable = true;
          };
        };
      });
      devShells = forAllDevSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nixfmt-rfc-style
            ];
            shellHook = ''
              echo "Welcome to dracula-nix development shell"
            '';
          };
        }
      );
      formatter = forAllDevSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        pkgs.treefmt.withConfig {
          runtimeInputs = with pkgs; [
            keep-sorted
            nixfmt-rfc-style
          ];

          settings = {
            on-unmatched = "info";
            tree-root-file = "flake.nix";

            formatter = {
              keep-sorted = {
                command = "keep-sorted";
                includes = [ "*" ];
              };
              nixfmt = {
                command = "nixfmt";
                includes = [ "*.nix" ];
              };
            };
          };
        }
      );
      homeModules = {
        default = self.homeModules.dracula;
        dracula = mkModule {
          type = "homeManager";
          file = ./modules/home-manager;
        };
      };
      nixosModules = {
        default = self.nixosModules.dracula;
        dracula = mkModule {
          type = "nixos";
          file = ./modules/nixos;
        };
      };
    };
}
