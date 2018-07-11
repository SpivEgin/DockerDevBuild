FROM quay.io/spivegin/golang_dart

RUN apt-get install -y gnupg2 tar git curl wget apt-transport-https ca-certificates
RUN apt-get install -y build-essential
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add && echo 'deb https://deb.nodesource.com/node_8.x stretch main' > /etc/apt/sources.list.d/nodesource.list && echo 'deb-src https://deb.nodesource.com/node_8.x stretch main' >> /etc/apt/sources.list.d/nodesource.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y nodejs yarn && apt-get clean
