{inputs,config, lib, pkgs, ... }:
with lib;
with inputs;

#Description: a module for doom emacs as a service,
#TODO: Do some cleaning for the code
let
  cfg = config.wildgoo.services.emacs;
  doom-emacs = nix-doom-emacs.packages.x86_64-linux.default.override {
    doomPrivateDir = ./doom.d;
              };
  in
{
  options.wildgoo.services.emacs = {
    enable = lib.mkEnableOption "doom emacs service";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [doom-emacs];
};
}
