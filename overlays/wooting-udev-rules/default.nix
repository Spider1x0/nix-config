{ channels, ... }:

final: prev:
{
    #inherit (channels.nixpkgs) wooting-udev-rules;
}
