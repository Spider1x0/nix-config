{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.wildgoo.apps;

  in
{
  options.wildgoo.nixos = {
    enable = lib.mkEnableOption "temporary apps module";
  };
  config = mkIf cfg.enable {
    environment.system.packges = [];
  };
}
