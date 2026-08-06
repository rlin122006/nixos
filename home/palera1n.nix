{ lib, stdenv, fetchurl, autoPatchelfHook }:

stdenv.mkDerivation rec {
  pname = "palera1n";
  version = "2.4";

  src = fetchurl {
    url = "https://github.com/palera1n/palera1n/releases/download/v${version}/palera1n-linux-x86_64";
    hash = "sha256-6lMd+TPAyO2rJey49D+u3QEBd0hEgrs3ROqkzxzUhlg=";
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
