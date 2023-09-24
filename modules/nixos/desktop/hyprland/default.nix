{ config, lib, pkgs, ... }:

with lib;
let cfg = config.wildgoo.desktop.hyprland;
in {

  options.wildgoo.desktop.hyprland = {
    enable = lib.mkEnableOption " Hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
      rofi
      swaylock
      swayidle
      xwayland
      libinput

    ];
  };
    #
    #  enable = true;
    #  wlr.enable = true;
    #  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    #  gtkUsePortal = true;
    #};


  #Hyprland Environment variables

}
