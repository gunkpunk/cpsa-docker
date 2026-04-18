# shipshape

Cryptographic protocols, shipshape. A minimal, portable Docker image for
MITRE's Cryptographic Protocol Shapes Analyzer (CPSA4), pinned to v4.4.8
and set up so you don't need Haskell on your host.

See https://github.com/mitre/cpsa for the upstream project.

## Build

    docker build -t cpsa .

Override the CPSA version:

    docker build --build-arg CPSA_REF=4.4.8 -t cpsa:4.4.8 -t cpsa .

## Usage

### Wrapper script (recommended)

A thin wrapper lives at `bin/cpsa`. Put it on your PATH:

    ln -s "$(pwd)/bin/cpsa" /usr/local/bin/cpsa

Then:

    cpsa cpsa4 -o prob.txt prob.scm
    cpsa make
    cpsa cpsa4init

### Raw docker run

    docker run --rm -v "$PWD:/work" cpsa cpsa4 -o prob.txt prob.scm
    docker run --rm -v "$PWD:/work" cpsa cpsa4graph -o prob.xhtml prob.txt

### Project workflow

    mkdir my-analysis && cd my-analysis
    cpsa cpsa4init
    # drop .scm files in, then:
    cpsa make
    open *.xhtml

## What's in the image

- haskell:9.6 base (GHC + cabal)
- All cpsa4* executables from CPSA 4.4.8
- graphviz for rendering
- make for the cpsa4init-generated Makefile
- Runs as non-root user (uid 1000)

## License

Dockerfile and wrapper are MIT. CPSA itself is BSD-3-Clause.
