{ draculaModules }:
{
  pkgs,
  config,
  lib,
  ...
}:
let
  draculaLib = import ./lib { inherit pkgs config lib; };
  draculaPalette = import ../palette;
in
{
  options.dracula = {
    enable = lib.mkEnableOption "Enable dracula theme globally";
  };
}
