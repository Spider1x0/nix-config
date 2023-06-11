{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.wildgoo.services.emacs;
  in
{
  options.wildgoo.services.emacs = {
    enable = lib.mkEnableOption "emacs service";
  };

  config = mkIf cfg.enable {
  };
}
