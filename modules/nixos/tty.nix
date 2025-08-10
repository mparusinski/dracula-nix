{ draculaLib, draculaPalette }:
{ config, lib, ... }:
let
  cfg = config.dracula.tty;
in
{
  options.dracula.tty = draculaLib.mkDraculaOption { name = "tty"; };
  config = lib.mkIf cfg.enable {
    # Color 0 to 15 in order

    console.colors = lib.mkDefault (
      map (color: (lib.substring 1 6 draculaPalette.${color})) [
        "dracula-bg" # color 0 (black)
        "dracula-red" # color 1 (red)
        "dracula-green" # color 2 (green)
        "dracula-yellow" # color 3 (yellow)
        "dracula-purple" # color 4 (blue)
        "dracula-pink" # color 5 (magenta)
        "dracula-cyan" # color 6 (cyan)
        "dracula-fg" # color 7 (white)
        "dracula-cl" # color 8 (bright black)
        "bright-red" # color 9 (bright red)
        "bright-green" # color 10 (bright green)
        "bright-yellow" # color 11 (bright yellow)
        "bright-blue" # color 12 (bright blue)
        "bright-magenta" # color 13 (bright magenta)
        "bright-cyan" # color 14 (bright cyan)
        "bright-white" # color 15 (bright white)
      ]
    );
  };
}
