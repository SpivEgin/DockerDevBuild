FROM quay.io/spivegin/tlmbasedebian

# TLM base cockroachDB custom build
# created by oyoshi


RUN mkdir /opt/cockroach /opt/server /opt/config/ /opt/tlmdata /opt/tlmcockroach

ADD ./bin/tlmcockroach /opt/server/tlmkeyc
ADD ./docker/cockroach/cockroach.20180611/ /opt/cockroach/cockroach
ADD ./docker/bash/cockroach_entry.sh /opt/config/entry.sh
ADD https://raw.githubusercontent.com/adbegon/pub/master/AdfreeZoneSSL.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates --verbose &&\
    chmod +x /opt/cockroach/cockroach &&\
    ln -s /opt/cockroach/cockroach /usr/local/bin/cockroach &&\
    chmod +x /opt/server/tlmkeyc &&\
    ln -s /opt/server/tlmkeyc /usr/local/bin/tlmkeyc &&\
    chmod +x /opt/config/entry.sh &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV LOAD_WAIT=5 \
    NATS_ADDRESS=tls://192.168.1.140 \
    NATS_PORT=443\
    ONEPASS=oJEh7MeaX3Wdcj3CfCUs \
    COCKROACH_SKIP_ENABLING_DIAGNOSTIC_REPORTING=true\
    HOST_IPADDRESS=0.0.0.0 \
    HOST_PORT=8080\
    ADVERTISE_HOST=0.0.0.0



WORKDIR /opt/tlmcockroach

EXPOSE 8080 26257
#ENTRYPOINT ["bash"]
CMD ["/opt/config/entry.sh"]
