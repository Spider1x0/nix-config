{ lib, config, ... }:
with lib;
let cfg = config.wildgoo.hardware.firewall;

in {
  options.wildgoo.hardware.firewall = {
    enable = lib.mkEnableOption "Desktop Firewall rules";
  };

  config = mkIf cfg.enable {
    networking = {
      firewall = {
        allowedTCPPorts = [ 80 443 445 47988 3306];
        allowedTCPPortRanges = [{
          from = 1714;
          to = 1764;
        }];
        allowedUDPPortRanges = [{
          from = 1714;
          to = 1764;
        }];
      };
    };
  };
}
