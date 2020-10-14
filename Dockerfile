FROM alpine/helm:3.1.1
MAINTAINER Tiexin Guo <guotiexin@gmail.com>

ENV KUBE_LATEST_VERSION="v1.17.3"

RUN apk add --update --no-cache git bash -t deps && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    helm plugin install https://github.com/hypnoglow/helm-s3.git && \
    apk del --purge deps

LABEL description="Helm 3 plugin for Drone 3, with helm-s3 plugin and kubectl"
LABEL base="alpine/helm"

USER 1000:1000

ENTRYPOINT [ "/bin/sh" ]
