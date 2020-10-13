ARG docker_compose
FROM docker/compose:debian-${docker_compose}

ARG nvm
ARG go
ARG node

ENV PATH /usr/local/go/bin:$PATH

RUN apt-get update && \
    # Install curl, git and cypress dependencies
    apt-get -y install curl git libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb procps && \
    # Install nvm nodejs and yarn
    curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/${nvm}/install.sh | bash - && \
    export NVM_DIR="$HOME/.nvm" && \
    . /root/.bashrc && \
    nvm install ${node} && \
    npm -g install yarn && \
    # Install go
    curl -L "https://golang.org/dl/go${go}.linux-amd64.tar.gz" | tar -xz -C /usr/local

CMD ["bash"]
