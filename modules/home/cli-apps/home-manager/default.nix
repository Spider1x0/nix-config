{ config, lib,  ... }:

  let
    inherit (lib) mkEnableOption mkIf;

    cfg = config.wildgoo.cli-apps.home-manager;
    in
{
  options.wildgoo.cli-apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager.enable = true;
  };
}
