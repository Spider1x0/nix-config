{ lib
, pkgs
, stdenv
, makeWrapper
, pamixer
, dunst }:

with lib;

  stdenv.mkDerivation  {
    src = ./volumescript.sh;
    name = "volumescript.sh";
    version = "1.1";

    nativeBuildInputs = [ makeWrapper ];

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
    install -Dm 0755 $src $out/bin/volumescript
    wrapProgram $out/bin/volumescript --set PATH \
      "${makeBinPath [pamixer dunst]}"
    '';
  }
