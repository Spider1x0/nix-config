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
    services.zerotierone = {
      enable = true;
    };
  };
}
