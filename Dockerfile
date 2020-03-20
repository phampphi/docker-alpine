FROM alpine:3.11.3

RUN apk upgrade && \
    apk add --no-cache bash curl jq git openssh && \
    # install yq
    wget https://github.com/mikefarah/yq/releases/download/3.2.1/yq_linux_amd64 -O /usr/bin/yq && \
    chmod +x /usr/bin/yq && \
    # install helm
    wget https://get.helm.sh/helm-v2.16.3-linux-amd64.tar.gz && \
    tar -zxvf helm-v2.16.3-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \ 
    rm -rf /linux-amd64 && \ rm /helm-v2.16.3-linux-amd64.tar.gz && \
    # setup workdir
    mkdir /src && \ 
    # clean up
    rm -rf /var/cache/apk/*

WORKDIR /src
