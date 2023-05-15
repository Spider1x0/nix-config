{ lib, config, ... }:
let
  # Snowfall is the package namespace not the directory itself
  # What the heck is config ?
  cfg = config.snowfall.example;
in
{
  # What are options ?
  options.snowfall.example = {
    enable = lib.mkEnableOption "Snowfall Example";
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      SNOWFALL_EXAMPLE = "enabled";
    };
  };
}
