{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.wildgoo.apps;

  in
{
  options.wildgoo.nixos = {
    enable = lib.mkEnableOption "temporary apps module";
  };
  config = mkIf cfg.enable {
    environment.system.packges = [
     tesseract
     discord
     bitwarden
    firefox
     qutebrowser
     axel
     yt-dlp
     slides
     bookworm
      #Games
     appimage-run
     wootility
     lutris
     wine
     xivlauncher
    #Visual Stuff
     flameshot
     mpv
     ani-cli
     piper
    #Audio
     easyeffects
     spotify
     spicetify-cli
    #lib stuff
     rofi
     #rofi-wayland
     #waylanda
     ffmpeg
     libratbag
     activate-linux
     librsvg
     libratbag
     git
     xsel
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
     neofetch
     htop
     spice
    # tutanota-desktop
    #notes
     obsidian
    #7seas
     deluge
    #dev_temp
     sqlite
     gcc10
     cmake
     #emacs28Packages.vterm
     libvterm-neovim
     webcord
     soundux
    ];
    };
}
