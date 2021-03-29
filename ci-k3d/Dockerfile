ARG k3d
FROM rancher/k3d:${k3d}-dind

ARG go

RUN apk update && \
    apk add --no-cache ca-certificates bash gcc gnupg go musl-dev openssl && \
    wget -O go.tgz https://storage.googleapis.com/golang/go1.16.2.src.tar.gz && \
    tar -C /usr/local -xzf go.tgz && \
    rm go.tgz && \
    cd /usr/local/go/src && \
    ./make.bash && \
    apk del go

ENV PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV GOPATH=/go
