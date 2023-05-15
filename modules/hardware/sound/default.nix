{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.wildgoo.hardware.sound;
in
{
  options.wildgoo.hardware.sound = {
    enable = lib.mkEnableOption "Sound";
  };

  config = lib.mkIf cfg.enable {

    sound.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

    };
    environment.systemPackages = with pkgs;
      [
        pulsemixer
        pavucontrol
        easyeffects
      ];
  };
}
