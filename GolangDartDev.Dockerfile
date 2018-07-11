FROM quay.io/spivegin/dart_dev:latest

ENV GO_VERSION=1.9.2
RUN mkdir /opt/golang /opt/tmp /opt/src
ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/
RUN tar -C /usr/local -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    export PATH=$PATH:/usr/local/go/bin &&\
    export GOPATH=/opt/src/ &&\
    ln -s /usr/local/go/bin/* /bin/ &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz

ENV GOPATH=/opt/src/
WORKDIR /opt/src/
