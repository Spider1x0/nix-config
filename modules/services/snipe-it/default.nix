{ config, lib, pkgs, ... }:

with lib;
let cfg = config.wildgoo.snipe-it;
in {
  options.wildgoo.snipe-it = {
    enable = lib.mkEnableOption "Snipe-it Service";

    config = mkIf cfg.enable {

  services.snipe-it = {
    enable = true;
    appKeyFile = "./appkey";
    database.createLocally = true;
  };
    };
  };

}
