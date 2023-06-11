{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.wildgoo.services.zerotierone;
  in
{
  options.wildgoo.services.zerotierone = {
    enable = mkEnableOption "Zero tier networking service";
  };
  config = mkIf cfg.enable {
      networking.firewall.allowedUDPPorts = [9696];


    networking.nameservers = [ "8.8.8.8" "8.8.4.4" "10.147.20.160" ];
    services.zerotierone = {
      enable = true;
      port = 9696;
      joinNetworks = [
        "1c33c1ced0a3bce1"
      ];
    };
  };
}
