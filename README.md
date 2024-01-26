# nginx-proxy

Use this nginx server to proxy to another server.
That means, all the requests that this server will have, will be forwarded to the destination server you specify.

## Usage

### Build The Image

```
docker build . -t nginx-proxy
```

### Run The Image

```
docker run -d --name nginx-proxy \
-p <local-http-port>:80 \
-e "DESTINATION_HTTP_SERVER=<destination-http-host>:<destination-http-port>" \
-p <local-https-port>:443 \
-e "DESTINATION_HTTPS_SERVER=<destination-https-host>:<destination-https-port>" \
nginx-proxy:latest
```
