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
    libinput.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;

  };


      environment.systemPackages = with pkgs;    [
        rofi
        swaylock
        swayidle
        xwayland
        libinput

    ];

  #
  #  enable = true;
  #  wlr.enable = true;
  #  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #  gtkUsePortal = true;
  #};

     environment.sessionVariables = {

         SDL_VIDEODRIVER="wayland";
         QT_QPA_PLATFORM="wayland";
         QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
         _JAVA_AWT_WM_NONREPARENTING="1";
         MOZ_ENABLE_WAYLAND="1";
         XDG_SESSION_TYPE="wayland";
         XDG_SESSION_DESKTOP="Hyprland";
         XDG_CURRENT_DESKTOP="Hyprland";
     };
    };

       #Hyprland Environment variables

    }
