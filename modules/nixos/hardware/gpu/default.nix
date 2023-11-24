{ config, lib, pkgs, ...}:

with lib;

let cfg = config.wildgoo.hardware.gpu;

in {
  options.wildgoo.hardware.gpu = {
    enable = lib.mkEnableOption "Amd gpu drivers";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "amdgpu" ];
   hardware.opengl = {
     enable = true;

     driSupport32Bit = true;
     driSupport = true;
    extraPackages = with pkgs; [
      mesa.drivers
     #rocm-opencl-icd
     #rocm-opencl-runtime
    #  amdvlk
    ];

    extraPackages32 = with pkgs; [
      #driversi686Linux.amdvlk
      #mesa
      driversi686Linux.mesa.drivers

     ];
   };
  };
}
