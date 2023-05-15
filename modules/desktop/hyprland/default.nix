{ config, lib, pkgs, ... }:

with lib;
let cfg = config.wildgoo.desktop.hyprland;
in {

  options.wildgoo.desktop.hyprland = {
    enable = lib.mkEnableOption " Hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    programs.xwayland.enable = true;

  services.xserver = {
    enable = true;
    #libinput.enable = true;

    displayManager.gdm.enable = true;

    displayManager.gdm.wayland = true;

  };

  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #   gtkUsePortal = true;
  # };
      # Hyprland Environment variables
      #
      environment.sessionVariables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP="Hyprland";
      };
    };


}
