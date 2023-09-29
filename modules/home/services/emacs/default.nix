{inputs,config, lib, pkgs, ... }:
with lib;
with inputs;
let
  cfg = config.wildgoo.services.emacs;
  in
{
  options.wildgoo.services.emacs = {
    enable = lib.mkEnableOption "doom emacs servic";
   # system = mkOption { type=types.str; default="x86_64-linux"; description="temp solution for the system";};
  };

# config = mkIf cfg.enable {
#       programs.doom-emacs = {
#       	enable = true;
#       	doomPrivateDir = ./doom;
#       };
#  #services.emacs = {
   #  enable = true;
   #  #package = inputs.nix-doom-emacs.packages.x86_64-linux.doom-emacs.override{
   #    doomPrivateDir = ./doom.d;
   #  };
    }
  #};
