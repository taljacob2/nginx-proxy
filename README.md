# nginx-proxy

Use this nginx server to proxy to another server.
That means, all the requests that this server will have, will be forwarded to the destination server you specify.

## Usage

### Build The Image

```sh
docker build . --build-arg DESTINATION_SERVER=http://<destination-host>:<destination-port> -t nginx-proxy
```

### Run The Image

```sh
docker run -d --name nginx-proxy -p <local-port>:80 nginx-proxy:latest
```
