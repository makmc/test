FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates tor wget && \
    wget -O Xray-linux-64.zip  https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip  && \
    unzip Xray-linux-64.zip && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/* && \
	ntpd -d -q -n -p 0.pool.ntp.org

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
