{ lib, ... }:
{
  _class = "homeManager";
  imports = [
    (lib.modules.importApply ../default.nix { draculaModules = import ./all-modules.nix; })
  ];
}
