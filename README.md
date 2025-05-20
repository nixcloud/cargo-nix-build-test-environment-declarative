# motivation

this repo is used to create a light-weight nix abstraction template which is used from cargo to create the nix based build system and execute it.

https://lastlog.de/blog/timeline.html?filter=series::libnix

# how to use

To build the example application do:

  nix-build nix_build/default.nix

To execute afterwards do:

  ./result/cargo_nix_build_test_environment-07a9fdbb80205139