{ pkgs ? import <nixpkgs> {} }:

let
  callPackage' = pkgs.lib.callPackageWith (pkgs // self);

  self = {
    workspace = callPackage' ./workspace.nix {};
    termcolor-1_4_1 = callPackage' ./deps/termcolor-1.4.1.nix {};
  };
in
self
