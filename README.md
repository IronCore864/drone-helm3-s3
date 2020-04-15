# drone-helm3-s3 Plugin

A docker image based on alpine/helm3, with helm-s3 plugin installed so that you can use AWS S3 bucket as your helm chart repository.

## DockerHub

https://hub.docker.com/repository/docker/ironcore864/drone-helm3-s3

## Usage

### Drone CI Example w/ Kubernetes Runner

```
---
kind: pipeline
type: kubernetes
name: k8s-deploy
# must create yourself so that the pod has permission to deploy in the cluster, or comment this out and use other ways to access k8s like kube_api and token.
service_account_name: drone-k8s-deploy

steps:
  - name: deploy
    image: ironcore864/drone-helm3-s3:alpine3.11-helm3.11
    commands:
      - helm repo add YOUR_REPO_NAME sei s3://YOUR_REPO_S3_BUCKET
      - helm repo update
      - helm upgrade RELEASE_NAME -n NAMESPACE YOUR_REPO_NAME/YOUR_CHART_NAME
    environment:
      AWS_DEFAULT_REGION: REGION_OF_YOUR_S3
      AWS_ACCESS_KEY_ID:
        from_secret: AWS_ACCESS_KEY_ID
      AWS_SECRET_ACCESS_KEY:
        from_secret: AWS_SECRET_ACCESS_KEY

trigger:
  branch:
    - master
  event:
    exclude:
      - pull_request
```
