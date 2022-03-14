FROM gitpod/workspace-base:latest
USER root
RUN curl -s https://packagecloud.io/install/repositories/wasmcloud/core/script.deb.sh | bash && \
    apt update && \
    install-packages wash zsh
USER gitpod
RUN cp /home/gitpod/.profile /home/gitpod/.profile_orig && \
    curl -fsSL https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain stable \
    && .cargo/bin/rustup component add \
        rust-analysis \
        rust-src \
        rustfmt \
    && .cargo/bin/rustup completions bash | sudo tee /etc/bash_completion.d/rustup.bash-completion > /dev/null \
    && .cargo/bin/rustup completions bash cargo | sudo tee /etc/bash_completion.d/rustup.cargo-bash-completion > /dev/null \
    && grep -v -F -x -f /home/gitpod/.profile_orig /home/gitpod/.profile > /home/gitpod/.bashrc.d/80-rust
ENV PATH=$PATH:$HOME/.cargo/bin
# share env see https://github.com/gitpod-io/workspace-images/issues/472
RUN echo "PATH="${PATH}"" | sudo tee /etc/environment
RUN rustup target add wasm32-unknown-unknown