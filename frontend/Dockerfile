ARG DOCKER_COMPOSE_VERSION
FROM docker/compose:debian-$DOCKER_COMPOSE_VERSION

ARG GO_VERSION
ARG NODE_VERSION

RUN apt-get update && \
    # Install cypress dependencies, curl and git
    apt-get -y install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb procps curl git && \
    # Install nodejs and yarn
    curl -sL https://deb.nodesource.com/setup_$(echo $NODE_VERSION | cut -f1 -d'.').x | bash - && \
    apt-get install -y nodejs && \
    npm -g install yarn && \
    # Install go
    curl -L "https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz" | tar -xz -C /usr/local && \
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

CMD ["bash"]