A plain Alpine container that maintains a wildcard DNS cert using Lego

# Usage

1. Specify some environment variables
    - DOMAIN: the domain name under which to proxy subdomains without the wildcard label. (eg. for `*.example.com` use `example.com`)
    - DNS: the DNS provider's name as recognized by [Lego](https://go-acme.github.io/lego/dns/)
    - EMAIL: email address to use in certificates
    - Any environment variables required to configure Lego for your DNS provider
2. Persist `/lego` using volumes or bind mounts.
   This volume contains your certificate and key at `.lego/certificates/_.$DOMAIN.crt` and `.lego/certificates/_.$DOMAIN.key` respectively.
   Failure to persist this directory may result in hitting Let's Encrypt rate limits, which can prevent you from obtaining TLS certificates for a week

Example command for Linode:

```bash
docker run -d --restart always --name certs -v tls:/lego \
    -e DOMAIN=example.com -e EMAIL=webmaster@example.com \
    -e DNS=linode -e LINODE_TOKEN=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef \
    lbfalvy/lemego
```

Certs are checked approximately daily, with some variation to get around daily failures.
