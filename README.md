# motivation

this repo is used to create a 'light-weight nix abstraction template' based on the build steps created from `cargo build -vv`.

this will then be enhanced further to 

    cargo tree --all-targets
    cargo test --unit-graph -Z unstable-options
    cat unit-graph.jq | jq '.'

see: https://lastlog.de/blog/timeline.html?filter=series::libnix

# how to use

Development environment:

    nix develop

To build the example application do:

    nix-build nix_build/default.nix

To execute afterwards do:

    ./result/cargo_nix_build_test_environment
