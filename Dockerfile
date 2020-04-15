FROM alpine/helm:3.1.1
MAINTAINER Tiexin Guo <guotiexin@gmail.com>

RUN apk add --update --no-cache git bash -t deps && \
    helm plugin install https://github.com/hypnoglow/helm-s3.git && \
    apk del --purge deps

LABEL description="Helm 3 plugin for Drone 3, with helm-s3 plugin"
LABEL base="alpine/helm"

ENTRYPOINT [ "/bin/sh" ]
