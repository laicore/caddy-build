FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/abiosoft/caddy-yaml
    # --with github.com/abiosoft/caddy-json-schema \ 

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
