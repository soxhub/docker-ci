FROM docker:17-git

ENV helm_version=v2.11.0

RUN apk add --no-cache \
    curl \
    openssl \
    bash

# Install codecov
ADD https://codecov.io/bash /bin/codecov
RUN chmod +x /bin/codecov

# Install aws cli 
RUN apk -U add groff less python py-pip
RUN pip install awscli

# Install helm
RUN wget https://storage.googleapis.com/kubernetes-helm/helm-${helm_version}-linux-amd64.tar.gz -P /tmp
RUN tar -zxvf /tmp/helm-${helm_version}-linux-amd64.tar.gz -C /tmp
RUN mv /tmp/linux-amd64/helm /bin/helm