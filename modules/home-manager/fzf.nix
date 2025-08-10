{ draculaLib, draculaPalette }:
{ config, lib, ... }:
let
  cfg = config.dracula.fzf;
in
{
  options.dracula.fzf = draculaLib.mkdraculaOption { name = "fzf"; };
  config = lib.mkIf (cfg.enable && config.programs.fzf.enable) {
    programs.fzf.colors = lib.mkDefault {
      bg = draculaPalette.dracula-bg;
      "bg+" = draculaPalette.dracula-cl;
      fg = draculaPalette.dracula-fg;
      "fg+" = draculaPalette.dracula-fg;
      hl = draculaPalette.dracula-purple;
      "hl+" = draculaPalette.dracula-purple;
      spinner = draculaPalette.dracula-orange;
      info = draculaPalette.dracula-orange;
      header = draculaPalette.dracula-cm;
      marker = draculaPalette.dracula-pink;
      prompt = draculaPalette.dracula-green;
      pointer = draculaPalette.dracula-pink;
    };
  };
}
