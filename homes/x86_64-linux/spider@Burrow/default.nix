# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{inputs, lib, config, pkgs, ... }:

{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];


# # TODO: Set your username
 home = {
   username = "spider";
   homeDirectory = "/home/spider";
 };
#
# # Add stuff for your user as you see fit:
# # programs.neovim.enable = true;
# # home.packages = with pkgs; [ steam ];
#
# # Enable home-manager and git
# services.dunst.enable = true;
#
# programs.home-manager.enable = true;
# #programs.git.enable = true;
#
# home.packages =  with pkgs;[
#   #window Managers
#     #Web
#    tesseract
##    discord
#    bitwarden
#    firefox
#    qutebrowser
#    axel
#    yt-dlp
#    slides
#    bookworm
#     #Games
#    appimage-run
#    wootility
#    lutris
#    wine
#    xivlauncher
#   #Visual Stuff
#    flameshot
#    mpv
#    ani-cli
#    piper
#   #Audio
#    easyeffects
#    spotify
#    spicetify-cli
#   #lib stuff
#    rofi
#    #rofi-wayland
#    #waylanda
#    ffmpeg
#    libratbag
#    activate-linux
#    librsvg
#    libratbag
#    git
#    xsel
#   #  openssl
#   #  libkrb5
#    virt-manager
#   # vmware-workstation
#   # teams
#   #virtual stuff
#   # oven-media-engine
#   #Terminal stuff
#    powertop
#    dnsmasq
#    ntfs3g
#    fuse
#    vim
#    spacevim
#    gamescope
#    tmux
#    plasma5Packages.kdeconnect-kde
#    alacritty
#    neofetch
#    htop
#    spice
#   # tutanota-desktop
#   #notes
#    obsidian
#   #7seas
#    deluge
#   #dev_temp
#    sqlite
#    gcc10
#    cmake
#    #emacs28Packages.vterm
#    libvterm-neovim
#    webcord
#    soundux
#   # snipe-it
#    #pkgs.ocr
#   # pkgs.volumescript
# ];
#
#
#services.emacs = {
#  enable = true;
#};
#programs.emacs  = {
# enable = true;
# package = pkgs.unstable.emacs;
#  extraPackages = epkgs-unstable: with epkgs-unstable; [
#            vterm
#            emacsql
#            emacsql-sqlite3
#            org-roam
#          ];
#};
#
# # Nicely reload system units when changing configs
# systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
