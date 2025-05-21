{ pkgs, stdenv, rustc, cargo }:

pkgs.stdenv.mkDerivation {
  name = "termcolor-1.4.1-1949cf8c6b5b557f";
  phases = "unpackPhase buildPhase installPhase";

  src = pkgs.fetchurl {
    url = "https://crates.io/api/v1/crates/termcolor/1.2.0/download";
    sha256 = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6";
  };

  CARGO_CRATE_NAME = "termcolor";
  CARGO_PKG_AUTHORS = "'Andrew Gallant <jamslam@gmail.com>'";
  CARGO_PKG_DESCRIPTION = "'A simple cross platform library for writing colored text to a terminal.'";
  CARGO_PKG_HOMEPAGE = "https://github.com/BurntSushi/termcolor";
  CARGO_PKG_LICENSE = "'Unlicense OR MIT'";
  CARGO_PKG_LICENSE_FILE = "";
  CARGO_PKG_NAME = "termcolor";
  CARGO_PKG_README = "README.md";
  CARGO_PKG_REPOSITORY = "https://github.com/BurntSushi/termcolor";
  CARGO_PKG_RUST_VERSION = "";
  CARGO_PKG_VERSION = "1.4.1";
  CARGO_PKG_VERSION_MAJOR = "1";
  CARGO_PKG_VERSION_MINOR = "4";
  CARGO_PKG_VERSION_PATCH = "1";
  CARGO_PKG_VERSION_PRE = "";

  unpackPhase = ''
    tar xf $src
    cd termcolor-1.2.0
  '';

  buildPhase = ''
    mkdir out
    ${rustc}/bin/rustc --crate-name termcolor \
    --edition=2018 \
    src/lib.rs \
    --diagnostic-width=209 \
    --crate-type lib \
    --emit=dep-info,metadata,link \
    -C embed-bitcode=no \
    -C debuginfo=2 \
    -C metadata=36e152f9045c2d11 \
    -C extra-filename=-78d6a6b6a8a8b71f \
    --out-dir out \
    -L dependency=/home/nixos/cargo-nix-build-test-environment/target/debug/deps \
    --cap-lints warn
  '';

  installPhase = ''
    mkdir -p $out
    cp -R out/* $out
  '';
}

# CARGO=/home/nixos/cargo/target/debug/cargo 
# CARGO_CRATE_NAME=termcolor 
# CARGO_MANIFEST_DIR=/home/nixos/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/termcolor-1.4.1 
# CARGO_MANIFEST_PATH=/home/nixos/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/termcolor-1.4.1/Cargo.toml 
# CARGO_PKG_AUTHORS='Andrew Gallant <jamslam@gmail.com>' 
# CARGO_PKG_DESCRIPTION='A simple cross platform library for writing colored text to a terminal.' 
# CARGO_PKG_HOMEPAGE='https://github.com/BurntSushi/termcolor' 
# CARGO_PKG_LICENSE='Unlicense OR MIT' 
# CARGO_PKG_LICENSE_FILE='' 
# CARGO_PKG_NAME=termcolor 
# CARGO_PKG_README=README.md 
# CARGO_PKG_REPOSITORY='https://github.com/BurntSushi/termcolor' 
# CARGO_PKG_RUST_VERSION='' 
# CARGO_PKG_VERSION=1.4.1 
# CARGO_PKG_VERSION_MAJOR=1 
# CARGO_PKG_VERSION_MINOR=4 
# CARGO_PKG_VERSION_PATCH=1 
# CARGO_PKG_VERSION_PRE='' 
# LD_LIBRARY_PATH=/home/nixos/cargo-nix-build-test-environment/target/debug/deps 
# rustc --crate-name termcolor \
# --edition=2018 \
# /home/nixos/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/termcolor-1.4.1/src/lib.rs \
# --error-format=json \
# --json=diagnostic-rendered-ansi,artifacts,future-incompat \
# --diagnostic-width=209 \
# --crate-type lib \
# --emit=dep-info,metadata,link \
# -C embed-bitcode=no \
# -C debuginfo=2 \
# --check-cfg 'cfg(docsrs,test)' \
# --check-cfg 'cfg(feature, values())' \
# -C metadata=36e152f9045c2d11 \
# -C extra-filename=-78d6a6b6a8a8b71f \
# --out-dir /home/nixos/cargo-nix-build-test-environment/target/debug/deps \
# -L dependency=/home/nixos/cargo-nix-build-test-environment/target/debug/deps \
# --cap-lints warn
