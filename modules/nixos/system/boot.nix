{ config, lib, pkgs, ... }:

with lib;
let cfg = config.wildgoo.system.boot;
  in
{
  options.wildgoo.system.boot = {
    enable = lib.mkEnableOption "nix boot options";
  };

  config = mkIf cfg.enable {


    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
  };


}
