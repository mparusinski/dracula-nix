{ lib, ... }:
{
  _class = "nixos";
  imports = [
    (lib.modules.importApply ../default.nix { draculaModules = import ./all-modules.nix; })
  ];
}
