{ pkgs, stdenv, rustc, cargo, termcolor-1_4_1 }:

pkgs.stdenv.mkDerivation {
  name = "cargo-nix-build-test-environment-declarative";
  phases = "buildPhase installPhase testPhase";

  buildInputs = [ termcolor-1_4_1 ];

  src = builtins.filterSource
    (path: type:
      let base = baseNameOf path;
      in !(base == "target" || base == "result" || builtins.match "result-*" base != null))
    ./..;

  CARGO = "/home/nixos/cargo/target/debug/cargo";
  CARGO_BIN_NAME = "cargo-nix-build-test-environment";
  CARGO_CRATE_NAME = "cargo_nix_build_test_environment";
  CARGO_PKG_AUTHORS = "";
  CARGO_PKG_DESCRIPTION = "";
  CARGO_PKG_HOMEPAGE = "";
  CARGO_PKG_LICENSE = "";
  CARGO_PKG_LICENSE_FILE = "";
  CARGO_PKG_NAME = "cargo-nix-build-test-environment";
  CARGO_PKG_README = "";
  CARGO_PKG_REPOSITORY = "";
  CARGO_PKG_RUST_VERSION = "";
  CARGO_PKG_VERSION = "0.1.0";
  CARGO_PKG_VERSION_MAJOR = "0";
  CARGO_PKG_VERSION_MINOR = "1";
  CARGO_PKG_VERSION_PATCH = "0";
  CARGO_PKG_VERSION_PRE = "";
  CARGO_PRIMARY_PACKAGE = "1";
  CARGO_SBOM_PATH = "";

  buildPhase = ''
    OUT_DIR=$(mktemp -d)
    INC_DIR=$(mktemp -d)

    cd $src
  
    ${pkgs.rustc}/bin/rustc \
    --crate-name cargo_nix_build_test_environment \
    src/main.rs \
    --diagnostic-width=209 \
    --crate-type bin \
    --emit=dep-info,link \
    -C embed-bitcode=no \
    -C debuginfo=2 \
    -C metadata=c855212e9fc4133f \
    -C extra-filename=-07a9fdbb80205139 \
    --out-dir $OUT_DIR \
    -C incremental=$INC_DIR \
    -L dependency=${termcolor-1_4_1} \
    --extern termcolor=${termcolor-1_4_1}/libtermcolor-78d6a6b6a8a8b71f.rlib
  '';

  installPhase = ''
    mkdir -p $out
    cp $OUT_DIR/cargo_nix_build_test_environment-07a9fdbb80205139 $out/cargo_nix_build_test_environment
    #link_or_copy from: "/home/nixos/cargo-nix-build-test-environment/target/debug/deps/cargo_nix_build_test_environment-07a9fdbb80205139" -> "/home/nixos/cargo-nix-build-test-environment/target/debug/cargo-nix-build-test-environment
  '';

  testPhase = ''
    cd $out
    ./cargo_nix_build_test_environment | grep "green text" > /dev/null
  '';
}

# # CARGO=/home/nixos/cargo/target/debug/cargo 
# # CARGO_BIN_NAME=cargo-nix-build-test-environment 
# # CARGO_CRATE_NAME=cargo_nix_build_test_environment 
# # CARGO_MANIFEST_DIR=/home/nixos/cargo-nix-build-test-environment 
# # CARGO_MANIFEST_PATH=/home/nixos/cargo-nix-build-test-environment/Cargo.toml 
# # CARGO_PKG_AUTHORS='' CARGO_PKG_DESCRIPTION='' 
# # CARGO_PKG_HOMEPAGE='' CARGO_PKG_LICENSE='' 
# # CARGO_PKG_LICENSE_FILE='' CARGO_PKG_NAME=cargo-nix-build-test-environment CARGO_PKG_README='' 
# # CARGO_PKG_REPOSITORY='' CARGO_PKG_RUST_VERSION='' 
# # CARGO_PKG_VERSION=0.1.0 
# # CARGO_PKG_VERSION_MAJOR=0 
# # CARGO_PKG_VERSION_MINOR=1 
# # CARGO_PKG_VERSION_PATCH=0 
# # CARGO_PKG_VERSION_PRE='' 
# # CARGO_PRIMARY_PACKAGE=1 
# # CARGO_SBOM_PATH='' 
# # LD_LIBRARY_PATH=/home/nixos/cargo-nix-build-test-environment/target/debug/deps 

# #   rustc --crate-name 
# #     cargo_nix_build_test_environment \
# #     --edition=2024 \
# #     src/main.rs \
# #     --error-format=json \
# #     --json=diagnostic-rendered-ansi,artifacts,future-incompat \
# #     --diagnostic-width=209 \
# #     --crate-type bin \
# #     --emit=dep-info,link \
# #     -C embed-bitcode=no \
# #     -C debuginfo=2 \
# #     --check-cfg 'cfg(docsrs,test)' \
# #     --check-cfg 'cfg(feature, values())' \
# #     -C metadata=c855212e9fc4133f \
# #     -C extra-filename=-07a9fdbb80205139 \
# #     --out-dir /home/nixos/cargo-nix-build-test-environment/target/debug/deps \
# #     -C incremental=/home/nixos/cargo-nix-build-test-environment/target/debug/incremental \
# #     -L dependency=/home/nixos/cargo-nix-build-test-environment/target/debug/deps \
# #     --extern termcolor=/home/nixos/cargo-nix-build-test-environment/target/debug/deps/libtermcolor-78d6a6b6a8a8b71f.rlib

# # link_or_copy from: "/home/nixos/cargo-nix-build-test-environment/target/debug/deps/cargo_nix_build_test_environment-07a9fdbb80205139" -> "/home/nixos/cargo-nix-build-test-environment/target/debug/cargo-nix-build-test-environment
