{ config, lib, pkgs, ... }:
with lib;
let
  # Define the config path for the service
cfg = config.wildgoo.services.udev;

in

{
  # Define the options for the module
  options.wildgoo.services.udev = {
    enable = mkEnableOption "General udev ruels";
  };
  # If cfg.enable is set to true enable the following
  config = mkIf cfg.enable {
    services.udev = {
      enable = true;
      packages = with pkgs; [wooting-udev-rules];
    };
  };

}
