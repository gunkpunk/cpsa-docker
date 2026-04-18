# cpsa-docker

Portable Docker setup for MITRE's Cryptographic Protocol Shapes Analyzer
(CPSA4), pinned to v4.4.8. Lets you run CPSA without installing Haskell
on your host.

See https://github.com/mitre/cpsa for the upstream project.

## Build

    docker build -t cpsa .

## Usage

One-shot:

    docker run --rm -v "$PWD:/work" cpsa cpsa4 -o prob.txt prob.scm
    docker run --rm -v "$PWD:/work" cpsa cpsa4graph -o prob.xhtml prob.txt
    open prob.xhtml

Project workflow (recommended):

    mkdir my-analysis && cd my-analysis
    docker run --rm -v "$PWD:/work" cpsa cpsa4init
    # drop .scm files in, then:
    docker run --rm -v "$PWD:/work" cpsa make
    open *.xhtml

## What is in the image

- haskell:9.6 base (GHC + cabal)
- All cpsa4* executables from CPSA 4.4.8
- graphviz for rendering
- make for the cpsa4init-generated Makefile

## License

Dockerfile is MIT. CPSA is BSD-3-Clause.

## Wrapper script

A convenience wrapper lives at `bin/cpsa`. Put it on your PATH:

    ln -s "$(pwd)/bin/cpsa" /usr/local/bin/cpsa

Then:

    cpsa cpsa4 -o prob.txt prob.scm
    cpsa make
    cpsa cpsa4init
