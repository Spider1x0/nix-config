# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }:

{
  # You can import other NixOS modules here
  imports = [ ./hardware.nix ];

  users.users = {
    spider = {
      initialPassword = "password";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "video" "input" ];
      packages = [ pkgs.wildgoo.ocr pkgs.wildgoo.volumescript ];
    };
  };

  # TODO Create modules for these programs
  programs = {
    noisetorch.enable = true;
    #light.enable = true;
    dconf.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # enable and stuff Wifi section
  wildgoo = {
    desktop.hyprland.enable = true;
    services = {
      snipe-it.enable = false;
      zerotierone.enable = false;
    };
    hardware = {
      firewall.enable = true;
      networking.enable = true;
      gpu.enable = true;
      sound.enable = true;
    };
  };

  # Amd drivers
  # Security section
  security.pam.services.swaylock = { };

  # Environment stuff
  environment = { variables = { EDITOR = "emacsclient -c "; }; };

  networking.hostName = "Burrow";

  # Bootlooder section
  # TODO Remove this piece of code
  # DONE Repalced with a module
 boot = {
   kernelPackages = with pkgs.linuxKernel.packages; linux_6_4;
   loader = {
     systemd-boot.enable = true;
     efi.canTouchEfiVariables = true;
     efi.efiSysMountPoint = "/boot/efi";
   };
 };


  time.timeZone = "Asia/Riyadh";
  i18n.defaultLocale = "en_US.utf8";

  services.ratbagd.enable = true;
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  services.xserver = {
    enable = true;
    #libinput.enable = true;

    #videoDrivers = [ "amdgpu" ];
    displayManager.gdm.enable = true;
    windowManager.xmonad.enable = true;
    desktopManager.xfce.enable = true;

  };


# hardware = {
#   opengl = {
#     enable = true;
#     driSupport32Bit = true;
#     driSupport = true;
#     extraPackages = with pkgs; [
#       mesa
#       rocm-opencl-icd
#       rocm-opencl-runtime
#       amdvlk
#
#     ];
#     extraPackages32 = with pkgs;
#       [
#         driversi686Linux.amdvlk
#         mesa
#
#       ];
#   };
# };
#
  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.windowManager.xmonad.enable= true;
  #services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;
  #TODO Convert this piece to a module
  # Configure keymap in X11
  services.xserver = {
    layout = "us,ara";
    xkbVariant = "";
    xkbOptions = "grp:alt_shift_toggle";

  };

  system.stateVersion = "22.11";
}
