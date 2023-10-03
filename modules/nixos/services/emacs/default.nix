{inputs,config, lib, pkgs, ... }:
with lib;
with inputs;
let
  cfg = config.wildgoo.services.emacs;
  in
{
  options.wildgoo.services.emacs = {
    enable = lib.mkEnableOption "doom emacs service";
   # system = mkOption { type=types.str; default="x86_64-linux"; description="temp solution for the system";};
  };

  config = mkIf cfg.enable {
          environment.systemPackages =
            let
              doom-emacs = nix-doom-emacs.packages.x86_64-linux.default.override {
                doomPrivateDir = ./doom.d;
              };
            in [
              doom-emacs
            ];
   services.emacs = {
     enable = true;
     #package = inputs.nix-doom-emacs.packages.x86_64-linux.doom-emacs.override{
    };
  };
}
