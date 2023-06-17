{ config, lib, pkgs, ... }:

with lib;
let cfg = config.wildgoo.services.snipe-it;
in {
  options.wildgoo.services.snipe-it = {
    enable = lib.mkEnableOption "Snipe-it Service";

  };
    config = mkIf cfg.enable {

      services.snipe-it = {
        enable = true;
        appKeyFile = ./appkey;
        database.createLocally = true;
    };
  };

}
