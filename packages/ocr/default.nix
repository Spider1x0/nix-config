{ lib
, pkgs
, stdenv
, makeWrapper
, toybox
, flameshot
, xclip
, notify
, tesseract
, dunst
}:

with lib;

pkgs.stdenv.mkDerivation {
  src = ./ocr.sh;
  nativeBuildInputs = [ makeWrapper ];
  name = "ocr";
  version = "1.0";

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  description = "A tool that copies text from screenshots to clipboard";
  installPhase = ''
    install -Dm 0755 $src $out/bin/ocr
    wrapProgram $out/bin/ocr --set PATH \
    "${makeBinPath [ toybox flameshot xclip notify tesseract dunst ]}"
  '';
}
