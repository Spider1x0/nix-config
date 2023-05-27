{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.wildgoo.services.emacs;
  in
{
  options.wildgoo.services.emacs = {
    enable = lib.mkEnableOption "emacs service";
  };

  config = mkIf cfg.enable;

  services.emacs = { enable = true; };
  services.emacs.package = with pkgs;
    ((emacsPackagesFor emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
      epkgs.pdf-tools
      epkgs.emacsql
      epkgs.emacsql-sqlite3
      epkgs.emacsql-sqlite
      emacsPackages.org-roam
    ]));
}
