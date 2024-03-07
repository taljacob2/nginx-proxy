# nginx-proxy

Use this nginx server to proxy to another server.
That means, all the requests that this server will have, will be forwarded to the destination server you specify.

## Usage

### Build The Image

```sh
docker build . -t nginx-proxy
```

### Run The Image

#### Set A Server Proxy

```sh
docker run -d --name nginx-proxy -p <local-port>:80 -e "DESTINATION_SERVER=http://<destination-ip>:<destination-port>" ghcr.io/taljacob2/nginx-proxy
```

> Default value of `DESTINATION_HOST` is used, and is set to `localhost` (i.e. the host machine of the docker socket).

#### Set A Host Name

```sh
docker run -d --name nginx-proxy -p <local-port>:80 -e "DESTINATION_HOST=<app.example.com>" nginx-proxy
```

> Default value of `DESTINATION_SERVER` is used, and is set to `http://172.17.0.1:80` (i.e. the host machine of the docker socket).

#### Set A Server Proxy With A Host Name

```sh
docker run -d --name nginx-proxy -p <local-port>:80 -e "DESTINATION_HOST=<app.example.com>" -e "DESTINATION_SERVER=http://<destination-ip>:<destination-port>" ghcr.io/taljacob2/nginx-proxy
```

