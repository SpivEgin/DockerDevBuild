FROM quay.io/spivegin/golang_dart_dev

RUN mkdir /opt/protoc/
ENV PROTOC=3.5.1 PATH=/opt/protoc/bin/:$PATH
ADD https://github.com/google/protobuf/releases/download/v${PROTOC}/protoc-${PROTOC}-linux-x86_64.zip /opt/protoc/

RUN go get -u google.golang.org/grpc && \
    go get -u github.com/golang/protobuf/protoc-gen-go && \
    cd /opt/protoc/ && unzip protoc-${PROTOC}-linux-x86_64.zip && cd ~ && \
    echo "export PATH=$PATH:~/.pub-cache/bin" >> /root/.bashrc && \
    pub global activate protoc_plugin

