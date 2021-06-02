ARG go
FROM golang:${go}-alpine

ARG kubectl
ARG kustomize
ARG helm

# Install Curl, Git (required for go get)
RUN apk add --no-cache curl git

# Install kustomize
RUN curl -sL --output - \
  https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${kustomize}/kustomize_v${kustomize}_linux_amd64.tar.gz \
  | tar xvzf - -C /bin

# Install kubectl
RUN curl -sL --output /bin/kubectl https://dl.k8s.io/release/v${kubectl}/bin/linux/amd64/kubectl && \
  chmod +x /bin/kubectl

# Install helm
RUN curl -sL --output - \
  https://get.helm.sh/helm-v${helm}-linux-amd64.tar.gz \
  | tar xvzf - linux-amd64/helm -C /bin && \
  mv /bin/linux-amd64/helm /bin/

WORKDIR /
