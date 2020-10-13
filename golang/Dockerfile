ARG go
FROM golang:${go}-alpine

ARG golangci

# Install Curl, Git (required for go get)
RUN apk --no-cache add curl git gcc libc-dev && \
    go get -u \
    gotest.tools/gotestsum \
    github.com/axw/gocov/gocov \
    github.com/AlekSi/gocov-xml && \
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin ${golangci}
