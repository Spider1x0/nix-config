{ config, lib, pkgs, ... }:

let
  cfg = config.wildgoo.system.environment;

  in
{
  options.wildgoo.system.environment = {
    enable = lib.mkEnableOption "Various env variables";
};
  config = lib.mkIf cfg.enable {
  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };
  };
}
