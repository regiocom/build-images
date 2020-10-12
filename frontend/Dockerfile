ARG docker_compose
FROM docker/compose:debian-$docker_compose

ARG go
ARG node

RUN apt-get update && \
    # Install cypress dependencies, curl and git
    apt-get -y install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb procps curl git && \
    # Install nodejs and yarn
    curl -sL https://deb.nodesource.com/setup_$(echo $node | cut -f1 -d'.').x | bash - && \
    apt-get install -y nodejs && \
    npm -g install yarn && \
    # Install go
    curl -L "https://golang.org/dl/go$go.linux-amd64.tar.gz" | tar -xz -C /usr/local && \
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

CMD ["bash"]