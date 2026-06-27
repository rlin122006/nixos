{ lib, stdenv, fetchcurl, autoPatchelfHook }:

stdenv.mkDerivation rec {
  pname = "palera1n";
  version = "2.3";

  src = fetchurl {
    url = "https://github.com/palera1n/palera1n/releases/download/v${version}/palera1n-linux-x86_64";
    hash = "sha256-037c2b398bc13bab277ae9abb841ae3c5c5bc89e22332bbcbcd8d04b68214292";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/palera1n
    runHook postInstall
  '';

  meta = with lib; {
    platforms = [ "x86_64-linux" ];
    mainProgram = "palera1n";
  };
}
