FROM haskell:9.6

RUN apt-get update && \
    apt-get install -y --no-install-recommends graphviz make && \
    rm -rf /var/lib/apt/lists/*

ARG CPSA_REF=4.4.8

WORKDIR /opt/cpsa
RUN git clone --depth 1 --branch "${CPSA_REF}" https://github.com/mitre/cpsa.git . && \
    cabal update && \
    cabal install \
        --install-method=copy \
        --installdir=/usr/local/bin \
        --overwrite-policy=always

RUN useradd --create-home --shell /bin/bash cpsa
USER cpsa
WORKDIR /work

CMD ["cpsa4", "-h"]
