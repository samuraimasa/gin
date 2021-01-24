FROM golang:1.15.7

WORKDIR /go/src/app

ENV LIB="\
  git \
  curl \
  lsb-release \
  graphviz \
  postgresql-client \
  unzip \
  sudo \
  "

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install $LIB --no-install-recommends -qy \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && go get -u github.com/gin-gonic/gin \
  && go get -u github.com/codegangsta/gin \
  && ls /go/src \
  && cd /go/src/app
