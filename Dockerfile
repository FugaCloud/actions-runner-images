FROM ghcr.io/actions/actions-runner:2.319.1

RUN sudo apt update -y && \
    sudo apt install -y \
    curl git

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
