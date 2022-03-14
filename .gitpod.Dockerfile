FROM gitpod/workspace-full:latest
USER root
RUN curl -s https://packagecloud.io/install/repositories/wasmcloud/core/script.deb.sh | bash && apt update && install-packages wash
USER gitpod
