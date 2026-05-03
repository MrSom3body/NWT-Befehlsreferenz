alias w := watch
alias b := build

default:
    @just --list

watch:
    #!/usr/bin/env sh
    if [ -n "$IN_NIX_SHELL" ]; then
        nix run .#watch
    else
        typst watch main.typ
    fi

build:
    #!/usr/bin/env sh
    if [ -n "$IN_NIX_SHELL" ]; then
        nix run .#build
    else
        typst compile main.typ
    fi
