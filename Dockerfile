# https://github.com/caddyserver/caddy/releases
ARG CADDY_VERSION=2.11.2
# https://github.com/caddy-dns/netcup/releases
ARG CADDY_DNS_NETCUP_VERSION=1.0.0

FROM caddy:${CADDY_VERSION}-builder AS builder

ARG CADDY_DNS_NETCUP_VERSION
RUN xcaddy build \
    --with github.com/caddy-dns/netcup@v${CADDY_DNS_NETCUP_VERSION}


ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
