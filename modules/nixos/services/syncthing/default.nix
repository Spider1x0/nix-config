{ config, lib, pkgs, ... }:

with lib;
let

  cfg = config.wildgoo.services.syncthing;

  in

{
  options.wildgoo.services.syncthing = {
    enable = mkEnableOption "Syncthing file sharing server";
  };
  config = mkIf cfg.enable {
    services.syncthing ={
      enable = true;
      user = "spider";
      dataDir = "/home/spider/syncthing";
          };
  };
}
