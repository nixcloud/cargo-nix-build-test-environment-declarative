let
  pkgs = import <nixpkgs> { };
in
pkgs.stdenv.mkDerivation {
  name = "sqlite3-lib-path";

  dontUnpack = true;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out
    ln -s ${pkgs.sqlite.out}/lib $out/lib
  '';
}
