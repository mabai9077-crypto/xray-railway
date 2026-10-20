FROM alpine:3.20

RUN apk add --no-cache ca-certificates curl unzip tzdata \
    && curl -L -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip" \
    && mkdir -p /usr/local/xray \
    && unzip /tmp/xray.zip -d /usr/local/xray \
    && chmod +x /usr/local/xray/xray \
    && rm -f /tmp/xray.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]
