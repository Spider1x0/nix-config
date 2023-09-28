{inputs, config, lib, pkgs, ... }:
with lib;
let
  cfg = config.wildgoo.services.emacs;
  in
{
  options.wildgoo.services.emacs = {
    enable = lib.mkEnableOption "doom emacs service";
    system = mkOpt str "The type of the system, by default it's x86_64-linux" "x86_64-linuxj";
  };

  config = mkIf cfg.enable {
    services.emacs = {
      enable = true;
      package = inputs.nix-doom-emacs.packages.${system}.doom-enacs.override{
        doomPrivateDir = ./doom.d;
      };
    };
  };
}
