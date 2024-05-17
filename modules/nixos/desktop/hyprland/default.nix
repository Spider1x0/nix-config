{ config, lib, pkgs, ... }:

with lib;
let cfg = config.wildgoo.desktop.hyprland;
in {

  options.wildgoo.desktop.hyprland = {
    enable = lib.mkEnableOption " Hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    # TODO: Convert some of these packages into modules
    environment.systemPackages = with pkgs; [
      rofi-wayland
      wofi
      mako
      grimblast
      swaylock
      swayidle
      #xwayland
      libinput
      #TODO Must be converted into a module
      waybar
    ];
  };
    #  wlr.enable = true;
    #  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    #  gtkUsePortal = true;
    #};


  #Hyprland Environment variables

}
