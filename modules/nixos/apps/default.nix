{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.wildgoo.apps;

  in
{
  options.wildgoo.apps = {
    enable = lib.mkEnableOption "temporary apps module";
  };
  config = mkIf cfg.enable {
#TODO Remove as many apps as you can and create Modules for them
    environment.systemPackages  = with pkgs; [
     tesseract
     #discord
    # bitwarden
     bitwarden-cli
    firefox
     qutebrowser
     axel
     yt-dlp
     slides
     #bookworm
      #Games
     appimage-run
     wootility
     lutris
     wine
     #xivlauncher
    #Visual Stuff
     flameshot
     mpv
     ani-cli
     piper
     solaar
    #Audio
     easyeffects
     spotify
     spicetify-cli
    #lib stuff
     rofi
     #rofi-wayland
     #waylanda
     imhex
     ffmpeg
     libratbag
     activate-linux
     librsvg
     libratbag
     git
     xsel
     feh
     hyprpaper
    #  openssl
    #  libkrb5
     virt-manager
    # vmware-workstation
    # teams
    #virtual stuff
    # oven-media-engine
    #Terminal stuff
     powertop
     dnsmasq
     ntfs3g
     fuse
     vim
     spacevim
     gamescope
     tmux
     plasma5Packages.kdeconnect-kde
     alacritty
     wezterm
     neofetch
     htop
     spice
    # tutanota-desktop
    #notes
     #obsidian
    #7seas
     deluge
    #dev_temp
     sqlite
     gcc10
     cmake
     libvterm-neovim
     webcord
    # soundux
     helix
     anydesk
     gparted
    ];
    };
}
