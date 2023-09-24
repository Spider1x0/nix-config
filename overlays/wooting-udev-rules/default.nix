{ channels, ... }:

final: prev:
{
    inherit (channels.nixpkgs-unstable) wooting-udev-rules;
}
