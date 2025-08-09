{
  description = "Dracula theme for Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    inherit (nixpkgs) lib;
    systems = lib.systems.flakeExposed;
    forAllSystems = lib.genAttrs systems;
    mkModule = { name ? "dracula", type, file }:{pkgs, ... }:{
      _file = "${self.outPath}/flake.nix#${type}Modules.${name}";
      imports = [ file ];
    };
  in {
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
