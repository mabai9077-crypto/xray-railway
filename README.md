# xray-railway

Xray (VLESS + WebSocket) deployment for Railway. TLS is terminated by Railway's
edge (public domain on port 443); Xray serves plain WebSocket inside the
container.

## Railway variables

- `UUID` — VLESS user ID (required)
- `WS_PATH` — WebSocket path (default `/ray`)
- `PORT` — provided by Railway automatically

## Client settings

- Address: the service's `*.up.railway.app` domain
- Port: 443
- Security: TLS (SNI = the same domain)
- Transport: WebSocket, path = `WS_PATH`
- UUID: the value set in Railway variables
