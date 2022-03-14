FROM gitpod/workspace-full:latest
USER root
RUN curl -s https://packagecloud.io/install/repositories/wasmcloud/core/script.deb.sh | bash && \
    apt update && \
    install-packages wash
RUN bash -cl "rustup toolchain install stable && \
    rustup target add wasm32-unknown-unknown && \
    rustup default stable"
USER gitpod
RUN rustup default stable
