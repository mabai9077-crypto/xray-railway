#!/bin/sh
set -e

UUID="${UUID:?UUID environment variable is required}"
WS_PATH="${WS_PATH:-/ray}"
PORT="${PORT:-8080}"

cat > /usr/local/xray/config.json <<EOF
{
  "log": { "loglevel": "warning" },
  "inbounds": [
    {
      "listen": "0.0.0.0",
      "port": ${PORT},
      "protocol": "vless",
      "settings": {
        "clients": [ { "id": "${UUID}" } ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "security": "none",
        "wsSettings": { "path": "${WS_PATH}" }
      }
    }
  ],
  "outbounds": [
    { "protocol": "freedom", "tag": "direct" }
  ]
}
EOF

exec /usr/local/xray/xray run -config /usr/local/xray/config.json
