{ config, lib, pkgs, ... }:

with lib;
  let cfg = config.wildgoo.services.libvirt;
      in
{
  options.wildgoo.services.libvirt = {
    enable = mkEnableOption "Enable libvirtd";
  };

    config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
	environment.systemPackages = [
	pkgs.spice
	pkgs.win-spice
];
  };


}
