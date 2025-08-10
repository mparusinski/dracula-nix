{ config, lib, ... }:
{
  mkDraculaOption =
    {
      name,
      useGlobalEnable ? true,
      default ? if useGlobalEnable then config.dracula.enable else false,
    }:
    {
      enable = lib.mkEnableOption "Whether to enable Dracula theme for ${name}" // {
        default = true;
      };
    };
}
