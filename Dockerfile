FROM ghcr.io/actions/actions-runner:2.319.1

RUN sudo apt update -y && \
    sudo apt install -y \
    curl